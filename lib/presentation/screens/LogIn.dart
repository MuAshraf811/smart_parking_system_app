// ignore_for_file: must_be_immutable, must_call_super

import 'package:ai/ModellingView/locations.dart';
import 'package:ai/core/Shared/network/remote/modelling.dart';
import 'package:ai/core/Shared/widget/Widgets.dart';
import 'package:ai/core/appconstance/app_constance.dart';
import 'package:ai/presentation/screens/Registerion.dart';
import 'package:flutter/material.dart';

import '../../core/Shared/network/remote/API_Handler.dart';
import 'home.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  var isPassword = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {}

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
                  SharedWidgets.button(
                    (() {
                      UrlHandler.logIn(
                          userName: emailController.text,
                          pass: passwordController.text);

                      bool check = formKey.currentState!.validate();
                      if (check) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      }
                      if (UrlHandler.responseLogin == 200) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoctionsView();
                            },
                          ),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title:  Text('You have to register first'),
                                content:  Text('There is no such user , If you don\'t have an account the register'),
                              );
                            });
                      }
                    }),
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
                            SharedWidgets.navigateTo(
                                context, const Registration());
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
