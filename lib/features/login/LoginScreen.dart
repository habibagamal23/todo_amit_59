import 'package:flutter/material.dart';
import 'package:sqfnotes/core/sherdprf.dart';
import 'package:sqfnotes/features/home/ui/HomeScreen.dart';

import '../../core/widgest/cusombutton.dart';
import '../../core/widgest/textFeild_custom.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernamecontroler = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextfeildCustom(
              lable: 'Username',
              controller: usernamecontroler,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              onPressed: () async {
                await SharedPrfHelper.setIslogin(true);
                await SharedPrfHelper.setName(usernamecontroler.text);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Homescreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
