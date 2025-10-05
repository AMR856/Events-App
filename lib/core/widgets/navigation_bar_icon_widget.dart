import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationBarIconWidget extends StatefulWidget {
  final int currentSelectedIndex;
  final int iconIndex;
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final void Function(int) iconCallback;
  const NavigationBarIconWidget({
    super.key,
    required this.currentSelectedIndex,
    required this.iconIndex,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.iconCallback,
  });

  @override
  State<NavigationBarIconWidget> createState() =>
      _NavigationBarIconWidgetState();
}

class _NavigationBarIconWidgetState extends State<NavigationBarIconWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.currentSelectedIndex == widget.iconIndex
            ? widget.selectedIcon
            : widget.unSelectedIcon,
        size: 30.sp,
      ),
      onPressed: () => widget.iconCallback(widget.iconIndex),
    );
  }
}
