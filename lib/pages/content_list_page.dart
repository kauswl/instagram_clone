import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/items/instagram_content_item.dart';

class ContentList extends StatefulWidget {
  const ContentList({Key? key}) : super(key: key);

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  List<Widget> items= [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0, left: 14),
            child: InkWell(
                onTap: () async {
                  if (!await Permission.photos.request().isGranted) {
                    return;
              }
                  final ImagePicker _picker = ImagePicker();
                  final PickedFile? image = await _picker.getImage(source: ImageSource.gallery);

                  if (image == null) {
                    return;
                  }
                  setState(() {
                    items.add(Image.file(File(image.path), width: 50, height: 50,));
                  });
                  },
                child: Image.asset(
                  'imgs/add.png',
                  width: 25,
                )),
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
        ),
      body: ListView(children: [
        Row(children: items,),
        InstagramContentItem(userName: "김현지", profileImg: "imgs/profile.png", content: "인스타", contentImg: "imgs/logo.png", count: 100),
        InstagramContentItem(userName: "김현지", profileImg: "imgs/profile.png", content: "인스타", contentImg: "imgs/logo.png", count: 100)
      ]),
    );
  }
}
