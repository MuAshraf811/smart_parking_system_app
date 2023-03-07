import 'package:ai/core/Shared/network/local/cache_helper.dart';
import 'package:ai/core/Shared/widget/Widgets.dart';
import 'package:ai/presention/screens/LogIn.dart';
import 'package:ai/presention/screens/Registerion.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/appconstance/app_constance.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({required this.image, required this.title, required this.body});
}

class OnboardingScrean extends StatefulWidget {
  OnboardingScrean({super.key});

  @override
  State<OnboardingScrean> createState() => _OnboardingScreanState();
}

class _OnboardingScreanState extends State<OnboardingScrean> {
  List<BoardingModel> itemModel = [
    BoardingModel(
        image: 'assets/images/car.png',
        title: 'FIND YOUR PARKING SITE',
        body: 'You can use our App to find parking sites and reduce time of searching .'),
    BoardingModel(
        image: 'assets/images/park.png',
        title: 'Relocate your car easily'.toUpperCase(),
        body: 'We provide informations about the free Spaces in the selected site .'),
    BoardingModel(
        image: 'assets/images/pay.png',
        title: 'Easier Payment Methods'.toUpperCase(),
        body: 'You can Pay With our App based on staying time .'),
  ];

  var boaredcontroller = PageController();
  bool islast = false ; 

  void skip ()async{
    CacheHelper.savedata(key: 'onboarding', value: true ).then((value) {
      if (true) {
       SharedWidgets.navigateAndFinish(context, LogIn() ) ;
      } 
    }) ;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          
          actions: [
            TextButton(
              onPressed: skip 
            
            , child: const  Text('SKIP' , style: TextStyle(fontWeight: FontWeight.bold),))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildboardingItem(itemModel[index]),
                itemCount: itemModel.length,
                controller: boaredcontroller,
                onPageChanged: (index){
                  if (index == itemModel.length -1){
                    setState(() {
                      islast = true ; 
                    });
                  }
                  else{
                    setState(() {
                      islast = false ; 
                    });
                  }
                },
              )),
              const SizedBox(
                height: 45,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boaredcontroller,
                    count: itemModel.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppConstance.defaultColor,
                      dotColor: Colors.grey , 
                      dotHeight: 10 , 
                      expansionFactor: 5 , 
                      dotWidth: 10 , 
                      spacing: 5 , 

                    ),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (islast ){
                       skip()  ; 
                      
                      }
                      else{
                        boaredcontroller.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: const Icon(Icons.arrow_forward),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget buildboardingItem(BoardingModel model) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(child: Image.asset(model.image)),
      Text(
        model.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        model.body,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      )
    ]);
  }
}
