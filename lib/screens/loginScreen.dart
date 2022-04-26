import 'package:flutter/material.dart';
import 'package:habit_tracker/util/colors.dart';
import 'package:habit_tracker/widget/textFieldInput.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
            TextFieldInput(
                textEditingController: _emailController,
                hintText: "Enter your email",
                labelText: "Email",
                textInputType: TextInputType.emailAddress)
            //TextField Input of Password

            //TextButton for Login
          ]),
        ),
      ),
    );
  }
}
