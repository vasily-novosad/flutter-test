// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';

// class BottomNav extends StatelessWidget {
//   final double iconSize = 18;
//   const BottomNav({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       key: key,
//       elevation: 12,
//       onTap: (index) {
//         switch (index) {
//           case 0:
//             context.go('/profile');
//             break;
//           case 1:
//             context.go('/profile/second');
//             break;
//         }
//       },
//       items: [
//         BottomNavigationBarItem(
//             label: 'Home',
//             icon: SvgPicture.asset(
//               'assets/svg/via-profit-new-logo.svg',
//               width: iconSize,
//             )),
//         BottomNavigationBarItem(
//           label: 'Second',
//           icon: SvgPicture.asset(
//             'assets/svg/via-profit-new-logo.svg',
//             width: iconSize,
//           ),
//         ),
//       ],
//     );
//   }
// }
