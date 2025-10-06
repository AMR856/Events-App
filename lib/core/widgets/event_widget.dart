import 'package:evently/core/models/event_widget_model.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/event_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventWidget extends StatefulWidget {
  final EventWidgetModel model;

  const EventWidget({super.key, required this.model});

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
          image: AssetImage(
            Theme.of(context).brightness == Brightness.dark
                ? EventManager.getDarkEvents(context)[widget.model.index].photo!
                : EventManager.getEvents(context)[widget.model.index].photo!,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                children: [
                  Text(
                    '${widget.model.monthDay}',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.lightBlue,
                    ),
                  ),
                  Text(
                    widget.model.month,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.model.content,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        widget.model.toggleFavorite(widget.model.index),
                    child: Icon(
                      widget.model.isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_outlined,
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
