import 'package:ai/core/appconstance/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:ai/core/Shared/widget/Widgets.dart';

class Registerion extends StatefulWidget {
  const Registerion({super.key});

  @override
  State<Registerion> createState() => _RegisterionState();
}

class _RegisterionState extends State<Registerion> {
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
                  if (stepOrder != 1) {
                    setState(() {
                      stepOrder++;
                    });
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
                    title: const Text('Vechile Data'),
                    content: Column(
                      children: [
                        SharedWidgets.textForm(
                            'your car number',
                            TextInputType.emailAddress,
                            const Icon(Icons.car_rental_sharp),
                            carController),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SharedWidgets.button(() {
                bool check = formKey2.currentState!.validate();
                if (!check) return;
              }, 'Register now'),
            ],
          ),
        ),
      ),
    );
  }
}
