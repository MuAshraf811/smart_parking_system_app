import 'package:flutter/material.dart';

class SharedWidgets {
// This method return TextFormField with fixed and optional attrebutes
  static Widget textForm(
      String hintText, TextInputType textInputType, Icon prefix) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          hintText: hintText,
          prefixIcon: prefix,
          prefixIconColor: Colors.teal,
        ),
      ),
    );
  }

  // this method return button

  static Widget button( void Function() function  ,String label) {
    return Container(
      width: 200,
      child: ElevatedButton.icon(
        onPressed: function,
        icon: const Icon(Icons.fingerprint),
        label: Text(label),
      ),
    );
  }
}
