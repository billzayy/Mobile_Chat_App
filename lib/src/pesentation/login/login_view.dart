import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/login/login_ctrl.dart';

class LoginView extends GetView<LoginController> {
  static const String routeName = '/LoginView';
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetweens,
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
              Text(
                "hello again, you've been missed!",
                style: Get.theme.textTheme.bodySmall,
              ),
              Text(
                'Email Address',
                style: Get.theme.textTheme.bodyMedium,
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
                    hintStyle: context.theme.textTheme.bodyMedium?.copyWith(),
                    // errorText: controller.noiDungError.value,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              Text(
                'Password',
                style: Get.theme.textTheme.bodyMedium,
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
                    hintStyle: context.theme.textTheme.bodyMedium?.copyWith(),
                    // errorText: controller.noiDungError.value,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        // fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: controller.isChecked,
                        onChanged: (bool? value) {},
                      ),
                      Text(
                        'Remember Me',
                        style: Get.theme.textTheme.bodyMedium,
                      )
                    ],
                  ),
                  Text(
                    'Forgot Password',
                    style: Get.theme.textTheme.bodyMedium,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
