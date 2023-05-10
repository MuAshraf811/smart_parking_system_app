import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/Shared/widget/Widgets.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> list = [
      SharedWidgets.buildDrum(),
      SharedWidgets.buildText("Mohamed Ashraf"),
      SharedWidgets.buildText("Mohamed Jebil"),
      SharedWidgets.buildText("Hamdy Aouf"),
      const SizedBox(height: 100,),

    // Fluttertoast.showToast(
    // msg: "This is Center Short Toast",
    // toastLength: Toast.LENGTH_SHORT,
    // gravity: ToastGravity.BOTTOM,
    // timeInSecForIosWeb: 5,
    // backgroundColor: Colors.red,
    // textColor: Colors.white,
    // fontSize: 16.0
    // );
    ];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: list,
      ),
    );
  }
}
