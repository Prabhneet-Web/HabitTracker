import 'package:flutter/material.dart';
import 'package:habit_tracker/resources/authmethod.dart';
import 'package:habit_tracker/screens/signUpScreenSecond.dart';
import 'package:habit_tracker/screens/taskScreenThird.dart';
import 'package:habit_tracker/util/colors.dart';
import 'package:habit_tracker/util/snackBar.dart';
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
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool _isElevated = true;

  void loginUser() async {
    setState(() {
      _isLoading = true;
      _isElevated = !_isElevated;
    });
    await Future.delayed(const Duration(microseconds: 400));

    String result = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (result == "success") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      showSnackBar(result, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                textInputType: TextInputType.emailAddress),
            //Divider
            const Opacity(opacity: 0.0, child: Divider(height: 20)),
            //TextField Input of Password
            TextFieldInput(
              textEditingController: _passwordController,
              hintText: "Enter your password",
              labelText: "Password",
              textInputType: TextInputType.text,
              isPass: true,
            ),
            //Divider
            Opacity(opacity: 0.0, child: Divider(height: deviceHeight * 0.09)),

            //TextButton for Login
            GestureDetector(
              onTap: () async {
                loginUser();
              },
              child: _isLoading
                  ? Container(height: MediaQuery.of(context).size.height * 0.1)
                  : AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 50,
                      width: deviceWidth * 0.5,
                      decoration: BoxDecoration(
                          color: iconColor,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: _isElevated
                              ? [
                                  const BoxShadow(
                                      color: iconColor,
                                      offset: Offset(4, 4),
                                      blurRadius: 15,
                                      spreadRadius: 1),
                                  const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-4, -4),
                                      blurRadius: 15,
                                      spreadRadius: 1)
                                ]
                              : null),
                      child: const Center(
                          child: Text("Login", style: TextStyle(fontSize: 18))),
                    ),
            ),
            //Divider
            const Opacity(opacity: 0.0, child: Divider()),
            //Row for SignUp
            _isLoading
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Lottie.asset(
                        "lib/assets/images/LoadingForTaskApp.json"),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text("Don't you have an account?"),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SignupScreen()));
                          },
                          child: const Text(
                            " Sign Up.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
          ]),
        ),
      ),
    );
  }
}
