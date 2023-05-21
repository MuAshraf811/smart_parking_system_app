// ignore_for_file: sized_box_for_whitespace

import 'package:ai/core/Shared/network/remote/modelling.dart';
import 'package:ai/core/Shared/widget/Widgets.dart';
import 'package:ai/presentation/screens/LogIn.dart';
import 'package:ai/presentation/screens/about.dart';

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
            const SizedBox(
              height: 50,
            ),
            SharedWidgets.defaultButton(
                text: "Manage User",
                pressFunc: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccSetPage(),
                      ));
                }),
            const SizedBox(
              height: 50,
            ),
            SharedWidgets.defaultButton(
                text: "About ",
                pressFunc: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutBody(),
                      ));
                }),
            const SizedBox(
              height: 50,
            ),
            SharedWidgets.defaultButton(
                text: "LogOut",
                pressFunc: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogIn(),
                      ));
                }),
          ],
        ),
      ),
      body: const FinalView(),
    );
  }
}

class FinalView extends StatelessWidget {
  const FinalView({super.key});
  // final myList = [
  //   'occ',
  //   'free',
  //   'occ',
  //   'free',
  //   'free',
  //   'occ',
  //   'free',
  //   'occ',
  //   'free',
  //   'occ',
  //   'free',
  //   'occ',
  //   'free',
  //   'occ',
  //   'free',
  //   'occ',
  //   'occ',
  //   'occ',
  //   'occ',
  //   'occ',
  //   'occ',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.only(left: 6),
                      height: 67,
                      width: 41,
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          right: BorderSide(
                            color: Colors.white,
                            width: 4,
                          ),
                          left: BorderSide(
                            color: Colors.white,
                            width: 4,
                          ),
                          top: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        color: Colors.black38,
                      ),
                      child: ModellingLocation.myList![index]!.id == 'occ'
                          ? Transform.rotate(
                              angle: 270 * 3.14159265 / 180,
                              child: Image.asset(
                                fit: BoxFit.values[4],
                                'assets/images/671-6712895_car-plan-view-transparent-hd-png-download-2950311122-removebg-preview.png',
                              ),
                            )
                          : Center(
                              child: Transform.rotate(
                                angle: 90 * 3.14159265 / 180,
                                child: Text(
                                  textAlign: TextAlign.right,
                                  (index + 1).toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ));
                },
              ),
            ),
            const SizedBox(
              height: 400,
              child: VerticalDivider(
                thickness: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 150,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.only(left: 6),
                      height: 67,
                      width: 41,
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          right: BorderSide(
                            color: Colors.white,
                            width: 4,
                          ),
                          left: BorderSide(
                            color: Colors.white,
                            width: 4,
                          ),
                          top: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        color: Colors.black38,
                      ),
                      child: ModellingLocation.myList![index]!.id == 'occ'
                          ? Transform.rotate(
                              angle: 90 * 3.14159265 / 180,
                              child: Image.asset(
                                fit: BoxFit.values[4],
                                'assets/images/671-6712895_car-plan-view-transparent-hd-png-download-2950311122-removebg-preview.png',
                              ),
                            )
                          : Center(
                              child: Transform.rotate(
                                angle: 90 * 3.14159265 / 180,
                                child: Text(
                                  textAlign: TextAlign.right,
                                  (index + 10).toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomGridView extends StatelessWidget {
//   const CustomGridView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: GridView.builder(
//         itemCount: ModellingLocation.myList!.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 6,
//           childAspectRatio: 3 / 4,
//           mainAxisSpacing: 6,
//         ),
//         itemBuilder: (context, index) {
//           return GridTile(
//             child: Container(
//               width: 100,
//               margin: const EdgeInsets.all(8),
//               padding: const EdgeInsets.all(6),
//               decoration: const BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.all(Radius.circular(6)),
//               ),
//               child: Column(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Text(
//                         'location status is : ${ModellingLocation.myList![index]}'),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Expanded(
//                     flex: 3,
//                     child:
//                         ModellingLocation.myList![index].toString() == 'valid'
//                             ? const Center(
//                                 child: Icon(
//                                   Icons.car_repair,
//                                   color: Colors.green,
//                                   size: 64,
//                                 ),
//                               )
//                             : const Center(
//                                 child: Icon(
//                                 Icons.space_dashboard_rounded,
//                                 color: Colors.red,
//                                 size: 64,
//                               )),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class FinalView extends StatelessWidget {
//   const FinalView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 6,
//             itemBuilder: (context, index) {
//               return Container(
//                 height: 20,
//                 width: 60,
//                 padding: const EdgeInsets.all(10),
//                 margin:const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   color: Colors.grey,
//                 ),
//                 child: Expanded(
//                   child: Column(
//                     children: [
//                       Text(
//                         (index + 1).toString(),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 32,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       ModellingLocation.myList![index]!.id == 'free'
//                           ? const CircleAvatar(
//                               radius: 24,
//                               backgroundColor: Colors.greenAccent,
//                             )
//                           : const CircleAvatar(
//                               backgroundColor: Colors.red,
//                               radius: 24,
//                             ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         const SizedBox(
//           height: 32,
//         ),
        
//         Expanded(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: 4,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       height: 80,
//                       width: 60,
//                       padding: const EdgeInsets.all(10),
//                       margin:const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: Colors.grey,
//                       ),
//                       child: Expanded(
//                         child: Row(
//                           children: [
//                             ModellingLocation.myList![index + 6]!.id == 'free'
//                                 ? const CircleAvatar(
//                                     radius: 24,
//                                     backgroundColor: Colors.greenAccent,
//                                   )
//                                 : const CircleAvatar(
//                                     backgroundColor: Colors.red,
//                                     radius: 24,
//                                   ),
//                             Text(
//                               (index + 7).toString(),
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 32,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: 4,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       height: 80,
//                       width: 60,
//                       margin:const EdgeInsets.all(12),
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: Colors.grey,
//                       ),
//                       child: Expanded(
//                         child: Row(
//                           children: [
//                             ModellingLocation.myList![index + 11]!.id == 'free'
//                                 ? const CircleAvatar(
//                                     radius: 24,
//                                     backgroundColor: Colors.greenAccent,
//                                   )
//                                 : const CircleAvatar(
//                                     backgroundColor: Colors.red,
//                                     radius: 24,
//                                   ),
//                             Text(
//                               (index + 11).toString(),
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 32,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
