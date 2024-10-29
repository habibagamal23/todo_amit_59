
import 'package:flutter/material.dart';

class TextfeildCustom extends StatelessWidget {
 final  String lable;
 final TextEditingController controller;

  const TextfeildCustom({super.key , required this.lable , required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(lable),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        )

      ),

    );
  }
}
