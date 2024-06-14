import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saghaf_desktop/core/service_locator.dart';
import 'package:window_manager/window_manager.dart';

import 'core/routers/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(1000, 600));
  }
  // DevicePreview(
  // enabled: true,
  // builder: (context) => const MyApp(), // Wrap your app
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        child: MaterialApp.router(
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          theme: ThemeData(
              textTheme: GoogleFonts.comfortaaTextTheme(
            Theme.of(context).textTheme,
          )),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      );
    });
  }
}
