import 'package:flutter/material.dart';
import 'package:habit_tracker/util/colors.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            //Lottie Animations
            Lottie.asset("lib/assets/images/Welcome.json"),
            //Divider
            const Opacity(opacity: 0.0, child: Divider()),
            //TextField Input of UserName

            //TextField Input of Password

            //TextButton for Login
          ]),
        ),
      ),
    );
  }
}
