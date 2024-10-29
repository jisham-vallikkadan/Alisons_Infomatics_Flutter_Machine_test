import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';
import '../utils/shared_preference.dart';
import 'home/home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  hasToken() async {
    final bool hasToken = await SharedPrefUtil.contains(keyAccessToken);
    if (hasToken) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 2), () async {
      await hasToken();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/Logo 2.png',
        ),
      ),
    );
  }
}
