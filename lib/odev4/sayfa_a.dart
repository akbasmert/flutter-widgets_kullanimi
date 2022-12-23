import 'package:flutter/material.dart';
import 'package:widgets_kullanimi/odev4/sayfa_b.dart';

class SayfaA extends StatefulWidget {
  const SayfaA({Key? key}) : super(key: key);

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sayfa A"),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SayfaB())); // push yerine pushReplament diyerek geri tuşu ile direk anasayfaya dönus sahladık

            }, child: Text("Git B"))
          ],
        ),
      ),
    );
  }
}
