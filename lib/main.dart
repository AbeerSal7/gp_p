import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/asset_manger.dart';
import 'package:gp/core/theme/app_Theme.dart';
import 'package:gp/firebase_options.dart';
import 'package:gp/routes/module.dart';

Future<void> main() async {
  AssetManger.logo;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ModularApp(
      // debugMode: false,
        module: AppModule(),
        child: MaterialApp.router(
          theme: AppTheme().theme,
          debugShowCheckedModeBanner: false,
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        ));
  }
}
