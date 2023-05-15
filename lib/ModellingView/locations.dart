import 'package:ai/core/Shared/network/remote/modelling.dart';
import 'package:flutter/material.dart';

class LoctionsView extends StatelessWidget {
  const LoctionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Locations Status'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.separated(
          itemCount: ModellingLocation.myList.length,
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.pinkAccent,
              endIndent: 8,
              indent: 8,
            );
          },
          itemBuilder: ((context, index) {
            return  ListTile(
              title: const Text('Location Status : '),
              subtitle: Text('${ModellingLocation.myList[index]}'),
            );
          }),
        ),
      ),
    );
  }
}
