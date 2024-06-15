import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  String icon;
  double? width;

  ImageData(
      this.icon, {
        Key? key,
        this.width = 55,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: width! / Get.mediaQuery.devicePixelRatio
    );
  }
}


class iconPath {
  static String get logo => 'lib/images/icon.jpg';
  static String get like => 'lib/images/fire.png';
  static String get comment => 'lib/images/comment.png';
  static String get share => 'lib/images/share.png';
  static String get like_ful => 'lib/images/fire_full.png';
  static String get home => 'lib/images/home.png';
  static String get stamp => 'lib/images/stamp.png';
  static String get wise => 'lib/images/wise_view.png';
  static String get competition => 'lib/images/competition.png';
  static String get info => 'lib/images/info.png';

}

class about_wise
{
  static var wise_list = [
    'lib/images/1.png',
    'lib/images/2.png',
    'lib/images/3.png',
    'lib/images/4.png',
    'lib/images/5.png',
    'lib/images/6.png',
    'lib/images/7.png',
    'lib/images/8.png',
    'lib/images/9.png',
    'lib/images/10.png'
  ];

  static var wise_word = [
    '시작한다면 좋은 결과로 이어질거에요!',
    '미래의 나도 나인거 아시죠?',
    '끈질기게 한다면 목표의 끝에 도달할 수 있을거에요!',
    '우리가 생각하는 것보다 우리의 몸은 약하지 않아요!',
    '실패가 두렵다고 시작하지 않으면 안되요!',
    '두려워하기보단 시작해보세요!',
    '포기는 배추 셀 때 쓰는말!',
    '뭔갈 하지 않으면 아무것도 일어나지 않아요!',
    '의지를 가진 당신, 뭐든 할 수 있어요!',
    '실패를 하다보면 언젠가 도달할 수 있어요!'
  ];
}