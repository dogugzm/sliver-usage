import 'dart:math' as matematik;

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // içine sadece Sliver lı widget lar alabilir yani listeye padding eklemek için normal padding yerine SliverPadding çağırmalıyım.
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.amber.shade500,
          floating: false,
          pinned: true,
          // scroll yapınca appbarın kaybolmaması için
          flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Sliver App Bar",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              centerTitle: true,
              background: Image.asset(
                "images/appbar.png",
                fit: BoxFit.contain,
              )),
          expandedHeight: 200, //SliverAppBar ın tamamen açıkken kapladığı alan.
        ),
        SliverList(
          delegate: SliverChildListDelegate(sabitListeElemenlari()),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonk,
              childCount: 6),
        ), // 6 defa dinamik eleman üretecek.
        SliverFixedExtentList(
            // SliverList e göre perfomans olarak daha iyidir çünkü silverlist de ekranda görünmeyen elemanların arkada boyutunu hesaplar ama fixedlist de önceden değer atıyoruz
            delegate: SliverChildListDelegate(
              sabitListeElemenlari(),
            ),
            itemExtent: 300),
        SliverGrid(
            delegate: SliverChildListDelegate(
              sabitListeElemenlari(),
            ),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
      ],
    );
  }

  List<Widget> sabitListeElemenlari() {
    return [
      Container(
        height: 100,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 18),
        ),
        color: Colors.amber.shade100,
      ),
      Container(
        height: 100,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 2",
          style: TextStyle(fontSize: 18),
        ),
        color: Colors.amber.shade200,
      ),
      Container(
        height: 100,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 3",
          style: TextStyle(fontSize: 18),
        ),
        color: Colors.amber.shade300,
      ),
      Container(
        height: 100,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 4",
          style: TextStyle(fontSize: 18),
        ),
        color: Colors.amber.shade400,
      ),
      Container(
        height: 100,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 5",
          style: TextStyle(fontSize: 18),
        ),
        color: Colors.amber.shade500,
      ),
      Container(
        height: 100,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 6",
          style: TextStyle(fontSize: 18),
        ),
        color: Colors.amber.shade600,
      ),
    ];
  }

  Widget _dinamikElemanUretenFonk(BuildContext context, int index) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Text(
        "Dinamik Liste Elemanı ${index + 1}",
        style: TextStyle(fontSize: 18),
      ),
      color: randomRenk(),
    );
  }

  Color randomRenk() {
    return Color.fromARGB(
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255));
  }
}
