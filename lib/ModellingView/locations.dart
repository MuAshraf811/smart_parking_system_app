import 'package:ai/core/Shared/network/remote/modelling.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      ),
      body: Center(
        child: ListView.separated(
          itemCount: ModellingLocation.myList!.length,
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.pinkAccent,
              endIndent: 8,
              indent: 8,
            );
          },
          itemBuilder: ((context, index) {
            return  ListTile(
              title: const Text('Location Status : '),//State =
              subtitle: Text('$index ${ModellingLocation.myList![index]}'),
            );
          }),
        ),
      ),
    );
  }
}
