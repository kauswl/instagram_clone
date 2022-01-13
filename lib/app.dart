import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/pages.dart';
import 'package:untitled/pages/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Center(child: Text("에러가 발생했습니다. 다시 시도해주세요"));
            }

            return snapshot.data!.getBool('loginData') ?? false
                ? Pages()
                : Login();
          }
          else{
            return CircularProgressIndicator();
          }
      });
  }
}
