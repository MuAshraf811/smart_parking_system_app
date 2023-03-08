// ignore_for_file: must_be_immutable

import 'package:ai/core/Shared/widget/Widgets.dart';
import 'package:ai/core/appconstance/app_constance.dart';
import 'package:ai/presentation/screens/Registerion.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var emailController = TextEditingController();
  var isPassword = true;
  var passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstance.defaultColor,
        title: const Text(
          'Smart Parking App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Hello and Welcome',
                    style: TextStyle(
                      color: AppConstance.defaultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 48),
                  SharedWidgets.defaultFormField(
                    text: 'Enter your Email',
                    validate: SharedWidgets.emailFieldValidation,
                    myController: emailController,
                    prefixIcon: Icons.email,
                    inputType: TextInputType.emailAddress,
                  ),
                  // SharedWidgets.textForm(
                  //     'Enter your Email',
                  //     TextInputType.emailAddress,
                  //     const Icon(Icons.email),
                  //     emailController),
                  const SizedBox(height: 48),
                  SharedWidgets.defaultFormField(
                    text: 'Enter your Password',
                    validate: SharedWidgets.passFieldValidation,
                    myController: passwordController,
                    prefixIcon: Icons.lock_outline,
                    inputType: TextInputType.number,
                    isPassField: isPassword,
                    suffix_icon:
                        isPassword ? Icons.visibility_off : Icons.visibility,
                    decorationRadius: 15,
                    suffix_function: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  // SharedWidgets.textForm(
                  //     'Enter your Password',
                  //     TextInputType.number,
                  //     const Icon(Icons.remove_red_eye_outlined),
                  //     passwordController),
                  const SizedBox(height: 32),
                  SharedWidgets.button((
                    () {
                        bool check = formKey.currentState!.validate();
                        if (check) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const HomePage() ,
                            )
                          );
                        }
                        }
                  ),
                      'Sign,Now',
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            SharedWidgets.navigateTo(context, Registration());
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
