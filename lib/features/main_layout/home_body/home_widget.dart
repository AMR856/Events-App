import 'package:evently/core/models/event_widget_model.dart';
import 'package:evently/core/widgets/tab_bar_widget.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/tab_index_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/event_manager.dart';
import 'package:evently/core/widgets/event_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
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
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);

    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

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
            bottom: false,
            left: false,
            right: false,
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
                            '${appLocalizations.welcome_back}✨',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            'Clementine',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () => themeProvider.toggleTheme(),
                        icon: Icon(
                          Theme.of(context).brightness == Brightness.light
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode_outlined,
                          size: 32.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      InkWell(
                        onTap: () => langProvider.toggleLang(),
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
                              langProvider.currentLang == Locale('en')
                                  ? appLocalizations.en
                                  : appLocalizations.ar,
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
                  Consumer<TabIndexProvider>(
                    builder: (context, provider, _) {
                      return TabBarWidget(
                        currentSelectedIndex: provider.selectedIndex,
                        changeSelected: provider.changeIndex,
                        itemsCount: EventManager.getEventsWithAll(
                          context,
                        ).length,
                        selectedBackgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? ColorsManager.lightBlue
                            : ColorsManager.blueWhite,
                        unselectedTextColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? ColorsManager.white4F
                            : ColorsManager.blueWhite,
                        borderColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? ColorsManager.lightBlue
                            : ColorsManager.blueWhite,
                        selectedTextColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? ColorsManager.white4F
                            : ColorsManager.lightBlue,
                        isAll: true,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: EventManager.getEvents(context).length,
            itemBuilder: (context, index) {
              return EventWidget(model: dummyEvents[index]);
            },
          ),
        ),
      ],
    );
  }

  void _toggleFavorite(int index) {
    dummyEvents[index].isFavorite = !dummyEvents[index].isFavorite;
    setState(() {});
  }

  String _getMonthAbbreviation(int monthNumber) {
    final date = DateTime(2025, monthNumber, 1);
    return DateFormat('MMM').format(date);
  }
}
