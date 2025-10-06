import 'package:evently/core/resources/image_manager.dart';
import 'package:evently/core/resources/route_manager.dart';
import 'package:evently/core/validators.dart';
import 'package:evently/core/widgets/custom_input_field.dart';
import 'package:evently/core/widgets/password_custom_input_field.dart';
import 'package:evently/core/widgets/underlined_text.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isObscure = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
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
                CustomInputField(
                  labelText: appLocalizations.email,
                  prefixIcon: Icons.email_rounded,
                  controller: _emailController,
                  validator: Validator.validateEmail,
                ),
                PasswordCustomInputField(
                  label: appLocalizations.password,
                  isObscure: isObscure,
                  controller: _passwordController,
                  toggle: _toggleIsObscure,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UnderlinedText(
                      text: appLocalizations.forget_password,
                      callback: _navigateForgetPassword,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12.h),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => _login(),
                      child: Text(appLocalizations.login),
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
                      text: appLocalizations.create_account,
                      callback: _navigateRegister,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Text(
                      appLocalizations.or,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 12.h),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageManager.googleLogo),
                      SizedBox(width: 10.w),
                      Text(
                        appLocalizations.login_with_google,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateForgetPassword() =>
      Navigator.pushNamed(context, RouteManager.forgetPasswordScreen);

  void _navigateRegister() =>
      Navigator.pushNamed(context, RouteManager.registerScreen);

  void _navigateHome() => Navigator.pushNamed(context, RouteManager.homeScreen);

  void _toggleIsObscure() {
    isObscure = !isObscure;
    setState(() {});
  }

  void _login() {
    if (_formKey.currentState?.validate() == false) return;
    _navigateHome();
  }
}
