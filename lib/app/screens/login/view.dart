import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/common/page_routes.dart';
import 'package:safe_store/app/screens/login/controller.dart';
import 'package:safe_store/app/widgets/background_ui.dart';
import 'package:safe_store/app/widgets/custom_button.dart';
import 'package:safe_store/app/widgets/my_text_field.dart';
import 'package:safe_store/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.find<UserController>(tag: 'login');

  @override
  Widget build(BuildContext context) {
    return BackgroundUi(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Get.height * 0.08,
        ),
        Center(
          child: SizedBox(
            height: Get.width * 0.3,
            width: Get.width * 0.3,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Login',
          style: fTitleStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Please enter your email and password for login.',
          style: fTextStyle.copyWith(color: Colors.grey),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Email',
          style: fTextStyle.copyWith(color: Colors.grey),
        ),
        MyTextField(textEditingController: controller.emailController),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Password',
          style: fTextStyle.copyWith(color: Colors.grey),
        ),
        Obx(
          () => TextField(
            controller: controller.passwordController,
            obscureText: controller.showPass.value ? false : true,
            style: fTextStyle,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.onShowPassPressed();
                },
                icon: PageTransitionSwitcher(
                  transitionBuilder: (Widget child,
                      Animation<double> primaryAnimation,
                      Animation<double> secondaryAnimation) {
                    return SharedAxisTransition(
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.vertical,
                      child: child,
                    );
                  },
                  child: controller.showPass.value
                      ? const SizedBox(
                          child: Icon(
                            CupertinoIcons.eye,
                            color: Colors.grey,
                          ),
                        )
                      : const Icon(
                          CupertinoIcons.eye_slash,
                          color: Colors.grey,
                        ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Forgot password',
          style: fTextStyle,
        ),
        SizedBox(
          height: Get.height * 0.08,
        ),
        SizedBox(
          width: Get.width,
          child: CustomButton(text: 'Login', onTapped: () {
            controller.login();
          }),
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: RichText(
            text: TextSpan(style: fTextStyle.copyWith(color: Colors.black), children: [
              const TextSpan(text: "You don't have an account ? "),
              TextSpan(
                text: 'Sign up',
                style: const TextStyle(color: Colors.green),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.offNamed(PageRoutes.SIGNUP),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
