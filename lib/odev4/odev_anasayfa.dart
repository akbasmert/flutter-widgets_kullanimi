import 'package:flutter/material.dart';
import 'package:widgets_kullanimi/odev4/sayfa_a.dart';
import 'package:widgets_kullanimi/odev4/sayfa_x.dart';

class OdevAnasayfa extends StatefulWidget {
  const OdevAnasayfa({Key? key}) : super(key: key);

  @override
  State<OdevAnasayfa> createState() => _OdevAnasayfaState();
}

class _OdevAnasayfaState extends State<OdevAnasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ANASAYFA"),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SayfaA()));

            }, child: Text("Git A"),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SayfaX()));

            }, child: Text("Git X"),
            ),
          ],
        ),

      ),
    );
  }
}
