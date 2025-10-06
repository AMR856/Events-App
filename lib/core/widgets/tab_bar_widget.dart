import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently/core/widgets/tab_bar_event_widget.dart';

class TabBarWidget extends StatefulWidget {
  final void Function(int) changeSelected;
  final int? currentSelectedIndex;
  final int itemsCount;
  final bool isAll;
  final Color selectedBackgroundColor;
  final Color borderColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  const TabBarWidget({
    super.key,
    required this.currentSelectedIndex,
    required this.changeSelected,
    required this.itemsCount,
    required this.selectedBackgroundColor,
    required this.borderColor,
    required this.selectedTextColor,
    required this.unselectedTextColor, required this.isAll,
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      child: SizedBox(
        height: 40.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.itemsCount,
          itemBuilder: (context, index) => TabBarEventWidget(
            index: index,
            isSelected: index == widget.currentSelectedIndex,
            selectedCallback: widget.changeSelected,
            selectedBackgroundColor: widget.selectedBackgroundColor,
            borderColor: widget.borderColor,
            selectedTextColor: widget.selectedTextColor,
            unselectedTextColor: widget.unselectedTextColor,
            isAll: widget.isAll,
          ),
        ),
      ),
    );
  }
}
