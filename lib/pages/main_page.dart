import 'package:flutter/material.dart';
import 'package:modernlogintute/imageData.dart';
import 'package:modernlogintute/pages/rival_page.dart';
import 'package:modernlogintute/pages/wise_page.dart';
import 'package:modernlogintute/pages/stamp_page.dart';
import 'package:modernlogintute/pages/acount_page.dart';
import 'package:modernlogintute/pages/home_page.dart';
// ignore_for_file: prefer_const_constructors

class main_page extends StatefulWidget
{
  @override
  State<main_page> createState() => MyAppState();
}

class MyAppState extends State<main_page> {
  int sIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: sIndex,
          children: [
            home_page(),
            stamp_page(),
            wise_page(),
            rival_page(),
            acount_page()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // currentIndex: (),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black12,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(iconPath.home, width: 25, height: 25),
              label: " ",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(iconPath.stamp, width: 25, height: 25),
              label: " ",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(iconPath.wise, width: 25, height: 25),
              label: " ",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(iconPath.competition, width: 25, height: 25),
              label: " ",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(iconPath.info, width: 25, height: 25),
              label: " ",
            ),
          ],
          currentIndex: sIndex,
          onTap: (index) {
            setState(
                  () {
                sIndex = index;
              },
            );
          },
        )
    );
  }
}
