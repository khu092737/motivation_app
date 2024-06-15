import 'package:flutter/material.dart';
import 'package:modernlogintute/imageData.dart';
import 'package:modernlogintute/post_widget.dart';
import 'package:modernlogintute/avartar_widget.dart';

class home_page extends StatelessWidget
{
  const home_page({Key? key}) : super(key: key);

  Widget postlist()
  {
    return Column(
        children:List.generate(50,
                (index) => post_widget()).toList(),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("M-mate")
      ),
      body: ListView(
        children: [
          postlist(),
        ],
      ),
    );
  }
}