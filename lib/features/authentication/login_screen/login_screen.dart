import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/image_manager.dart';
import 'package:evently/core/resources/route_manager.dart';
import 'package:evently/core/validators.dart';
import 'package:evently/core/widgets/custom_input_field.dart';
import 'package:evently/core/widgets/underlined_text.dart';
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
                  labelText: 'Email',
                  prefixIcon: Icons.email_rounded,
                  controller: _emailController,
                  validator: Validator.validateEmail,
                ),
                CustomInputField(
                  labelText: 'Password',
                  prefixIcon: Icons.lock_rounded,
                  suffixIconWidget: IconButton(
                    icon: Icon(
                      isObscure
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                    ),
                    onPressed: () => setState(() => _toggleIsObscure()),
                  ),
                  isObscure: isObscure,
                  controller: _passwordController,
                  validator: Validator.validatePassword,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UnderlinedText(
                      text: 'Forget Password',
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
                      child: const Text("Login"),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t Have Account ?',
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: ColorsManager.black1C),
                    ),
                    UnderlinedText(
                      text: 'Create Account',
                      callback: _navigateRegister,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Text(
                      'Or',
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
                        'Login With Google',
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

  void _navigateHome() =>
      Navigator.pushNamed(context, RouteManager.homeScreen);

  void _toggleIsObscure() => isObscure = !isObscure;

  void _login() {
    if (_formKey.currentState?.validate() == false) return;
    _navigateHome();
  }
}
