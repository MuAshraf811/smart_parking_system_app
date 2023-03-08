import 'package:flutter/cupertino.dart';

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

    ];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: list,
      ),
    );
  }
}
