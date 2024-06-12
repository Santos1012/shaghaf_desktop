import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_manager/window_manager.dart';

import 'core/routers/app_router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(1000, 600));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
  builder: (context, constraints) {

        return SizedBox(
          child: MaterialApp.router(
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            theme: ThemeData(
              textTheme: GoogleFonts.comfortaaTextTheme(
                Theme.of(context).textTheme,)
            ),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          ),
        );
      }
    );
  }
}
