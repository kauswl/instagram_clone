import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages.dart';
import 'home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map loginData = {'3456': 'asdf', '5678': 'fghh'};
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  Widget logoArea() {
    return Center(
      child: Image.asset(
        "imgs/logo.png",
        width: 200,
      ),
    );
  }

  Widget inputArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextField(
              controller: idController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '전화번호, 사용자 이름 또는 이메일',
                  filled: true,
                  fillColor: Colors.white38,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                contentPadding: EdgeInsets.only(left: 10, bottom: 0, top: 0, right: 0),
            )
          ), //팽창
          width: 300,
        ),
        Container (
          child: TextField(
              controller: pwController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '비밀번호',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.only(left: 10, bottom: 0, top: 0, right: 0),
              )
          ), //팽창
          width: 300,
        ),
        SizedBox(
          height: 10,
        ),
        Text("비밀번호를 잊으셨나요?",
            style: TextStyle(color: Colors.blue[400])) //paddding, *sizedbox*
      ],
    );
  }

  Widget loginArea() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () async {

            if (idController.text=="") {
              print("아이디를 입력해주세요");
              return;
            }
            if (pwController.text=="") {
              print("비밀번호를 입력해주세요");
              return;
            }
            if (loginData.containsKey(idController.text) == false) {
              print("아이디가 존재하지 않습니다.");
              return;
            }
            if (loginData[idController.text] != pwController.text) {
              print("일치하지 않습니다");
              return;
            }

            print("로그인 성공!");
            // shared preferences 얻기
            final prefs = await SharedPreferences.getInstance();
            // 값 저장하기
            prefs.setBool('loginData', true);

            Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pages()));
    },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue[400],
            ),
            width: 300,
            height: 50,

            child: Center(
              child: Text(
                "로그인",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 2,
              width: 300,
              color: Colors.grey[200],
            ),
            Container(
                color: Colors.white,
                width: 70,
                child: Center(child: Text("또는")))
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "imgs/facebook_icon.png",
              width: 30,
              height: 30,
            ),
            Text(
              "facebook으로 로그인",
              style: TextStyle(color: Colors.blue[400]),
            )
          ],
        )
      ],
    );
  }

  Widget signinArea() {
    return Column(
      children: [
        Container(
          height: 2,
          width: 300,
          color: Colors.grey[200],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("계정이 없으신가요?"),
            SizedBox(
              width: 5,
            ),
            Text(
              "가입하기",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱을 예쁘게 만들어주는거
      backgroundColor: Colors.white,
      body: Stack(
        children: [
         Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [logoArea(), inputArea(), loginArea()],
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: signinArea(),
            ),
            bottom: 0,
            right: 0,
            left: 0,
          )
        ],
      ),
    );
  }

  void clickEvent() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }
}
