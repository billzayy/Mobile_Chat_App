import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CommonAppbar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Get.theme.colorScheme.onPrimary,
      title: Text(
        title,
        style: Get.theme.textTheme.titleLarge?.copyWith(
            color: Get.theme.colorScheme.onBackground,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
