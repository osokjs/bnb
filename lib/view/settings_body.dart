// 환경 설정 화면
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  String _bankSelected = '서울';
  List<String> cityList = ['서울', '부산', '인천', '경기', '전북', '제주'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: settingsBody(),
    );
  } // build

  Widget settingsBody() {
    return Column(
      children: [
        heading('이건 헤딩 테스트', 'h1'),
        dropDownButtonsColumn(cityList, '광역시를 선택하세요.'),
        heading('두 번째 헤딩', 'h3'),
        const Text('기타 설정 부분'),
        heading('세 번째 헤딩', 'h3'),
        const Text('About 날기에 대하여'),
      ],
    ); // SingleChildScrollView
  } // settingsBody

  Widget dropDownButtonsColumn(List<String> list, String hint) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 24, top: 12),
      child: Container(
        height: 55,
        //gives the height of the dropdown button
        width: MediaQuery.of(context).size.width,
        //gives the width of the dropdown button
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Color(0xFFF2F2F2)),
// padding: const EdgeInsets.symmetric(horizontal: 13), //you can include padding to control the menu items
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.yellowAccent,
            // background color for the dropdown items
            buttonTheme: ButtonTheme.of(context).copyWith(
              alignedDropdown:
                  true, //If fals  e (the default), then the dropdown's menu will be wider than its button.
            ),
          ),
          child: DropdownButtonHideUnderline(
            // to hide the default underline of the dropdown button
            child: DropdownButton<String>(
              iconEnabledColor: const Color(0xFF595959),
              // icon color of the dropdown button
              items: list.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                );
              }).toList(),
              hint: Text(
                hint,
                style: const TextStyle(color: Color(0xFF8B8B8B), fontSize: 15),
              ),
              // setting hint
              isExpanded: true,
              // 화살표 크기 조절
              onChanged: (String? value) {
                setState(() {
                  _bankSelected = value ?? '서울'; // saving the selected value
                });
              },
              value: _bankSelected, // displaying the selected value
            ),
          ),
        ),
      ),
    );
  } // dropDownButtonsColumn

  Widget heading(String msg, String headingType) {
    return Html(
      data: '<$headingType>$msg</$headingType>',
      style: {
        'h1': Style(color: Colors.red),
      },
    ); // Html
  } // heading

} // class SettingsBody
