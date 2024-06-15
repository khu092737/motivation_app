import 'package:flutter/material.dart';
import 'dart:math';
import 'package:modernlogintute/imageData.dart';

class wise_page extends StatelessWidget
{
  wise_page({super.key});
  var randomNum = Random().nextInt(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("오늘의 명언")
      ),

      body: Card(
        child: Column(
          children: <Widget>[
            //const SizedBox(height: 15),
            Image.asset(about_wise.wise_list[randomNum]),
            const SizedBox(height: 30),
            Text(
                about_wise.wise_word[randomNum],
                style: TextStyle(fontWeight: FontWeight.bold)
            )
          ],
        ),
      ),
    );
  }
}
