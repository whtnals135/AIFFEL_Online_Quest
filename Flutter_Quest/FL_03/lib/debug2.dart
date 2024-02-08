import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _is_cat = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Test',
      home: Navigator(
        pages: [
          MaterialPage(child: SecondScreen()),
          if (_is_cat) MaterialPage(child: FirstScreen()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.pets, size: 50, color: Colors.pink)]),
              title: Center(
                child: Text('First page'),
              ),
            ),
            body: Container(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () {
                                print(
                                    "_is_cat 현재 상태: ${context.findAncestorStateOfType<_MyAppState>()?._is_cat}");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondScreen()),
                                );
                              },
                              child: Text('Next')),
                          // SizedBox(height: 20),
                          Container(
                              child: Image.asset(
                                'images/big.jpeg',
                                width: 300,
                                height: 300,
                              ))
                        ])))));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.pets, size: 50, color: Colors.pink)]),
              title: Center(
                child: Text('Second page'),
              ),
            ),
            body: Container(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () {
                                print(
                                    "_is_cat 현재 상태: ${context.findAncestorStateOfType<_MyAppState>()?._is_cat}");
                                Navigator.pop(context);
                              },
                              child: Text('Back')),
                          // SizedBox(height: 20),
                          Container(
                              child: Image.asset(
                                'images/big.jpeg',
                                width: 300,
                                height: 300,
                              ))
                        ])))));
  }
}


// 이미지 출력도 완성되었으니 마지막으로 한번 더 점검해보자!