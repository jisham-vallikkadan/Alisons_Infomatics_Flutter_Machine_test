import 'dart:async';

import 'package:alisons_lnfomatics_flutter_machine_test/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common_widgets/custom_button.dart';
import '../common_widgets/custom_textfield.dart';
import '../utils/constants.dart';
import '../utils/shared_preference.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailCtrl;
  late TextEditingController passwordCtrl;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    emailCtrl = TextEditingController(text: '8547541134');
    passwordCtrl = TextEditingController(text: '12345678');

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  validator: (val) {
                    if (val!.isEmpty) return 'enter email';
                    return null;
                  },
                  controller: emailCtrl,
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: (val) {
                    if (val!.isEmpty) return 'enter password';
                    return null;
                  },
                  controller: passwordCtrl,
                  hintText: "password",
                  isPasswordType: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<HomeProvider>(builder: (context, login, _) {
                  return CustomButton(
                    isLoading: login.isLoading,
                    text: 'Login',
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        login.accountLogin(
                            context: context,
                            email: emailCtrl.text,
                            password: passwordCtrl.text);
                      }
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
