import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/service_locator.dart';
import 'package:saghaf_desktop/features/auth/data/repositories/auth_repo_implementation.dart';
import 'package:saghaf_desktop/features/auth/presentation/manager/auth_cubit.dart';
import 'package:saghaf_desktop/features/auth/presentation/views/widgets/login_body.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool x = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(gitIt<AuthRepoImplementation>()),
      child: Scaffold(
        body: Row(
          children: [
            if (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
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
      ),
    );
  }
}
