import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/widgets/loading_widget.dart';
import 'package:saghaf_desktop/features/auth/presentation/manager/auth_cubit.dart';

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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
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
                CustomTextField(
                  label: "User Name",
                  hint: "Email or phone number",
                  controller: emailController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Please enter your email or phone number";
                    }
                    return null;
                  },
                ),
                const SizedBoxApp(h: 20),
                CustomTextField(
                  label: "Password",
                  hint: "Enter password",
                  controller: passwordController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
                const SizedBoxApp(h: 20),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     // mainAxisSize: MainAxisSize.max,
                //     children: [
                //       Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           SizedBox(
                //             height: 40,
                //             width: 60,
                //             child: Switch.adaptive(
                //               value: switchValue,
                //               onChanged: (x) {
                //                 switchValue = x;
                //                 setState(() {});
                //               },
                //             ),
                //           ),
                //           const SizedBoxApp(w: 10),
                //           const Text(
                //             "Remember me",
                //             style: TextStyle(
                //               fontFamily: "Comfortaa",
                //               fontSize: 14,
                //               fontWeight: FontWeight.w300,
                //               overflow: TextOverflow.clip,
                //             ),
                //             overflow: TextOverflow.clip,
                //             textAlign: TextAlign.start,
                //           ),
                //         ],
                //       ),
                //       SizedBoxApp(w: 30.w(context)),
                //       const Text(
                //         "Forgot password?",
                //         style: TextStyle(
                //           fontFamily: "Comfortaa",
                //           color: Color(0xFF007AFF),
                //           fontSize: 14,
                //           overflow: TextOverflow.clip,
                //         ),
                //         overflow: TextOverflow.clip,
                //         textAlign: TextAlign.end,
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBoxApp(h: 20),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      if (Platform.isAndroid) {
                        GoRouter.of(context).go(Routers.newBookMobile);
                      } else {
                        GoRouter.of(context).go(Routers.newBook);
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const LoadingWidget();
                    } else if (state is AuthError) {
                      return TextButton(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context).authLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        },
                        child: const Text("try again"),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).authLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
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
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
