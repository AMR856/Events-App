import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/event_manager.dart';
import 'package:evently/core/widgets/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorsManager.darkBlue
                  : ColorsManager.lightBlue,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24.r),
              ),
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
                            color:
                                Theme.of(context).brightness == Brightness.dark
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
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: EventManager.events.length - 1,
              itemBuilder: (context, index) {
                return EventWidget(
                  index: index,
                  monthDay: 21,
                  month: 'Nov',
                  content: 'This is a birthday party',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
