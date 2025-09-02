import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Elements/CustomButtonWidget.dart';
import 'package:untitled/Elements/CustomContainerWidget.dart';
import 'package:untitled/Elements/CustomTextFieldWidget.dart';
import 'package:untitled/Elements/CustomTextWidget.dart';
import 'package:untitled/Views/PostScreen.dart';

import '../Provider/AuthProvider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  void _login() async {
       setState(() => isLoading = true);

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await authProvider.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    setState(() => isLoading = false);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PostScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login failed. Try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyContainer(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0f0c29), Color(0xFF302b63), Color(0xFF24243e)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              text: "Welcome Back",
              size: 20,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
            MyText(
              text: "Please log in to continue",
              size: 22,
              fontWeight: FontWeight.w600,
              color: Colors.redAccent,
            ),
            const SizedBox(height: 30),
            MyTextField(
              controller: emailController,
              backgroundColor: Colors.amber,
              hintText: "Enter Email",
              hintStyle: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.email_outlined,
                  size: 30,
                  color: Colors.black54,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: passwordController,
              backgroundColor: Colors.amber,
              hintText: "Enter Password",
              hintStyle: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              isPasswordField: true,
              suffixIconSize: 30,
            ),

            const SizedBox(height: 10),

            MyButton(
              btnLabel: "Login",
              onPressed: () {
                if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                  // Show dialog if one or both fields are empty
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: MyText(
                        text: "Note",
                        size: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      content: MyText(text: "Please enter email and password."),
                      actions: [
                        MyButton(
                          btnLabel: "OK",
                          buttonPadding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 50,
                          ),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  );
                } else {
                  // ✅ Only call login when fields are filled
                  _login();
                }
              },
              buttonPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
