import 'package:evently/core/validators.dart';
import 'package:evently/core/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class PasswordCustomInputField extends StatefulWidget {
  final String label;
  final bool isObscure;
  final TextEditingController controller;
  final void Function() toggle;
  const PasswordCustomInputField({
    super.key,
    required this.label,
    required this.isObscure,
    required this.controller,
    required this.toggle,
  });

  @override
  State<PasswordCustomInputField> createState() =>
      _PasswordCustomInputFieldState();
}

class _PasswordCustomInputFieldState extends State<PasswordCustomInputField> {
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: widget.label,
      prefixIcon: Icons.lock_rounded,
      suffixIconWidget: IconButton(
        icon: Icon(
          widget.isObscure
              ? Icons.visibility_off_rounded
              : Icons.visibility_rounded,
        ),
        onPressed: () => setState(() => widget.toggle()),
      ),
      controller: widget.controller,
      validator: Validator.validatePassword,
    );
  }
}
