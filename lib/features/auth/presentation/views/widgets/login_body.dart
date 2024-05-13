import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';

import '../../../../../core/media_query.dart';
import '../../../../../core/routers/custom_routers.dart';
import 'custom_text_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/shaghaf_logo.png",
          height: 160,
          width: 140,
          // fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.all(15.w(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Nice to see you again",
                style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBoxApp(h: 20),
              const CustomTextField(
                  label: "User Name", hint: "Email or phone number"),
              const SizedBoxApp(h: 20),
              const CustomTextField(label: "Password", hint: "Enter password"),
              const SizedBoxApp(h: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 60,
                          child: Switch.adaptive(
                            value: switchValue,
                            onChanged: (x) {
                              switchValue = x;
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBoxApp(w: 10),
                        const Text(
                          "Remember me",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            overflow: TextOverflow.clip,
                          ),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBoxApp(w: 30.w(context)),
                    const Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontFamily: "Comfortaa",
                        color: Color(0xFF007AFF),
                        fontSize: 14,
                        overflow: TextOverflow.clip,
                      ),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const SizedBoxApp(h: 20),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).go(Routers.newBook);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF007AFF),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  width: double.infinity,
                  height: 50.h(context),
                  child: const Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontFamily: "Comfortaa",
                        color: Colors.white,
                        fontSize: 14,
                        overflow: TextOverflow.clip,
                      ),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
