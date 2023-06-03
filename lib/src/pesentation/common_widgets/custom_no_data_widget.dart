import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/assets.dart';

class CustomNoDataWidget extends StatelessWidget {
  final String noiDung;
  final ElevatedButton? btnRefresh;

  final bool isSearch;
  const CustomNoDataWidget(
      {Key? key,
      required this.noiDung,
      this.btnRefresh,
      required this.isSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (btnRefresh == null)
            if (isSearch)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Image.asset(
                  ImageAssets.noImage,
                  // package: LocalVariable.packageName,
                  color: context.theme.colorScheme.primary.withAlpha(120),
                  height: 60,
                  width: 60,
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Image.asset(
                  ImageAssets.noImage,
                  // package: LocalVariable.packageName,
                  color: context.theme.colorScheme.primary.withAlpha(120),
                  height: 60,
                  width: 60,
                ),
              ),
          Text(
            noiDung,
            style: context.textTheme.bodyLarge
                ?.copyWith(color: Colors.grey.shade500),
          ),
          if (btnRefresh != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: btnRefresh!,
            )
        ],
      ),
    );
  }
}
