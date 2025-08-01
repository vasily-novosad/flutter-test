import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:flutter_test_app/widgets/button.dart';
import 'package:go_router/go_router.dart';

final streamController = StreamController<FileEvent>.broadcast();

class ShiftOpenPhotosScreen extends StatefulWidget {
  const ShiftOpenPhotosScreen({super.key});

  @override
  State<StatefulWidget> createState() => ShiftOpenPhotosScreenState();
}

class FileEvent {
  final String? filename;
  final int index;

  const FileEvent({this.filename, required this.index});
}

class ShiftOpenPhotosScreenState extends State<ShiftOpenPhotosScreen> {
  @override
  Widget build(BuildContext context) {
    streamController.stream
        .listen(
          (event) => print('Event: $event'),
          onDone: () => print('Done'),
          onError: (error) => print(error),
        )
        .cancel();

    return SafeArea(
      child: Column(
        children: [
          MyAppbar(title: 'Фотоотчет'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Сделайте фотоотчет',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        'assets/photos/truck-01.png',
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              'ISUZU 1',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              'B5d FFF',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Сделайте фотоотчет вот так и вот сяк, чтобы было хорошо все видно, ну вот прям совсем качественно, иначе я не знаю какой текст здесь пихать',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 80),
                  Text('Фото первое:'),
                  InteractiveImage(index: 0),
                  SizedBox(height: 20),
                  // InteractiveImage(index: 1),
                  // SizedBox(height: 20),
                  // InteractiveImage(index: 2),
                  Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 40),
                    child: Center(
                      child: Button(
                        variant: ButtonVariant.accent,
                        text: 'Отправить данные',
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          context.go('/transfers');

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Смена успешно открыта'),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InteractiveImage extends StatelessWidget {
  final int index;

  const InteractiveImage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: StreamBuilder<FileEvent>(
        stream: streamController.stream,
        initialData: FileEvent(index: index),
        builder: (context, snap) {
          String? fName = snap.data!.filename;
          int? idx = snap.data!.index;

          return GestureDetector(
            child: Image(
              image: fName != null && index == idx
                  ? FileImage(File(fName))
                  : AssetImage('assets/ui/no_image.jpg'),
              height: 720,
              fit: BoxFit.cover,
            ),
            onTap: () => context.go('/home/shift-open/photos/camera'),
          );
        },
      ),
    );
  }
}
