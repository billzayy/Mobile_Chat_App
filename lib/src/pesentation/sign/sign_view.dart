import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/login/login_view.dart';
import 'package:software_project_3/src/pesentation/sign/sign_ctrl.dart';

class SignView extends GetView<SignController> {
  static const String routeName = '/SignView';
  const SignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create Account',
                      style: Get.theme.textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
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
                    style: Get.theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    // onTap: () => controller.slideController.hide(),
                    // controller: controller.noiDungEditController,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                        // color: context.theme.hintColor,
                        ),
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'example@example.com',
                        hintStyle:
                            context.theme.textTheme.bodyMedium?.copyWith(),
                        // errorText: controller.noiDungError.value,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Mobile Number',
                    style: Get.theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    // onTap: () => controller.slideController.hide(),
                    // controller: controller.noiDungEditController,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                        // color: context.theme.hintColor,
                        ),
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'Enter your mobile number',
                        hintStyle:
                            context.theme.textTheme.bodyMedium?.copyWith(),
                        // errorText: controller.noiDungError.value,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Password',
                    style: Get.theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    // onTap: () => controller.slideController.hide(),
                    // controller: controller.noiDungEditController,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                        // color: context.theme.hintColor,
                        ),
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'Enter your password',
                        hintStyle:
                            context.theme.textTheme.bodyMedium?.copyWith(),
                        // errorText: controller.noiDungError.value,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
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
                        style: Get.theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
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
                        backgroundColor: Colors.teal[800],
                      ),
                      onPressed: () {},
                      child: Text('Sign Up',
                          style: Get.theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
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
                        'Or Sign Up With',
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
                    height: 18,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",
                    style: Get.theme.textTheme.bodyLarge),
                InkWell(
                  onTap: () => Get.toNamed(LoginView.routeName),
                  child: Text(
                    "Login",
                    style: Get.theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.green[800]),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
