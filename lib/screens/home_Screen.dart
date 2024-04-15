import 'package:flutter/material.dart';
import 'package:otp_verification/widgets/colors.dart';
import 'package:otp_verification/widgets/common_Button.dart';
import 'package:otp_verification/widgets/text_FormField.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.9,
                child: Image.asset(
                  'assets/images/img_4.jpg',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  color: ColorTheme.pinkAccentColor,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              Positioned(
                top: 300,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _textFormField(),
                      const SizedBox(height: 30),
                      CommonButton(onPressed: () {}, title: 'Continue',color: ColorTheme.commonColor,),
                      const SizedBox(height: 10),
                      _socialButton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFormField() => Column(
        children: [
          TextFieldForm(controller: emailController, labelText: 'Email'),
          const SizedBox(height: 10),
          TextFieldForm(
            controller: passwordController,
            labelText: 'Password',
            isObscure: true,
          ),
        ],
      );

  Widget _socialButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              CommonButton(
                onPressed: () {},
                color: ColorTheme.googleColor,
                title: 'Continue with Google',
                imgPath: 'assets/images/google.jpg',
              ),
              const SizedBox(height: 10),
              CommonButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/phoneScreen');
                },
                color: ColorTheme.phoneColor,
                title: 'Continue with Phone',
                imgPath: 'assets/images/phone.jpg',
              ),
            ],
          ),
        ],
      );
}
