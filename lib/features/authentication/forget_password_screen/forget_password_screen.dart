import 'package:evently/core/resources/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
