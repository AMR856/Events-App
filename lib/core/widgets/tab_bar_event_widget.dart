import 'package:evently/core/resources/event_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarEventWidget extends StatefulWidget {
  final int index;
  final bool isSelected;
  final void Function(int) selectedCallback;

  final Color selectedBackgroundColor;
  final Color borderColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  const TabBarEventWidget({
    super.key,
    required this.index,
    required this.isSelected,
    required this.selectedCallback,
    required this.selectedBackgroundColor,
    required this.borderColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
  });

  @override
  State<TabBarEventWidget> createState() => _TabBarEventWidgetState();
}

class _TabBarEventWidgetState extends State<TabBarEventWidget> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.isSelected;

    return InkWell(
      onTap: () => widget.selectedCallback(widget.index),
      borderRadius: BorderRadius.circular(46.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: isSelected
              ? widget.selectedBackgroundColor
              : null,
          border: Border.all(
            color: widget.borderColor,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(46.r),
        ),
        child: Row(
          children: [
            Icon(
              EventManager.events[widget.index].icon,
              color: isSelected
                  ? widget.selectedTextColor
                  : widget.unselectedTextColor,
            ),
            SizedBox(width: 8.w),
            Text(
              EventManager.events[widget.index].name,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: isSelected
                    ? widget.selectedTextColor
                    : widget.unselectedTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
