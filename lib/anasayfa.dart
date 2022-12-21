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
  bool switchKontrol = false;
  bool checkboxKontrol = false;
  int radioDeger = 0;
  bool progressKontrol = false;
  double ilerleme = 30.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkelerListesi = <String>[];
  String secilenUlke = "Türkiye";
  var tfAlert = TextEditingController();

@override
  void initState() {
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("Italya");
    ulkelerListesi.add("Japonya");
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widget Kullanımı"),),
      body:  SingleChildScrollView(
        child: Center(
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
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: SwitchListTile(
                      title: const Text("Dart"),
                        controlAffinity: ListTileControlAffinity.leading, // Kendisini sola aldık yazısı sağa
                        value: switchKontrol,
                        onChanged:(veri){
                        setState(() {
                          switchKontrol = veri;
                        });

                        }
                        ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: CheckboxListTile(
                      title: const Text("Flutter"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checkboxKontrol,
                        onChanged: (veri){
                          setState(() {
                            checkboxKontrol = veri!;
                          });
                        }
                    ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: RadioListTile(
                      title: const Text("Barcelona"),
                        value: 1, groupValue: radioDeger,
                        onChanged: (veri){
                          setState(() {
                            radioDeger = veri!;
                          });
                        }
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: RadioListTile(
                        title: const Text("Real Madrid"),
                        value: 2, groupValue: radioDeger,
                        onChanged: (veri){
                          setState(() {
                            radioDeger = veri!;
                          });
                        }
                    ),
                  ),
                ],
              ),
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          progressKontrol = true;
                        });
                      },
                      child: const Text("Başla")
                  ),
                  Visibility(
                    visible: progressKontrol,
                      child: const CircularProgressIndicator()
                  ),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          progressKontrol = false;
                        });
                      },
                      child: const Text("Dur")
                  ),
              ],
              ),
              Text(ilerleme.toInt().toString()),
              Slider(
                min: 0.0,
                max: 100.0,
                value: ilerleme, onChanged: (veri){
                setState(() {
                  ilerleme = veri;
                });
              },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 120,
                    child: TextField(
                      controller: tfSaat,
                      decoration: const InputDecoration(hintText: "Saat") ,
                    ),
                  ),
                  IconButton(onPressed: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now())).then((value) => {
                      tfSaat.text = "${value!.hour} : ${value.minute}"
                    });

                  }, icon: const Icon(Icons.access_time)),
                  SizedBox(width: 120,
                    child: TextField(
                      controller: tfTarih,
                      decoration: const InputDecoration(hintText: "Tarih") ,
                    ),
                  ),
                  IconButton(onPressed: (){

                    showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2030))
                        .then((value) => {
                          tfTarih.text = "${value!.day}/ ${value.month}/${value.year}"
                    });

                  }, icon: const Icon(Icons.date_range)),

                ],
              ),
              DropdownButton(
                value: secilenUlke,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: ulkelerListesi.map((ulke){
                    return DropdownMenuItem(child: Text(ulke),value: ulke,);
                  }).toList(),
                  onChanged: (veri){
                    setState(() {
                      secilenUlke = veri!;
                    });
                  }
                  ),
              GestureDetector(
                onTap: (){
                  print("Tek Tıklandı");
                },
                onDoubleTap: (){
                  print("Çift tıklandı");
                },
                onLongPress: (){
                  print("uzun");
                },
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.red,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Silmek istiyor musunuz?"),
                            action: SnackBarAction(label: "Evet",onPressed: (){

                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Silindi.")));

                            },
                            ),
                          ),
                        );
                      },
                      child: const Text("Snackbar")

                  ),
                  ElevatedButton(

                      onPressed: (){

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.white,
                            content: const Text("İnternet bağlantısı yok!",style: TextStyle(color: Colors.indigoAccent),),
                            action: SnackBarAction(label: "Tekrar dene",
                              textColor: Colors.red,
                              onPressed: (){

                            },
                            ),
                          ),
                        );

                      },
                      child: const Text("Snackbar Ö")

                  ),
                  ElevatedButton(
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){

                              return AlertDialog(title: Text("Başlık") ,
                              content: Text("İçerik"),
                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("tamam seçildi.")));

                                  }, child: const Text("tamam")),
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);

                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("iptal seçildi.")));

                                  }, child: const Text("iptal")),

                                ],
                              );

                            }
                        );

                      },
                      child: const Text("Alert")

                  ),
                  ElevatedButton(
                      onPressed: (){

                        showDialog(
                            context: context,
                            builder: (BuildContext context){

                              return AlertDialog(
                                backgroundColor: Colors.grey,
                                title: Text("Kayıt işlemi") ,
                                content: TextField(controller: tfAlert,decoration: InputDecoration(hintText: "Veri"),),
                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Alınan veri ${tfAlert.text}")));

                                  }, child: const Text("Kaydet",style: TextStyle(color: Colors.black),)),
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);

                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("iptal seçildi.")));

                                  }, child: const Text("iptal",style: TextStyle(color: Colors.black),)),

                                ],
                              );

                            }
                        );
                      },
                      child: const Text("Alert Ö")

                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: (){
                    print("Switch durum: ${switchKontrol}");
                    print("Chechbox durum: ${checkboxKontrol}");
                    print("RadioButton durum: ${radioDeger}");
                    print("Slider durum: ${ilerleme}");
                    print(" Seçilen Ülke: ${secilenUlke}");

                  },
                  child: const Text("Göster")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
