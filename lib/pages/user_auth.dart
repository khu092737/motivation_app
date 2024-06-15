import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/login_page.dart';
import 'package:modernlogintute/pages/main_page.dart';


class user_auth extends StatelessWidget
{
  const user_auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>
        (
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot)
          {
            if(snapshot.hasData)//만약 유저가 로그인 하면
              {
                return main_page();
              }
            else//로그인 실패시
              {
                return LoginPage();
              }

          }
        )
    );

  }
}
