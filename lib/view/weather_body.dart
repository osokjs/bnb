// 날씨 예보 화면
import 'package:flutter/material.dart';

class WeatherBody extends StatefulWidget {
  const WeatherBody({Key? key}) : super(key: key);

  @override
  _WeatherBodyState createState() => _WeatherBodyState();
}

class _WeatherBodyState extends State<WeatherBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: weatherBody(),
    );
  } // build

  Widget weatherBody() {
    return Column(
      children: <Widget>[
        Text('현재 날씨 부분'),
        Icon(
          Icons.refresh,
          semanticLabel: '새로고침',
          color: Colors.white,
          size: 30.0,
        ),
        Text('시간별 예보 부분'),
        Title(
          title: 'title Widget',
          color: Colors.indigoAccent,
          child: Text('이것은 타이틀 위젯입니다.'),
        ),
        Text('중기 예보 부분'),
        Image.asset(
          'images/clear_n.png',
          width: 32.0,
          height: 32.0,
          semanticLabel: '맑음 밤 이미지',
        ),
      ],
    ); // Column
  } // weatherBody

} // class WeatherBody
