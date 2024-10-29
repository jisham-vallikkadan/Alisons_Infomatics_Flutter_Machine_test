
import 'package:alisons_lnfomatics_flutter_machine_test/provider/home_provider.dart';
import 'package:alisons_lnfomatics_flutter_machine_test/screens/splash_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // ignore: prefer_const_constructors
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ],
        child:const MaterialApp(
          debugShowCheckedModeBanner: false,
          home:  SplashScreen(),
        ),
      ),
    );
  }


}
