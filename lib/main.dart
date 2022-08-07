import 'package:flutter/material.dart';

void main() {
  runApp(uygulamam());
}

class uygulamam extends StatelessWidget {
  const uygulamam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GirisEkrani(),
    );
  }
}

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({Key? key}) : super(key: key);

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  girisekrani() {
    if (t1.text == 'hatice' && t2.text == '123') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilEkrani(
            kullaniciAdi: t1.text,
            sifre: t2.text,
          ),
        ),
      );
    } else if (t1.text!='hatice'){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Yanlış Giriş Yaptınız!'),
            content:
                Text('Kullanıcı Adınızı yanlış girdiniz...'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Çıkış'),
              ),
            ],
          );
        },
      );
    }
    else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Yanlış Giriş Yaptınız!'),
            content:
            Text('Şifrenizi yanlış girdiniz...'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Çıkış'),
              ),
            ],
          );
        },
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        margin: EdgeInsets.all(80.0),
        child: Column(
          children: [
            TextFormField(
              controller: t1,
            ),
            TextFormField(controller: t2),
            ElevatedButton(onPressed: girisekrani, child: Text('gir'))
          ],
        ),
      ),
    );
  }
}

class ProfilEkrani extends StatefulWidget {
  String kullaniciAdi, sifre;
  ProfilEkrani({required this.kullaniciAdi, required this.sifre});

  @override
  State<ProfilEkrani> createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('çıkış'),
            )
          ],
        ),
      ),
    );
  }
}
