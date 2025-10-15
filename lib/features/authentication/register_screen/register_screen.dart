import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/image_manager.dart';
import 'package:evently/core/resources/route_manager.dart';
import 'package:evently/core/ui/loading.dart';
import 'package:evently/core/ui/toasts.dart';
import 'package:evently/core/validators.dart';
import 'package:evently/core/widgets/custom_input_field.dart';
import 'package:evently/core/widgets/password_custom_input_field.dart';
import 'package:evently/core/widgets/underlined_text.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently/l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _rePasswordController;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isObscurePassword = true;
  bool isObscureRePassword = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(appLocalizations.register),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  ImageManager.eventlyLogo,
                  height: 186.h,
                  width: 136.w,
                ),
                SizedBox(height: 24.h),
                CustomInputField(
                  labelText: appLocalizations.name,
                  prefixIcon: Icons.person_rounded,
                  controller: _nameController,
                  validator: Validator.validateName,
                ),
                CustomInputField(
                  labelText: appLocalizations.email,
                  prefixIcon: Icons.email_rounded,
                  controller: _emailController,
                  validator: Validator.validateEmail,
                ),
                PasswordCustomInputField(
                  label: appLocalizations.password,
                  isObscure: isObscurePassword,
                  controller: _passwordController,
                  toggle: _toggleIsObscurePassword,
                ),
                PasswordCustomInputField(
                  label: appLocalizations.re_password,
                  isObscure: isObscureRePassword,
                  controller: _rePasswordController,
                  toggle: _toggleIsObscureRePassword,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12.h),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => {_register()},
                      child: Text(appLocalizations.create_account),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appLocalizations.already_have_account,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    UnderlinedText(
                      text: appLocalizations.login,
                      callback: _navigateLogin,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateLogin() =>
      Navigator.pushReplacementNamed(context, RouteManager.loginScreen);

  void _toggleIsObscurePassword() {
    isObscurePassword = !isObscurePassword;
    setState(() {});
  }

  void _toggleIsObscureRePassword() {
    isObscureRePassword = !isObscureRePassword;
    setState(() {});
  }

  void _register() async {
    if (_formKey.currentState?.validate() == false) return;
    // String userName = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String rePassword = _rePasswordController.text.trim();
    if (password != rePassword) {
      Toasts.showToast(ColorsManager.red, 'Password and re-password should be the same');
      return;
    }
    try {
      Loading.showLoading();
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Loading.stopLoading(context);
      Toasts.showToast(ColorsManager.green, 'User registered Successfully');
      _navigateLogin();
    } on FirebaseAuthException catch (e) {
      Loading.stopLoading(context);
      Toasts.showToast(ColorsManager.red, e.code.replaceAll('-', ' '));
    } catch (e) {
      Loading.stopLoading(context);
      Toasts.showToast(ColorsManager.red, 'An unexpected error occurred: $e');
    }
    _navigateLogin();
  }
}
// Amr Alnus
// amer.live222@gmail.com
// some-random-Password1234