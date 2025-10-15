import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/route_manager.dart';
import 'package:evently/core/ui/toasts.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;
import 'package:flutter/material.dart';
import 'package:evently/core/resources/image_manager.dart';
import 'package:evently/core/widgets/custom_input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently/core/validators.dart';
import 'package:fluttertoast/fluttertoast.dart' show Fluttertoast;

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
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(appLocalizations.forget_password),
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
              labelText: appLocalizations.email,
              prefixIcon: Icons.email_rounded,
              controller: _emailController,
              validator: Validator.validateEmail,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.h),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => _resetPassword(),
                  child: Text(appLocalizations.reset_password),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateLogin() =>
      Navigator.pushReplacementNamed(context, RouteManager.loginScreen);

  void _resetPassword() async {
    try {
      String email = _emailController.text.trim();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Toasts.showToast(
        ColorsManager.green,
        "Password reset email sent! Check your inbox.",
      );
      _navigateLogin();
    } on FirebaseAuthException catch (e) {
      Toasts.showToast(ColorsManager.red, e.code.replaceAll('-', ' '));
    }
  }
}
