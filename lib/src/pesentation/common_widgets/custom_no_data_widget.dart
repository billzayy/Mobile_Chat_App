import 'package:extended_image/extended_image.dart';
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
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: ExtendedImage.asset(
                      'assets/images/default.jpg',
                      fit: BoxFit.cover,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      shape: BoxShape.rectangle,
                      loadStateChanged: (ExtendedImageState state) {
                        switch (state.extendedImageLoadState) {
                          case LoadState.loading:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case LoadState.completed:
                            return null;
                          case LoadState.failed:
                            return Image.asset(
                              ImageAssets.noImage,
                            );
                        }
                      },
                    ),
                  ))
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: ExtendedImage.asset(
                    'assets/images/default.jpg',
                    fit: BoxFit.cover,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    shape: BoxShape.rectangle,
                    loadStateChanged: (ExtendedImageState state) {
                      switch (state.extendedImageLoadState) {
                        case LoadState.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case LoadState.completed:
                          return null;
                        case LoadState.failed:
                          return Image.asset(
                            ImageAssets.noImage,
                          );
                      }
                    },
                  ),
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
