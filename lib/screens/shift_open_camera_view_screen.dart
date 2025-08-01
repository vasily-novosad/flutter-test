import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/themes/main/colors.dart';
import 'package:flutter_test_app/widgets/base_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import './shift_open_photos.dart';

class ShiftOpenCameraViewScreen extends StatefulWidget {
  const ShiftOpenCameraViewScreen({super.key});

  @override
  State<StatefulWidget> createState() => ShiftOpenCameraViewScreenState();
}

class ShiftOpenCameraViewScreenState extends State<ShiftOpenCameraViewScreen> {
  int index = 0;
  bool _isCameraInitialized = false;
  bool _isCameraPermissionGranted = false;
  bool _isRearCameraSelected = false;
  CameraController? controller;
  FlashMode? _currentFlashMode;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  List<CameraDescription> cameras = [];

  Future<void> getPermissionStatus() async {
    await Permission.camera.request();
    var status = await Permission.camera.status;

    if (status.isGranted) {
      print('Camera Permission: GRANTED');
      setState(() {
        _isCameraPermissionGranted = true;
      });
      // Set and initialize the new camera
      cameras = await availableCameras();

      onNewCameraSelected(cameras[0]);
    } else {
      print('Camera Permission: DENIED');
    }
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await previousCameraController?.dispose();

    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) {
        setState(() {
          // do nothing
        });
      }
    });

    try {
      await cameraController.initialize();
      await Future.wait([
        cameraController
            .getMinExposureOffset()
            .then((value) => _minAvailableExposureOffset = value),
        cameraController
            .getMaxExposureOffset()
            .then((value) => _maxAvailableExposureOffset = value),
        cameraController
            .getMaxZoomLevel()
            .then((value) => _maxAvailableZoom = value),
        cameraController
            .getMinZoomLevel()
            .then((value) => _minAvailableZoom = value),
      ]);

      _currentFlashMode = controller!.value.flashMode;
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;

    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();

      return file;
    } on CameraException catch (e) {
      print('Error occurred while taking picture: $e');

      return null;
    }
  }

  @override
  void initState() {
    // Hide the status bar in Android
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    getPermissionStatus();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    controller!.setExposurePoint(offset);
    controller!.setFocusPoint(offset);
  }

  @override
  Widget build(BuildContext context) {
    if (_isCameraPermissionGranted != true || _isCameraInitialized != true) {
      return Expanded(
        child: Text('Camera not complete'),
      );
    }

    double aspectRatio = controller != null ? controller!.value.aspectRatio : 1;

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Stack(
        children: [
          CameraPreview(
            controller!,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (details) {
                    onViewFinderTap(details, constraints);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 120.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(),
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(120.0),
                        color: ThemeColors.primaryColor,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(120.0),
                          onTap: () async {
                            XFile? rawImage = await takePicture();
                            if (rawImage == null) {
                              Fluttertoast.showToast(
                                  msg: "Не удалось получить изображение",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              return;
                            }

                            File imageFile = File(rawImage.path);

                            final cacheDir =
                                await getApplicationCacheDirectory();

                            String fileFormat = imageFile.path.split('.').last;

                            final DateTime now = DateTime.now();
                            final String currentLabel =
                                '${now.year}:${now.month}:${now.day}';
                            // Fluttertoast.showToast(
                            //   msg: currentLabel,
                            // );
                            // Fluttertoast.showToast(
                            //   msg: 'cacheDir.path: ${cacheDir.path}',
                            //   fontSize: 16.0,
                            //   toastLength: Toast.LENGTH_LONG,
                            // );

                            await imageFile.copy(
                              '${cacheDir.path}/$currentLabel.$fileFormat',
                            );

                            streamController.add(
                              FileEvent(
                                filename:
                                    '${cacheDir.path}/$currentLabel.$fileFormat',
                                index: index,
                              ),
                            );
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                    ),
                    BaseButton(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ImageIcon(
                            AssetImage('assets/icons/icon_camera_reverse.png')),
                      ),
                      onTap: () {
                        setState(() {
                          _isCameraInitialized = false;
                        });
                        final int cameraIndex = _isRearCameraSelected ? 1 : 0;
                        CameraDescription selectedCamera = cameras[cameraIndex];
                        onNewCameraSelected(selectedCamera);

                        setState(() {
                          _isRearCameraSelected = !_isRearCameraSelected;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
