import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../../core/routers/custom_routers.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(

              image: AssetImage("assets/splash.jpeg"),
              colorFilter: ColorFilter.srgbToLinearGamma(),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.height / 5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    // scale: 1/6,
                    image: AssetImage("assets/shaghaf_logo.png",),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        GoRouter.of(context).go(Routers.newBook);
      },
    );
  }
}
