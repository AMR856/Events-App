import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final Widget? suffixIconWidget;
  final bool? isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    required this.controller,
    this.suffixIconWidget,
    this.isObscure,
    this.validator,
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
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIconWidget,
          label: Text(labelText),
          border: const OutlineInputBorder(),
        ),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
