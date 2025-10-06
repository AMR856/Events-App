import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 19.5.h),
              child: TextField(
                readOnly: true,
                onTap: () {
                },
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.lightBlue
                ),
                decoration: InputDecoration(
                  hintText: 'Search for Event',
                  hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.lightBlue
                  ),
                  prefixIcon: Icon(Icons.search, color: ColorsManager.lightBlue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: ColorsManager.lightBlue.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: ColorsManager.lightBlue,
                      width: 2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: ColorsManager.lightBlue.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                ),

              ),
            ),

            Expanded(child: Center(child: Text('Favorite Events List Here'))),
          ],
        ),
      ),
    );
  }
}
