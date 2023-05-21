// ignore_for_file: sized_box_for_whitespace

import 'package:ai/core/Shared/network/remote/modelling.dart';
import 'package:ai/core/Shared/widget/Widgets.dart';
import 'package:ai/presentation/screens/LogIn.dart';
import 'package:ai/presentation/screens/about.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import '../presentation/screens/accountSettings.dart';

class LocationsView extends StatefulWidget {
  const LocationsView({super.key});

  @override
  State<LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  @override
  void initState() {
    ModellingLocation.converting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.teal,
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
      body: const ParkingView(),
    );
  }
}

class ParkingView extends StatefulWidget {
  const ParkingView({super.key});

  @override
  State<ParkingView> createState() => _ParkingViewState();
}

class _ParkingViewState extends State<ParkingView> {
  late Future<List<ModellingLocation>> _locationsFuture;

  @override
  void initState() {
    super.initState();
    _locationsFuture = ModellingLocation.converting();
  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<ModellingLocation>>(
      future: _locationsFuture,
      builder: (context, snapshot) {
        // Data fetched successfully, display it in your widget
        final locations = snapshot.data;
        return ConditionalBuilder(
              condition: locations?.length != null ,
              builder : (context) => SafeArea(
                child: Row( /**** locations![index].id  USE THIS INSTEAD OF MODELLING VIEW!!!!!             */
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
                              child: locations![index].id == 'occ'
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
                              child: locations![index].id == 'occ'
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
              fallback: (context) => const Center(child: CircularProgressIndicator()),


            );
      },
    );
  }

}
/*
[{"id":"1","locations":"free"},{"id":"2","locations":"acc"},{"id":"3","locations":"free"},{"id":"4","locations":"free"},{"id":"5","locations":"occ"},{"id":"6","locations":"occ"},{"id":"7","locations":"occ"},{"id":"8","locations":"occ"},{"id":"9","locations":"occ"},{"id":"10","locations":"free"},{"id":"11","locations":"free"},{"id":"12","locations":"free"},{"id":"13","locations":"occ"},{"id":"14","locations":"occ"},{"id":"15","locations":"free"}]
[{"id":"1","locations":"free"},{"id":"2","locations":"acc"},{"id":"3","locations":"free"},{"id":"4","locations":"free"},{"id":"5","locations":"occ"},{"id":"6","locations":"occ"},{"id":"7","locations":"occ"},{"id":"8","locations":"occ"},{"id":"9","locations":"occ"},{"id":"10","locations":"free"},{"id":"11","locations":"free"},{"id":"12","locations":"free"},{"id":"13","locations":"occ"},{"id":"14","locations":"occ"},{"id":"15","locations":"free"}]
 */