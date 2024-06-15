import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum aType {type1, type2, type3}

class avartar_widget extends StatelessWidget {
  bool? hasStory;
  String thumbPath;
  String? userName;
  aType type;
  double? size;

  avartar_widget({
    Key? key,
    required this.type,
    required this.thumbPath,
    this.hasStory,
    this.userName,
    this.size = 65,
  }) : super(key: key);

  Widget type1Widget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            Colors.white,
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(size!),
              child: SizedBox(
                width: size,
                height: size,
                child: CachedNetworkImage(
                  imageUrl: thumbPath,
                  fit: BoxFit.cover,
                ),
              )
          )
      )
    );
  }

/*
  Widget type2Widget() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size!),
        child: SizedBox(
          width: size,
          height: size,
          child:
            imageUrl: thumbPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
*/

  Widget type3widget() //게시글 보여주는 위젯
  {
    return Row(
      children: [
        type1Widget(),
       Text(
         userName = "test1",
         style: const TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 16,
         ),
       ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    switch(type) {
      case aType.type1: //스토리보드
        return type1Widget();
      case aType.type2: //내스토리
      case aType.type3: //게시글
        return type3widget();
    }
  }



}
