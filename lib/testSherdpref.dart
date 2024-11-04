import 'package:flutter/material.dart';
import 'package:sqfnotes/core/sherdprf.dart';

class Testsherdpref extends StatelessWidget {
  const Testsherdpref({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await SharedPrfHelper.setName("Habiba");
                  print("username set ");
                },
                child: Text("Set name")),
            ElevatedButton(
                onPressed: () async {
                  String? name = await SharedPrfHelper.getName();
                  print(name);
                },
                child: Text("get name")),
          ],
        ),
      ),
    );
  }
}
