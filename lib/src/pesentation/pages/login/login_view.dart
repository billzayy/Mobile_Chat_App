import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/pages/login/login_ctrl.dart';
import 'package:software_project_3/src/pesentation/pages/sign/sign_view.dart';

class LoginView extends GetView<LoginController> {
  static const String routeName = '/LoginView';
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Hi, Welcome Back!',
                              style: Get.theme.textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          const Icon(Icons.messenger_outline_sharp)
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "hello again, you've been missed!",
                        style: Get.theme.textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Email Address',
                        style: Get.theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
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
                              hintStyle: context.theme.textTheme.bodyMedium
                                  ?.copyWith(),
                              errorText: controller.emailChiError.value,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Password',
                        style: Get.theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
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
                                icon: Icon(controller.showPassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: controller.togglePasswordVisibility,
                              ),
                              alignLabelWithHint: true,
                              hintText: 'Enter your password',
                              hintStyle: context.theme.textTheme.bodyMedium
                                  ?.copyWith(),
                              errorText: controller.passwordError.value,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
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
                          child: Text(
                            'Login',
                            style: Get.theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Divider(
                              color: Colors.grey,
                              endIndent: 4,
                              indent: 4,
                              thickness: 0.4,
                            ),
                          ),
                          Text(
                            'Or Login With',
                            style: Get.theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            width: 100,
                            child: Divider(
                              color: Colors.grey,
                              endIndent: 4,
                              indent: 4,
                              thickness: 0.4,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width * 0.4,
                            height: 40,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.facebook,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Facebook',
                                    style: Get.theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.4,
                            height: 40,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.g_mobiledata_outlined,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Google',
                                    style: Get.theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have ann account? ",
                        style: Get.theme.textTheme.bodyLarge),
                    InkWell(
                      onTap: () => Get.toNamed(SignView.routeName),
                      child: Text(
                        "Sign Up ",
                        style: Get.theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple[500]),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
