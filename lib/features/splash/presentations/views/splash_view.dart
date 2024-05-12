import 'package:flutter/material.dart';
import 'package:saghaf_desktop/features/splash/presentations/views/widgets/splash_body.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SplashBody(),
      ),
    );
  }
}
