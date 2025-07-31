import 'package:flutter/material.dart';
import 'package:flutter_test_app/widgets/safe_frame.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../themes/main/colors.dart';
import '../widgets/base_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void goToTransfers() => context.go('/transfers');

    viewTheTransfer(String id) => () => context.go('/home/transfer/$id');
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMMd').format(now);
    String formattedDay = DateFormat('E').format(now);

    return SafeFrame(
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 10),
            child: Text(
              formattedDate,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Text(
            formattedDay,
            style: TextStyle(
              fontSize: 12,
              color: ThemeColors.textPrimary.withAlpha(100),
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: ThemeColors.bottomBarBackground,
            ),
            child: Row(
              children: [
                BaseButton(
                  onTap: () => context.go('/home/profile'),
                  child: Image.asset(
                    'assets/photos/profile-photo.png',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
                BaseButton(
                  expanded: true,
                  onTap: () => context.go('/home/profile'),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      'Константин\nКонстантинопольски',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainButton(
                icon: ImageIcon(AssetImage('assets/icons/icon_call.png')),
                label: 'Problem',
                onTap: () => context.go('/help'),
              ),
              SizedBox(width: 10),
              MainButton(
                icon: ImageIcon(AssetImage('assets/icons/icon_call.png')),
                label: 'Problem',
                onTap: () => context.go('/help'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              MainButton(
                icon: ImageIcon(AssetImage('assets/icons/icon_call.png')),
                label: 'Transfers',
                onTap: () => context.go('/transfers'),
              ),
              SizedBox(width: 10),
              MainButton(
                icon: ImageIcon(AssetImage('assets/icons/icon_call.png')),
                label: 'Call dispatch',
                onTap: () => context.go('/help'),
              ),
              // Expanded(
              //   child: SizedBox(),
              // ),
              // BaseButton(
              //   icon: ImageIcon(AssetImage('assets/icons/icon_call.png')),
              //   label: 'Problem',
              // ),
            ],
          )

          ///
        ],
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback? onTap;

  const MainButton({
    super.key,
    this.onTap,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      expanded: true,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

// class _TransfersBottomSheet extends StatelessWidget {
//   const _TransfersBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.3,
//       minChildSize: 0.3,
//       maxChildSize: 1,
//       builder: (_, controller) {
//         return Container(
//           decoration: BoxDecoration(
//             color: ThemeColors.bottomBarBackground,
//             borderRadius: BorderRadius.vertical(
//               top: Radius.circular(20),
//             ),
//           ),
//           padding: EdgeInsets.all(16),
//           child: ListView(
//             controller: controller,
//             children: [
//               Text(
//                   'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet'),
//               Text(
//                   'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet'),
//               Text(
//                   'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet'),
//               Text(
//                   'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet'),
//               Text(
//                   'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet'),
//               Text(
//                   'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet'),
//               Text(
//                   'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet'),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
