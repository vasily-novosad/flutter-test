import 'package:flutter/material.dart';
import 'package:flutter_test_app/widgets/button.dart';
import 'package:flutter_test_app/widgets/safe_frame.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../themes/main/colors.dart';
import '../widgets/base_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeFrame(
      children: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenHeader(),
            ProfileBox(),
            SizedBox(height: 20),
            ButtonsList(),
          ],
        ),
      ),
    );
  }
}

class ButtonsList extends StatelessWidget {
  const ButtonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        ),
        SizedBox(height: 10),
        Row(
          children: [
            MainButton(
              variant: ButtonVariant.accent,
              icon: ImageIcon(AssetImage('assets/icons/icon_call.png'),
                  color: ThemeColors.surface),
              label: 'Открыть смену',
              onTap: () => context.go('/home/shift-open'),
            ),
            Expanded(
              child: SizedBox(),
            )
          ],
        ),
      ],
    );
  }
}

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('MMMMd').format(now);
    final String formattedDay = DateFormat('E').format(now);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
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
        )
      ],
    );
  }
}

class ProfileBox extends StatelessWidget {
  const ProfileBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class MainButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback? onTap;
  final ButtonVariant? variant;

  const MainButton({
    super.key,
    this.onTap,
    required this.label,
    required this.icon,
    this.variant,
  });

  List<Color> resolveColors() {
    List<Color> list = [];

    if (variant != null && variant == ButtonVariant.accent) {
      list.add(ThemeColors.primaryColor);
      list.add(ThemeColors.surface);

      return list;
    }

    list.add(ThemeColors.bottomBarBackground);
    list.add(ThemeColors.textPrimary);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = resolveColors();

    return BaseButton(
      color: colors[0],
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
              child: Text(
                label,
                style: TextStyle(color: colors[1]),
              ),
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
