import 'package:flutter/material.dart';
import 'package:sqfnotes/core/colors_manger.dart';
import 'package:sqfnotes/core/string_constant.dart';
import 'package:sqfnotes/features/home/ui/HomeScreen.dart';

import 'core/database_helper.dart';
import 'core/widgest/textFeild_custom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Homescreen()
    );
  }
}
