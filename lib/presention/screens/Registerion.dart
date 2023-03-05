import 'package:flutter/material.dart';
import 'package:ai/presention/Shared/Widgets.dart';

class Registerion extends StatefulWidget {
  const Registerion({super.key});

  @override
  State<Registerion> createState() => _RegisterionState();
}

class _RegisterionState extends State<Registerion> {
  int stepOrder = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Smart Parking App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                        SharedWidgets.textForm('Full name', TextInputType.name,
                            const Icon(Icons.person)),
                        const SizedBox(height: 12),
                        SharedWidgets.textForm(
                            'Phone number',
                            TextInputType.number,
                            const Icon(Icons.phone_android_outlined)),
                        const SizedBox(height: 12),
                        SharedWidgets.textForm(
                            'abcdefgh@email.com',
                            TextInputType.emailAddress,
                            const Icon(Icons.email)),
                        const SizedBox(height: 12),
                        SharedWidgets.textForm('Password', TextInputType.number,
                            const Icon(Icons.key)),
                      ],
                    )),
                Step(
                  title: const Text('Vechile Data'),
                  content: Column(
                    children: [
                      SharedWidgets.textForm(
                          'your car number',
                          TextInputType.emailAddress,
                          const Icon(Icons.car_rental_sharp)),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SharedWidgets.button(() {}, 'Register now'),
          ],
        ),
      ),
    );
  }
}
