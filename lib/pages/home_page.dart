
import 'package:flutter/material.dart';
import 'package:untitled/pages/content_list_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //page를 바꾸기 위함
  int selectedIndex = 0;

  // bottom navigation bar 로 보여질 화면들
  List<Widget> pages = [
    ContentList(),
    Visibility(
      visible: true,
      child: Center(
        child: Text("검색화면"),
      ),
    ),
    Center(
      child: Text("영상화면"),
    ),
    Center(
      child: Text("쇼핑화면"),
    ),
    Center(
      child: Text("프로필화면"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0, left: 14),
            child: Image.asset(
              'imgs/add.png',
              width: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0, left: 14),
            child: Image.asset(
              'imgs/heart.png',
              width: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0, left: 14),
            child: Image.asset(
              'imgs/send.png',
              width: 25,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        title: Image.asset(
          'imgs/logo.png',
          width: 130,
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),*/
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        // selected index
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'imgs/home.png',
                width: 20,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                'imgs/search.png',
                width: 20,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                'imgs/video.png',
                width: 20,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                'imgs/bag.png',
                width: 20,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                'imgs/profile.png',
                width: 20,
              ),
              label: ""),
        ],
      ),
    );
  }
}
