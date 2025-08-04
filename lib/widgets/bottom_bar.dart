import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../themes/main/colors.dart';

class BottomBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomBar({
    super.key,
    required this.navigationShell,
  });

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

  @override
  Widget build(BuildContext context) {
    return Container(
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
            label: 'Домой',
            onSelect: onSelect(0),
            isActive: isActive(0),
          ),
          BottomTabItem(
            icon: AssetImage('assets/icons/icon_route.png'),
            label: 'Заявки',
            onSelect: onSelect(1),
            isActive: isActive(1),
          ),
          BottomTabItem(
            icon: AssetImage('assets/icons/icon_discharge.png'),
            label: 'Слив',
            onSelect: onSelect(3),
            isActive: isActive(3),
          ),
          BottomTabItem(
            icon: AssetImage('assets/icons/icon_call.png'),
            label: 'Диспетчер',
            onSelect: onSelect(2),
            isActive: isActive(2),
          ),
        ],
      ),
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
