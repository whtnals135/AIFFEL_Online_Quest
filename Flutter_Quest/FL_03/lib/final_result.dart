import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _is_cat = true; // 고양이인지 여부를 나타내는 변수

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Test',
      home: Navigator(
        pages: [
          MaterialPage(child: SecondScreen()), // 두 번째 화면을 표시하는 페이지
          if (_is_cat) MaterialPage(child: FirstScreen()) // 첫 번째 화면을 표시하는 페이지 (조건부)
        ],
        onPopPage: (route, result) => route.didPop(result), // 페이지가 팝될 때의 동작 정의
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.pets), // 앱바 왼쪽에 표시되는 아이콘
        title: Center(
          child: Text('First page'), // 앱바 타이틀
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()), // 다음 화면으로 이동하는 버튼
                    );
                  },
                  child: Text('Next'), // 버튼 텍스트
                ),
                SizedBox(height: 20), // 버튼과 이미지 사이 공간
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/catpic.jpg', // 앱의 asset에 있는 이미지 경로
                    width: 300,
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.favorite), // 앱바 왼쪽에 표시되는 아이콘
        title: Center( // 중앙 정렬
          child: Text('Second Page'), // 앱바 타이틀
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // 이전 화면으로 돌아가는 버튼
                  },
                  child: Text('Back'), // 버튼 텍스트
                ),
                SizedBox(height: 20), // 버튼과 이미지 사이 공간
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/dogpic.jpg', // 앱의 asset에 있는 이미지 경로
                    width: 300,
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
