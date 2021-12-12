import 'package:flutter/material.dart';

import 'package:bnb/view/weather_body.dart';
import 'package:bnb/view/settings_body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int screenIndex = 0;
  List<Widget> screenList = [WeatherBody(), SettingsBody()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screenList[screenIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: screenIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '날씨'),
          BottomNavigationBarItem(icon: Icon(Icons.app_settings_alt), label: '설정')
        ],
        onTap: (index) {
          setState(() { //상태 갱신이 되지 않으면 동작을 하지 않음
            screenIndex = index;
          });
        },
      ),
    );  // Scaffold
  } // build

}  // class_MyHomePageState
