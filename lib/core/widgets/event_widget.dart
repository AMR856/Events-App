import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/event_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventWidget extends StatefulWidget {
  final int index;
  final int monthDay;
  final String month;
  final String content;
  const EventWidget({super.key, required this.index, required this.monthDay, required this.month, required this.content});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      height: 204.h,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(EventManager.events[widget.index + 1].photo!),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 8.h,
              ),
              child: Column(
                children: [
                  Text(
                    '${widget.monthDay}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.lightBlue,
                    ),
                  ),
                  Text(
                    widget.month,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 8.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.content,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Icon(
                      Icons.favorite_outline_outlined,
                      color: ColorsManager.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
