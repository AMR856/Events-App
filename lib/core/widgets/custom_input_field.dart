import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIconWidget;
  final bool? isObscure;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIconWidget,
    this.labelText,
    this.isObscure,
    this.validator,
    this.hintText,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: TextFormField(
        controller: controller,
        obscureText: isObscure ?? false,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon): null,
          suffixIcon: suffixIconWidget,
          label: labelText != null ? Text(labelText!) : null,
          border: const OutlineInputBorder(),
          hintText: hintText,
        ),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
