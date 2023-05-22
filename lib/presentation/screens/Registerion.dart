import 'package:ai/ModellingView/locations.dart';
import 'package:ai/core/Shared/network/remote/API_Handler.dart';
import 'package:ai/core/appconstance/app_constance.dart';
import 'package:ai/presentation/screens/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:ai/core/Shared/widget/Widgets.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  int stepOrder = 0;
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var carController = TextEditingController();

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
        child: Form(
          key: formKey2,
          child: Column(
            children: [
              Stepper(
                currentStep: stepOrder,
                onStepContinue: (() {
                  if (stepOrder < 1) {
                    setState(() {
                      stepOrder++;
                    });
                  }
                  else{

                      UrlHandler.postUserData(
                          name: nameController.text,
                          phoneNum: phoneController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          carNum: carController.text);
                      bool check = formKey2.currentState!.validate();
                      if (!check) return;
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title:  Text('Registered Successfully!'),
                              content:  Text('Now, please login with your credentials'),
                            );
                          });
                      SharedWidgets.navigateTo(context, LogIn());


                  }
                }),
                onStepCancel: (() {
                  if (stepOrder != 0) {
                    setState(() {
                      stepOrder--;
                    });
                  }
                }),
                onStepTapped: ((value) {
                  setState(() {
                    stepOrder = value;
                  });
                }),
                // م ن ت 1233
                steps: [
                  Step(
                      title: const Text('Personal Data'),
                      subtitle:
                          const Text('This will be your data in Application'),
                      content: Column(
                        children: [
                          SharedWidgets.textForm(
                              'Full name',
                              TextInputType.name,
                              const Icon(Icons.person),
                              nameController),
                          const SizedBox(height: 12),
                          SharedWidgets.textForm(
                              'Phone number',
                              TextInputType.number,
                              const Icon(Icons.phone_android_outlined),
                              phoneController),
                          const SizedBox(height: 12),
                          SharedWidgets.textForm(
                              'abcdefgh@email.com',
                              TextInputType.emailAddress,
                              const Icon(Icons.email),
                              emailController),
                          const SizedBox(height: 12),
                          SharedWidgets.textForm(
                              'Password',
                              TextInputType.number,
                              const Icon(Icons.key),
                              passwordController),
                        ],
                      )),
                  Step(

                    title: const Text('Vehicle Data'),
                    content: Column(
                      children: [
                        SharedWidgets.textForm(
                          validator: (p0) {
                            final carValidate = RegExp(
                                r'^[أ-ي]{1}\s[أ-ي]{1}\s[أ-ي]{1}\s[\u0660-\u0669]{4}$');
                                
                            if (!carValidate.hasMatch(p0!)) {
                              return 'invalid format ';
                            }
                            if (p0.isEmpty) {
                              return 'please enter the car number';
                            }
                            return null;
                          },
                          'your car number',
                          TextInputType.emailAddress,
                          const Icon(Icons.car_rental_sharp),
                          carController,
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SharedWidgets.button(() {
                UrlHandler.postUserData(
                    name: nameController.text,
                    phoneNum: phoneController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    carNum: carController.text);
                bool check = formKey2.currentState!.validate();
                if (!check) return;
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title:  Text('Registered Successfully!'),
                        content:  Text('Now, please login with your credentials'),
                      );
                    });
                SharedWidgets.navigateTo(context, LogIn());
              }, 'Register now'),
            ],
          ),
        ),
      ),
    );
  }
}

carValid() => TextFormField();
