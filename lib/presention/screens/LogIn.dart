import 'package:ai/presention/Shared/Widgets.dart';
import 'package:ai/presention/screens/Registerion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Smart Parking App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'Hello and Welcome',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 48),
              SharedWidgets.textForm('Enter your Email',
                  TextInputType.emailAddress, const Icon(Icons.email)),
              const SizedBox(height: 48),
              SharedWidgets.textForm(
                  'Enter your Password',
                  TextInputType.number,
                  const Icon(Icons.remove_red_eye_outlined)),
              const SizedBox(height: 32),
              SharedWidgets.button((() {}), 'Sign,Now'),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const Registerion())));
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
    );
  }
}
