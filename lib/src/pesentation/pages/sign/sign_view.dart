import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/pages/login/login_view.dart';
import 'package:software_project_3/src/pesentation/pages/sign/sign_ctrl.dart';

class SignView extends GetView<SignController> {
  static const String routeName = '/SignView';
  const SignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Create Account', style: Get.theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Connect with your friends today!",
                      style: Get.theme.textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Email Address',
                      style: Get.theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Obx(
                      () => TextField(
                        // onTap: () => controller.slideController.hide(),
                        controller: controller.emailEditController,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            hintText: 'example@example.com',
                            hintStyle: context.theme.textTheme.bodyMedium?.copyWith(),
                            errorText: controller.emailChiError.value,
                            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Full Name',
                      style: Get.theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Obx(
                      () => TextField(
                        // onTap: () => controller.slideController.hide(),
                        controller: controller.fullNameEditController,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            hintText: 'Enter your full name',
                            hintStyle: context.theme.textTheme.bodyMedium?.copyWith(),
                            errorText: controller.fullNameError.value,
                            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Mobile Number',
                      style: Get.theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Obx(
                      () => TextField(
                        // onTap: () => controller.slideController.hide(),
                        controller: controller.phoneEditController,
                        keyboardType: TextInputType.number,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            hintText: 'Enter your mobile number',
                            hintStyle: context.theme.textTheme.bodyMedium?.copyWith(),
                            errorText: controller.phoneError.value,
                            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Password',
                      style: Get.theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Obx(
                      () => TextField(
                        controller: controller.passwordEditController,
                        obscureText: !controller.showPassword.value,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(controller.showPassword.value ? Icons.visibility : Icons.visibility_off),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                            alignLabelWithHint: true,
                            hintText: 'Enter your password',
                            hintStyle: context.theme.textTheme.bodyMedium?.copyWith(),
                            errorText: controller.passwordError.value,
                            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          // fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: controller.isChecked,
                          onChanged: (bool? value) {},
                        ),
                        Text(
                          'I agree to the terms and conditions ',
                          style: Get.theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[500],
                        ),
                        onPressed: () => controller.onSend(),
                        child: Text('Sign Up', style: Get.theme.textTheme.bodyMedium?.copyWith(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[500],
                        ),
                        onPressed: () => controller.onSend(),
                        child: Text('Sign Up', style: Get.theme.textTheme.bodyMedium?.copyWith(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ", style: Get.theme.textTheme.bodyLarge),
                  InkWell(
                    onTap: () => Get.toNamed(LoginView.routeName),
                    child: Text(
                      "Login",
                      style: Get.theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.green[800]),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
