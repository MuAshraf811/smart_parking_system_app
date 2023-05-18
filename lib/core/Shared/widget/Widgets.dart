import 'package:ai/core/appconstance/app_constance.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SharedWidgets {
// controllers of textFormfield

// This method return TextFormField with fixed and optional attrebutes
  static Widget textForm(
    String hintText,
    TextInputType textInputType,
    Icon prefix,
    TextEditingController controller,
  ) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        validator: ((value) {
          if (value != null) {
            if (value.length >= 8) return null;
          }
          return " This field must not be null ";
        }),
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          hintText: hintText,
          prefixIcon: prefix,
          prefixIconColor: AppConstance.defaultColor,
        ),
      ),
    );
  }

  // this method return button

  static Widget button(void Function() function, String label) {
    return Container(
      width: 200,
      child: ElevatedButton.icon(
        onPressed: function,
        icon: const Icon(Icons.fingerprint),
        label: Text(label),
      ),
    );
  }

  static void navigateTo(context, object) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => object));
  }

  static void navigateAndFinish(context, object) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => object), (route) => false);
  }

  ///*******************************************************************************///

  static Widget defaultButton({
    double btnWidth = double.infinity,
    double radius = 10,
    Color btnColor = Colors.blue,
    required String text,
    required Function pressFunc,
  }) =>
      Container(
        width: btnWidth,
        height: 40.0,
        decoration: BoxDecoration(
           color: btnColor,
            borderRadius: BorderRadius.circular(radius)),
        child: ElevatedButton(
          onPressed: () => pressFunc(),
          child: Text(
            text,
          ),
        ),
      );

  static Widget defaultFormField({
    required String text,
    required Function? validate,
    required TextEditingController myController,
    required IconData prefixIcon,
    IconData? suffix_icon,
    Function? suffix_function,
    bool isPassField = false,
    TextInputType inputType = TextInputType.emailAddress,
    double decorationRadius = 10,
    bool enabled = true,
  }) =>
      TextFormField(
        validator: validate ?? validate!(),
        controller: myController,
        obscureText: isPassField,
        keyboardType: inputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: text,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon:( suffix_icon != null?
          IconButton(
            padding: EdgeInsetsDirectional.zero,
            icon: Icon(
              suffix_icon,
            ),
            onPressed: () =>
            suffix_function != null ? suffix_function() : () {},
          )
              : null),
          prefixIcon: Icon(prefixIcon),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(decorationRadius),
          ),
        ),
        enabled: enabled,
      );

  static String? emailFieldValidation(value) {
    if (value.isEmpty) {
      return "Email field can't be empty!";
    }
    if(!value.toString().endsWith("@gmail.com")) {
      return "Incorrect email format";
    }
    return null;
  }
  static String? passFieldValidation(value) {
    if (value.isEmpty) {
      return "Password field can't be empty!";
    }
    if (value.length < 8) return "Minimum number of characters is 8";
    return null;
  }

  static Widget buildText(String text){
    return  Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 40,
        alignment: AlignmentDirectional.center,
        decoration:  BoxDecoration(
            color: Colors.red[400],
            borderRadius: const BorderRadius.all(Radius.circular(6))
        ),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
  static Widget buildDrum(){
    return CarouselSlider(
      items:  [
        Image.network(
            "data:image/jpeg;base64,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"
        ),
      ],
      options: CarouselOptions(
        aspectRatio: 0.9,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 4),
        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
        autoPlayInterval: const Duration(seconds: 3),
        initialPage: 0,
        height: 300,
        enableInfiniteScroll: true,
        reverse: false,
        scrollDirection: Axis.horizontal,

      ),
    );
  }

}
