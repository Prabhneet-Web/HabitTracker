import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/responsive/mobileScreenLayout.dart';
import 'package:habit_tracker/responsive/responsiveLayoutScreen.dart';
import 'package:habit_tracker/responsive/webScreenLayout.dart';
import 'package:habit_tracker/screens/firstScreen.dart';
import 'package:habit_tracker/screens/loginScreen.dart';
import 'package:habit_tracker/util/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayout(
      //   webScreenLayout: WebScreenLayout(),
      //   mobileScreenLayout: MobileScreenLayout(),
      // ),
      home: const HomeScreen(),
    );
  }
}
