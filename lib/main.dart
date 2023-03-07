
import 'package:ai/presention/screens/LogIn.dart';
import 'package:ai/presention/screens/onboarding.dart';
import 'package:flutter/material.dart';

import 'core/Shared/network/local/cache_helper.dart';
import 'core/styles/thems.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? notfirstuse = CacheHelper.getdata(key: 'onboarding');
  String ? token = CacheHelper.getdata(key: 'token');
  late Widget startwidget;
  if (notfirstuse != null) {
    if (token != null) {
     // startwidget = const parkLayout();
    } else {
      startwidget = const LogIn();
    }
  } else {
    startwidget = OnboardingScrean();
  }
  runApp( SmartBarking(startWidget: startwidget,));
}

class SmartBarking extends StatelessWidget {
  late Widget startWidget ;
   SmartBarking({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: themelight(),
      darkTheme: themeDark(),
      themeMode: ThemeMode.light,
      
      home:  startWidget ,
    );
  }
}
