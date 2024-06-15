import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/avartar_widget.dart';

class acount_page extends StatelessWidget
{
  const acount_page({Key? key}) : super(key: key);

  Widget user_stat(String title, int val)
  {
    return Column(
      children: [
        Text(
          val.toString(),
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 15,
              color: Colors.black
          ),
        ),
      ],
    );
  }

  Widget act_percent(String title, int val)
  {
    String percent = val.toString() + "%";
    return Column(
      children: [
        Text(
          percent,
          style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 15,
              color: Colors.black
          ),
        ),
      ],
    );
  }

  Widget user_info()
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          avartar_widget(
            type: aType.type1,
            thumbPath: 'https://postfiles.pstatic.net/MjAyNDA2MTJfMjUw/MDAxNzE4MTE4NDM0ODM4.9xcynCJD6sYuhaHxqF7Xj9OFuHvwLn2QiM8mU7VqsHAg.83NpHGddTk7C5mn9LMYykclXUEfrwLU77We7UAIvy5Mg.JPEG/profile.jpg?type=w966',
            size: 80,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: user_stat('게시글', 5)),
                Expanded(child: user_stat('라이벌', 2)),
                Expanded(child: act_percent('열정력', 20)),
              ],
            ),
          )
        ],
      ),
      const SizedBox(height: 15),
      const Text(
        '안녕하세요 test1 입니다',
        style: TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          )
        ]
      ),
    );
  }

  Widget edit_profile()
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    color: const Color(0xffdedede),
                  ),
                ),
                child: const Text(
                  '프로필 수정',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget post_view()
  {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 100,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemBuilder: (BuildContext context, int index)
        {
          return Container(
            color: Colors.grey,
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("마이페이지")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            user_info(),
            edit_profile(),
            const SizedBox(height: 20),
            post_view(),
          ],
        ),
      ),
    );
  }
}