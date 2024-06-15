import 'package:flutter/material.dart';
import 'package:modernlogintute/components/Calendar_widget.dart';

class stamp_page extends StatelessWidget
{
  const stamp_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("스탬프 현황"),
          ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            calendar(),
            const SizedBox(height: 15),
            Text("오늘모은 스탬프: 5개"),
          ],
        ),
      ),
    );
  }
}
