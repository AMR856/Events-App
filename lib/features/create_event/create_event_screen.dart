import 'package:evently/core/resources/event_manager.dart';
import 'package:evently/core/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEventScreen> {
  int? currentSelectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Create Event'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? EventManager.eventsDark[1].photo!
                      : EventManager.events[1].photo!,
                ),
              ),
              TabBarWidget(
                currentSelectedIndex: currentSelectedIndex,
                changeSelected: _changeSelected,
                itemsCount: EventManager.events.length - 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _changeSelected(int index) {
    currentSelectedIndex = index;
    setState(() {});
  }
}
