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
    //bool isDark = false,
    required String text,
    required Function pressFunc,
  }) =>
      Container(
        width: btnWidth,
        height: 40.0,
        decoration: BoxDecoration(
          // color: btnColor,
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
            "https://alwafd.news/images/images/FB_IMG_1645870381232.jpg"
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
