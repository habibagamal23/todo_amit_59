import 'package:flutter/material.dart';
import 'package:sqfnotes/core/colors_manger.dart';
import 'package:sqfnotes/core/sherdprf.dart';
import 'package:sqfnotes/core/string_constant.dart';
import 'package:sqfnotes/features/home/ui/HomeScreen.dart';
import 'package:sqfnotes/testSherdpref.dart';

import 'core/database_helper.dart';
import 'core/widgest/textFeild_custom.dart';
import 'features/login/LoginScreen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrfHelper.startShred();
  await checkislogin();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  final String titlename = " Flutter";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:titlename,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: islogged? Homescreen(): Loginscreen()
    );
  }


}

  late bool islogged ;

 Future checkislogin () async{
 bool ? islogin=  await SharedPrfHelper.getIsLogin();
 if(islogin != null){
   islogged =true;

 }else{
   islogged=false;
 }

}