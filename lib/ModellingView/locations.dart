import 'package:ai/core/Shared/network/remote/modelling.dart';
import 'package:ai/core/Shared/widget/Widgets.dart';
import 'package:ai/presentation/screens/LogIn.dart';
import 'package:ai/presentation/screens/about.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/accountSettings.dart';

class LoctionsView extends StatefulWidget {
  const LoctionsView({super.key});

  @override
  State<LoctionsView> createState() => _LoctionsViewState();
}

class _LoctionsViewState extends State<LoctionsView> {
  @override
  void initState() {
    ModellingLocation.converting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Locations Status'),
        centerTitle: true,
       // leading: IconButton(icon:Icon(Icons.arrow_back_outlined), onPressed: () {  },),
      ),
        drawer: Drawer(
          backgroundColor: Colors.blueGrey,
          child: Column(
            children: [
              // SharedWidgets.defaultButton(text: "Home ", pressFunc: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),));
              // }),
              SizedBox(height: 50,),
              SharedWidgets.defaultButton(text: "Manage User", pressFunc: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AccSetPage(),));
              }),
              SizedBox(height: 50,),
              SharedWidgets.defaultButton(text: "About ", pressFunc: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutBody(),));
              }),
              SizedBox(height: 50,),
              SharedWidgets.defaultButton(text: "LogOut", pressFunc: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),));
              }),
            ],
          ),

        ),
      body:const  Center(
        child: CustomGridView(),
        // child: ListView.separated(
        //   itemCount: ModellingLocation.myList!.length,
        //   separatorBuilder: (context, index) {
        //     return const Divider(
        //       color: Colors.pinkAccent,
        //       endIndent: 8,
        //       indent: 8,
        //     );
        //   },
        //   itemBuilder: ((context, index) {
        //     return ListTile(
        //       title: const Text('Location Status : '), //State =
        //       subtitle: Text('$index ${ModellingLocation.myList![index]}'),
        //     );
        //   }),
        // ),
      ),

    );
  }
}

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        itemCount: ModellingLocation.myList!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 6,
        ),
        itemBuilder: (context, index) {
          return GridTile(
            child: Container(
              width: 100,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                        'location status is : ${ModellingLocation.myList![index]}'),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    flex: 3,
                    child:
                        ModellingLocation.myList![index].toString() == 'valid'
                            ? const Center(
                                child: Icon(
                                  Icons.car_repair,
                                  color: Colors.green,
                                  size: 64,
                                ),
                              )
                            : const Center(
                                child: Icon(
                                Icons.space_dashboard_rounded,
                                color: Colors.red,
                                size: 64,
                              )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
