import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/image_manager.dart';
import 'package:evently/features/main_layout/profile_body/widgets/custom_dropdown_tab.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.lightBlue,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.r)),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Image.asset(
                    ImageManager.routeLogo,
                    height: 124.h,
                    width: 124.w,
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Clementine',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'amer.live477@gmal.com',
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall!.copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              children: [
                CustomDropdownTab(
                  label: appLocalizations.language,
                  itemsList: ['عربي', 'English'],
                  onChanged: (newLang) {
                    debugPrint(newLang);
                    langProvider.changeLang(
                      newLang == 'English' ? Locale('en') : Locale('ar'),
                    );
                  },
                  currentValue: langProvider.currentLang == Locale('en')
                      ? 'English'
                      : 'عربي',
                ),
                SizedBox(height: 16.h),
                CustomDropdownTab(
                  label: appLocalizations.theme,
                  itemsList: [appLocalizations.light, appLocalizations.dark],
                  onChanged: (newTheme) {
                    themeProvider.changeTheme(
                      newTheme == appLocalizations.light
                          ? ThemeMode.light
                          : ThemeMode.dark,
                    );
                  },
                  currentValue: themeProvider.currentTheme == ThemeMode.dark
                      ? appLocalizations.dark
                      : appLocalizations.light,
                ),
                SizedBox(height: 180.h),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    foregroundColor: ColorsManager.white,
                    backgroundColor: ColorsManager.red,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app_rounded, size: 25.sp),
                        SizedBox(width: 8.w),
                        Text(
                          appLocalizations.logout,
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(color: ColorsManager.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
