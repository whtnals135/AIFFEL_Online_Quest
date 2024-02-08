// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(FirstScreen());
// }
//
// class MyApp extends StatelessWidget {
//   bool _is_cat = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Navigator Test',
//       home: Navigator(pages: [
//         MaterialPage(child: SecondScreen()),
//         if (_is_cat) MaterialPage(child: FirstScreen())
//       ], onPopPage: (route, result) => route.didPop(result)),
//     );
//   }
// }
//
//
// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(
//                 Icons.pets,
//                 size: 50,
//                 color: Colors.pink,
//               )
//             ],
//           ),
//           title: Center(
//             child: Text('First page'),
//           ),
//         ),
//         body: Container(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'images/catpic.jpg', // 네트워크 이미지의 URL
//                   width: 300,
//                   height: 300,
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SecondScreen()),
//                     );
//                   },
//                   child: Text('Next'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.pets),
//         title: Text('Second Page'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context); // 이전 화면으로 돌아가기
//             },
//             child: Text('Back'),
//           ),
//           SizedBox(height: 20), // 버튼과 이미지 사이 공간
//           Expanded(
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Image.asset(
//                 'images/dogpic.jpg', // 앱의 asset에 있는 이미지 경로
//                 width: 300,
//                 height: 300,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

