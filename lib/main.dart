import 'package:flutter/material.dart';
import 'package:widgets_kullanimi/anasayfa.dart';
import 'package:widgets_kullanimi/odev4/odev_anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const OdevAnasayfa()  //Anasayfa()
    );
  }
}

