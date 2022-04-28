import 'package:flutter/material.dart';
import 'package:habit_tracker/resources/authmethod.dart';
import 'package:habit_tracker/screens/loginScreen.dart';
import 'package:habit_tracker/util/colors.dart';
import 'package:habit_tracker/widget/textFieldInput.dart';
import 'package:lottie/lottie.dart';

import '../util/snackBar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isElevated = true;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
      _isElevated != _isElevated;
    });
    String result = await AuthMethods().signUpUser(
        fullName: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);
    if (result != "Success") {
      showSnackBar(result, context);
    } else if (result == "Success") {
      result == "User registered successfully";
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mobileBackgroundColor,
      body: Container(
        decoration: BoxDecoration(
            //Background Animation Added
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.89), BlendMode.dstOut),
                image: const AssetImage("lib/assets/images/Checkout.png"),
                fit: BoxFit.fitHeight)),
        width: double.infinity,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Divider
              const Opacity(
                opacity: 0.0,
                child: Divider(),
              ),
              //SignUp Text on AppBar
              const Center(
                  child: Text("Sign Up",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500))),
              //Divider
              const Opacity(
                opacity: 0.0,
                child: Divider(height: 30),
              ),
              //Flexible
              Flexible(child: Container(), flex: 2),
              //Enter fullname
              TextFieldInput(
                  textEditingController: _nameController,
                  hintText: "Enter your full name",
                  labelText: "Full Name",
                  textInputType: TextInputType.name),
              //Divider
              const Opacity(
                opacity: 0.0,
                child: Divider(),
              ),
              //Enter email
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your e-mail",
                  labelText: "Email",
                  textInputType: TextInputType.emailAddress),
              //Divider
              const Opacity(
                opacity: 0.0,
                child: Divider(),
              ),
              //Enter your password
              TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: "Enter your password",
                  labelText: "Password",
                  textInputType: TextInputType.text,
                  isPass: true),
              //Divider
              const Opacity(
                opacity: 0.0,
                child: Divider(height: 20),
              ),
              //Flexible
              Flexible(child: Container(), flex: 2),
              //SignUp Button
              Center(
                  child: GestureDetector(
                onTap: () async {
                  signUpUser();
                },
                child: _isLoading
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.059)
                    : AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.5,
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
                          child:
                              Text("Sign Up", style: TextStyle(fontSize: 18)),
                        ),
                      ),
              )),
              // Divider
              const Opacity(
                opacity: 0.0,
                child: Divider(height: 4),
              ),
              //Back Button
              Center(
                child: _isLoading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Lottie.asset(
                            "lib/assets/images/LoadingForTaskApp.json"),
                      )
                    : TextButton(
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            )),
                        child: Text(
                          'Back',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            color: Colors.white,
                          ),
                        )),
              ),
              //Flexible
              Flexible(
                child: Container(),
                flex: 2,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
