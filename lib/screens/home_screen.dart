import 'package:flutter/material.dart';

import 'cards_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(alignment: Alignment.center, children: [
        Image.asset('assets/images/capa.jpg',
            fit: BoxFit.fitHeight, height: MediaQuery.of(context).size.height),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              stops: [0.5, 1.0],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
              tileMode: TileMode.repeated,
              colors: <Color>[
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Veja como é fácil descobrir seu futuro.',
              style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 30.0,
                  fontFamily: 'Archivo Black',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Descubra agora seu futuro com base no tarô da Carminha, clique em "COMECE A USAR" e escolha uma carta.',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.deepOrange[200]),
            ),
          ]),
        ),
        Positioned(
          bottom: 40.0,
          child: TextButton(
              onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return CardsScreen();
              })),
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text('COMEÇAR A USAR',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
              )),
        ),
      ]),
    );
  }
}
