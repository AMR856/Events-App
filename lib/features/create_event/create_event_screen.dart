import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, FieldValue, Timestamp;
import 'package:evently/core/resources/event_manager.dart';
import 'package:evently/core/ui/toasts.dart';
import 'package:evently/core/widgets/custom_input_field.dart';
import 'package:evently/core/widgets/tab_bar_widget.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/tab_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:intl/intl.dart';
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
  String? eventDate;
  String? eventTime;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
              SizedBox(height: 16.h),
              Text(
                appLocalizations.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              CustomInputField(
                controller: _descriptionController,
                hintText: appLocalizations.event_description,
                maxLines: 4,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(
                    Icons.date_range_rounded,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ColorsManager.white4F
                        : ColorsManager.black1C,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    eventDate != null
                        ? eventDate!
                        : appLocalizations.event_date,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () async {
                      // 2025-10-31 00:00:00.000
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(
                          DateTime.now().year + 1,
                          DateTime.now().month,
                          DateTime.now().day,
                        ),
                      );
                      if (date == null) return;
                      eventDate = DateFormat('yyyy-MM-dd').format(date);
                      setState(() {});
                    },
                    child: Text(
                      appLocalizations.choose_date,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.lightBlue,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ColorsManager.white4F
                        : ColorsManager.black1C,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    eventTime != null
                        ? eventTime!
                        : appLocalizations.event_time,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time == null) return;
                      eventTime =
                          '${time.hourOfPeriod}:${time.minute.toString().padLeft(2, '0')} ${time.period == DayPeriod.am ? 'AM' : 'PM'}';
                      setState(() {});
                    },
                    child: Text(
                      appLocalizations.choose_time,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.lightBlue,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 12.h),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () async => {
                      _storeEvent(
                        currentSelectedIndex,
                        context,
                        _titleController.text.trim(),
                        _descriptionController.text.trim(),
                        eventDate ?? DateTime.now().toString(),
                        eventTime ?? TimeOfDay.now().toString(),
                      ),
                    },
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

  Future<void> _storeEvent(
    int? index,
    BuildContext context,
    String title,
    String description,
    String eventDate,
    String eventTime,
  ) async {
    try {
      String category = EventManager.getEvents(context)[index ?? 0].name;
      final fullDateTimeString = "$eventDate $eventTime";
      final timestamp = Timestamp.fromDate(
        DateFormat("yyyy-MM-dd h:mm a").parse(fullDateTimeString),
      );
      await _firestore.collection('events').add({
        'category': category,
        'title': title,
        'description': description,
        'date': timestamp,
        'createdAt': FieldValue.serverTimestamp(),
      });

      Toasts.showToast(ColorsManager.green, 'Event Saved Successfully');
    } catch (e) {
      debugPrint(e.toString());
      Toasts.showToast(ColorsManager.red, 'Error Saving the Event');
    }
  }
}
