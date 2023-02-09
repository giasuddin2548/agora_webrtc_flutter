import 'package:flutter/material.dart';
import 'package:meetme/video_screen.dart';

import 'home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meet Me',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:  HomeScreen(),
    );
  }
}
