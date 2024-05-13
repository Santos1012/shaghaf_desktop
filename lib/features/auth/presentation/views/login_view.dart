import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:saghaf_desktop/core/media_query.dart';

import 'package:saghaf_desktop/features/auth/presentation/views/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool x = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/desktop.jpeg"))),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: const LoginBody(),
            ),
          ),
        ],
      ),
    );
  }
}

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
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
                            log(x.toString());
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
                  const Expanded(
                    child: Text(
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
                  ),
                ],
              ),
              const SizedBoxApp(h: 20),
              GestureDetector(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF007AFF),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  width: double.infinity,
                  height: 50.h(context),
                  child: const Center(
                    child: Text("Sign in"),
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
