// ignore_for_file: unused_import, avoid_print

import 'package:ai/core/Shared/network/remote/API_Handler.dart';
import 'package:flutter/material.dart';

class ModellingLocation {

  
  @override
  String toString() {
    return 'ModellingLocation(id: $id)';
  }
  String id;
  static late List<ModellingLocation?>? myList; // to store data coming from getLocations method in api class in it

  ModellingLocation({required this.id});
// convert list of maps to list of ModellingLocation class
  static Future<List<ModellingLocation>> converting() async {
    final value = await UrlHandler.getLocations();
    return value.map((e) {
      return ModellingLocation(id: e['locations']);
    }).toList();
  }

}


