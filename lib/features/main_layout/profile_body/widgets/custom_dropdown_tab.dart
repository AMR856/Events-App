import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownTab extends StatefulWidget {
  final String label;
  final List<String> itemsList;
  final void Function(String?) onChanged;
  const CustomDropdownTab({
    super.key,
    required this.label,
    required this.itemsList,
    required this.onChanged,
  });

  @override
  State<CustomDropdownTab> createState() => _CustomDropdownTabState();
}

class _CustomDropdownTabState extends State<CustomDropdownTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: ColorsManager.lightBlue, width: 1),
          ),
          width: double.infinity,
          child: Row(
            children: [
              Text(
                widget.itemsList[0],
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorsManager.lightBlue,
                ),
              ),
              Spacer(),
              DropdownButton<String>(
                underline: const SizedBox(),
                items: widget.itemsList
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: ColorsManager.lightBlue),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: widget.onChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
