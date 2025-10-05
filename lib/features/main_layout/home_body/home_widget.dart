import 'package:evently/core/models/event_widget_model.dart';
import 'package:evently/core/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/event_manager.dart';
import 'package:evently/core/widgets/event_widget.dart';
import 'package:evently/core/widgets/tab_bar_event_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  int? currentSelectedIndex;
  List<EventWidgetModel> dummyEvents = [];

  @override
  void initState() {
    super.initState();
    dummyEvents = List.generate(10, (index) {
      return EventWidgetModel(
        index: index,
        monthDay: index + 1,
        month: _getMonthAbbreviation(5),
        content: 'Event num ${index + 1}',
        isFavorite: false,
        toggleFavorite: _toggleFavorite,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorsManager.darkBlue
                : ColorsManager.lightBlue,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back ✨',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            'Clementine',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.light_mode_outlined, size: 32.sp),
                      SizedBox(width: 12.w),
                      InkWell(
                        onTap: () {},
                        child: Card(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? ColorsManager.white4F
                              : ColorsManager.blueWhite,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 8.h,
                            ),
                            child: Text(
                              'EN',
                              style: Theme.of(context).textTheme.titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? ColorsManager.darkBlue
                                        : ColorsManager.lightBlue,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 30.sp),
                      SizedBox(width: 4.w),
                      Text(
                        'Cairo, Egypt',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  TabBarWidget(currentSelectedIndex: currentSelectedIndex, changeSelected: _changeSelected, itemsCount: EventManager.events.length),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: EventManager.events.length - 1,
            itemBuilder: (context, index) {
              return EventWidget(model: dummyEvents[index]);
            },
          ),
        ),
      ],
    );
  }

  void _changeSelected(int index) {
    currentSelectedIndex = index;
    setState(() {});
  }

  void _toggleFavorite(int index) {
    dummyEvents[index].isFavorite = !dummyEvents[index].isFavorite;
    setState(() {

    });
  }

  String _getMonthAbbreviation(int monthNumber) {
    final date = DateTime(2025, monthNumber, 1);
    return DateFormat('MMM').format(date);
  }
}
