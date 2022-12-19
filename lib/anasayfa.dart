import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  String alinanVeri = "";
  var tfKontrol = TextEditingController();
  String resimAdi = "resim1.png";
  String resimAdi2 = "baklava.png";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widget Kullanımı"),),
      body:  Center(
        child: Column(
          children: [
              Text(alinanVeri),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              child: TextField(
                controller: tfKontrol,
                decoration: const InputDecoration(hintText: "Veri"),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                alinanVeri = tfKontrol.text;
              });
            },

                child: Text("Yap")

            ),
            Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                   resimAdi = "resim1.png";

                   resimAdi2 = "kofte.png";
                  });
                },

                    child: Text("Resim1 ")

                ),
                Image.asset("resimler/$resimAdi"),
                SizedBox(
                    width: 48,
                    height: 48,
                    child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/$resimAdi2")),
                ElevatedButton(onPressed: (){
                  setState(() {
                    resimAdi = "resim2.png";
                    resimAdi2 = "ayran.png";
                  });
                },

                    child: Text("Resim2")

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
