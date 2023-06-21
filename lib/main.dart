import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:software_project_3/config/theme_material.dart';
import 'package:software_project_3/core/global_binding.dart';
import 'package:software_project_3/core/router_config.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';

import 'src/pesentation/pages/app_start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [UserModelSchema],
    directory: dir.path,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat App',
      getPages: RouterConfigs.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),
      enableLog: true,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: CoreTheme.theme,
      initialRoute: AppStartView.routeName,
    );
  }
}
