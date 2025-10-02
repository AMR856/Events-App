import 'package:flutter/material.dart';
import 'package:evently/core/resources/image_manager.dart';
import 'package:evently/core/widgets/custom_input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently/core/validators.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Forget Password'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.h),
              child: Image.asset(ImageManager.forgetPassword),
            ),
            CustomInputField(
              labelText: 'Email',
              prefixIcon: Icons.email_rounded,
              controller: _emailController,
              validator: Validator.validateEmail,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.h),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => {},
                  child: const Text("Reset Password"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
