import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/avartar_widget.dart';
import 'package:modernlogintute/imageData.dart';


class post_widget extends StatelessWidget
{
  const post_widget({Key? key}) : super(key: key);

  Widget header()
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          avartar_widget(
            type: aType.type3,
            userName: "test1", //사용자 이름
            size: 40,
            thumbPath: 'https://postfiles.pstatic.net/MjAyNDA2MTJfMjUw/MDAxNzE4MTE4NDM0ODM4.9xcynCJD6sYuhaHxqF7Xj9OFuHvwLn2QiM8mU7VqsHAg.83NpHGddTk7C5mn9LMYykclXUEfrwLU77We7UAIvy5Mg.JPEG/profile.jpg?type=w966',
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
            ),
          )
        ],
      ),
    );
  }

  Widget images()
  {
    return CachedNetworkImage(
        imageUrl: 'https://postfiles.pstatic.net/MjAyNDA2MTJfNDQg/MDAxNzE4MTE4NDI5ODI0.eQ_RrJb05du4soU1zCoimCxN5qec3V79wRUcbHnqeaYg.CG4vMn4MqxWq7LhfPLwOyDVXnL5hzd92PnjQWTqz32Eg.JPEG/test_main.jpg?type=w966'
    );
  }

  Widget infoCnt() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(iconPath.like_ful, width: 30),
              const SizedBox(width: 10),
              Image.asset(iconPath.comment, width: 40),
              const SizedBox(width: 10),
            ],
          ),
          Image.asset(iconPath.share, width: 25),
          //const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget infoDes()
  {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '화력 100%',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('test1',style: TextStyle(fontWeight: FontWeight.bold)),
            Text('오운완!')
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          header(),
          const SizedBox(height: 10),
          images(),
          const SizedBox(height: 10),
          infoCnt(),
          const SizedBox(height: 10),
          infoDes(),
        ],
      ),
    );
  }
}