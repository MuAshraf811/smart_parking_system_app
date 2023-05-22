import 'package:ai/core/Shared/network/local/cache_helper.dart';
import 'package:ai/core/Shared/network/remote/API_Handler.dart';
import 'package:ai/core/Shared/network/remote/userModel.dart';
import 'package:ai/core/Shared/widget/Widgets.dart';
import 'package:ai/presentation/screens/LogIn.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccSetPage extends StatefulWidget {
  AccSetPage({Key? key}) : super(key: key);

  @override
  State<AccSetPage> createState() => _AccSetPageState();
}

class _AccSetPageState extends State<AccSetPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmController = TextEditingController();

  var typeController = TextEditingController();

  var formKeyValidator = GlobalKey<FormState>();

  bool isPass = false;

  bool isPassConfirm = false;

  var accType;
  late Future<List<UserData>> futureData;

  @override
  void initState() {
    futureData = UserData.converting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: futureData,
      builder:(context, AsyncSnapshot<List<UserData>> snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          nameController.text = data[0].name;
          mobileController.text = data[0].phone;
          emailController.text = data[0].email;
          return ConditionalBuilder(
            condition: data?.length != null,
            builder: (context) =>
                Scaffold(
                  appBar: AppBar(
                    title: const Center(child: Text("Account Settings")),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: formKeyValidator,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SharedWidgets.defaultFormField(
                              text: "Full Name",
                              inputType: TextInputType.emailAddress,
                              myController: emailController,
                              prefixIcon: Icons.text_fields_outlined,
                              validate: SharedWidgets.emailFieldValidation,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SharedWidgets.defaultFormField(
                              text: "Mobile Number",
                              inputType: TextInputType.phone,
                              myController: mobileController,
                              prefixIcon: Icons.text_fields_outlined,
                              validate: SharedWidgets.emailFieldValidation,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SharedWidgets.defaultFormField(
                              text: "Email",
                              inputType: TextInputType.emailAddress,
                              myController: emailController,
                              prefixIcon: Icons.text_fields_outlined,
                              validate: SharedWidgets.emailFieldValidation,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SharedWidgets.defaultFormField(
                              text: "Username",
                              inputType: TextInputType.emailAddress,
                              myController: emailController,
                              prefixIcon: Icons.text_fields_outlined,
                              validate: SharedWidgets.emailFieldValidation,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SharedWidgets.defaultFormField(
                              text: "New Password",
                              isPassField: isPass,
                              inputType: TextInputType.visiblePassword,
                              suffix_icon: isPass ? Icons.visibility_off : Icons
                                  .visibility,
                              suffix_function: () {
                                setState(() {
                                  isPass = !isPass;
                                });
                              },
                              myController: passwordController,
                              prefixIcon: Icons.text_fields_outlined,
                              validate: SharedWidgets.emailFieldValidation,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SharedWidgets.defaultFormField(
                              text: "Confirm Password",
                              isPassField: isPassConfirm,
                              inputType: TextInputType.visiblePassword,
                              suffix_icon:
                              isPassConfirm ? Icons.visibility_off : Icons
                                  .visibility,
                              suffix_function: () {
                                setState(() {
                                  isPassConfirm = !isPassConfirm;
                                });
                              },
                              myController: passwordController,
                              prefixIcon: Icons.text_fields_outlined,
                              validate: SharedWidgets.emailFieldValidation,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SharedWidgets.defaultButton(
                                text: "Submit",
                                pressFunc: () {
                                  if (formKeyValidator.currentState!
                                      .validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LogIn()),
                                    );
                                  }
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            SharedWidgets.defaultButton(
                                text: 'Delete Account',
                                pressFunc: () async {
                                  UrlHandler.deleteUser(
                                      id: CacheHelper.getdata(key: 'token'));
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            fallback: (context) =>
            const Center(child: CircularProgressIndicator()),
          );
        }
        else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}
