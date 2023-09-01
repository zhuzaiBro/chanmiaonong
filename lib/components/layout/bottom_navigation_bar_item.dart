// ignore: file_names
import 'package:flutter/cupertino.dart';

class BottomNavigationBarItem {
  BottomNavigationBarItem({
    required this.icon,
    this.label,
    Widget? activeIcon,
    this.backgroundColor,
    this.tooltip,
  })  : activeIcon = activeIcon ?? icon,
        // ignore: unnecessary_null_comparison
        assert(icon != null);

  Animation<double>? animation;

  late int index;

  late Widget icon;

  final Widget activeIcon;

  final String? label;

  final Color? backgroundColor;

  final String? tooltip;
}
