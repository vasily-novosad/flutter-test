import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/themes/main/colors.dart';
import 'package:go_router/go_router.dart';

class BottomNavigatorWrapper extends StatelessWidget {
  const BottomNavigatorWrapper({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));

    OnItemSelect onSelect(int index) {
      return () {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      };
    }

    bool isActive(int index) {
      return index == navigationShell.currentIndex;
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        height: 68,
        margin: EdgeInsets.only(
          right: 12,
          bottom: 12,
          left: 12,
        ),
        decoration: BoxDecoration(
          color: ThemeColors.bottomBarBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withAlpha(10),
              blurRadius: 8,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomTabItem(
              icon: AssetImage('assets/icons/icon_home.png'),
              label: 'Home',
              onSelect: onSelect(0),
              isActive: isActive(0),
            ),
            BottomTabItem(
              icon: AssetImage('assets/icons/icon_route.png'),
              label: 'Transfers',
              onSelect: onSelect(1),
              isActive: isActive(1),
            ),
            BottomTabItem(
              icon: AssetImage('assets/icons/icon_call.png'),
              label: 'Help',
              onSelect: onSelect(2),
              isActive: isActive(2),
            ),
            BottomTabItem(
              icon: AssetImage('assets/icons/icon_discharge.png'),
              label: 'Discharge',
              onSelect: onSelect(3),
              isActive: isActive(3),
            ),
            BottomTabItem(
              icon: AssetImage('assets/icons/icon_menu.png'),
              label: 'Menu',
              onSelect: onSelect(4),
              isActive: isActive(4),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

typedef OnItemSelect = void Function();

class BottomTabItem extends StatelessWidget {
  final String label;
  final AssetImage icon;
  final OnItemSelect onSelect;
  final bool isActive;

  const BottomTabItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onSelect,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          child: Material(
            borderRadius: BorderRadius.circular(20),
        color: ThemeColors.bottomBarBackground,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onSelect,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                icon,
                size: 26,
                color: isActive
                    ? ThemeColors.primaryColor
                    : ThemeColors.textPrimary,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isActive
                      ? ThemeColors.primaryColor.withAlpha(150)
                      : ThemeColors.textPrimary.withAlpha(150),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
