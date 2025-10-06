import 'package:evently/core/resources/event_manager.dart';
import 'package:evently/core/widgets/custom_input_field.dart';
import 'package:evently/core/widgets/tab_bar_widget.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/tab_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:provider/provider.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEventScreen> {
  int? currentSelectedIndex;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Create Event'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<TabIndexProvider>(
                builder: (context, provider, _) {
                  final selectedIndex = provider.selectedIndex;
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? EventManager.getDarkEvents(
                              context,
                            )[selectedIndex].photo!
                          : EventManager.getEvents(
                              context,
                            )[selectedIndex].photo!,
                    ),
                  );
                },
              ),
              Consumer<TabIndexProvider>(
                builder: (context, provider, _) {
                  return TabBarWidget(
                    currentSelectedIndex: provider.selectedIndex,
                    changeSelected: provider.changeIndex,
                    itemsCount: EventManager.getEvents(context).length,
                    selectedBackgroundColor: ColorsManager.lightBlue,
                    unselectedTextColor: ColorsManager.lightBlue,
                    borderColor: ColorsManager.lightBlue,
                    selectedTextColor:
                        Theme.of(context).brightness == Brightness.dark
                        ? ColorsManager.darkBlue
                        : ColorsManager.blueWhite,
                    isAll: false,
                  );
                },
              ),
              Text(
                appLocalizations.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              CustomInputField(
                prefixIcon: Icons.edit_square,
                controller: _titleController,
                hintText: appLocalizations.event_title,
              ),
              SizedBox(height: 16.h,),
              Text(
                appLocalizations.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              CustomInputField(
                controller: _descriptionController,
                hintText: appLocalizations.event_description,
                maxLines: 4,
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 12.h),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => {},
                    child: Text(appLocalizations.add_event),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
