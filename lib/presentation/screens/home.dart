import 'package:ai/core/Shared/network/remote/API_Handler.dart';
import 'package:ai/core/Shared/widget/Widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Layout'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.red[400],
          fontSize: 28,
          fontWeight: FontWeight.bold
        ),
        iconTheme: IconThemeData(
          color: Colors.red[200]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{

          await UrlHandler.postUserData();

        },
        child: const Icon(Icons.add),
      ),
      body:  const AboutBody(),

    );
  }

}
