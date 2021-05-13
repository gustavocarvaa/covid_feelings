import 'dart:math';

import 'package:covid_feelings/data/data.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CardsScreen extends StatefulWidget {
  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  bool wasChosen = false;
  Random rng = new Random();
  int chosenOne = 0;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: AnimatedCrossFade(
          crossFadeState:
              wasChosen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 800),
          firstChild: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0),
              padding: EdgeInsets.only(
                  top: 12.0, right: 12.0, left: 12.0, bottom: 20.0),
              itemBuilder: (context, index) {
                return FittedBox(
                  fit: BoxFit.fill,
                  child: GestureDetector(
                    onTap: wasChosen
                        ? null
                        : () {
                            setState(() {
                              wasChosen = true;
                              chosenOne = rng.nextInt(4);
                              cardKey.currentState.toggleCard();
                            });
                          },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/images/card.jpg'),
                        Container(
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(200),
                            ),
                            child: Text(
                              '${index + 1}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 90),
                            ))
                      ],
                    ),
                  ),
                );
              }),
          secondChild: FlipCard(
            key: cardKey,
            flipOnTouch: false,
            front: Image.asset('assets/images/card.jpg'),
            back: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          width:
                              91.66 / 100 * MediaQuery.of(context).size.width,
                          child: Image.asset(
                            'assets/images/inside.png',
                            fit: BoxFit.cover,
                          )),
                      Container(
                          width: 75 / 100 * MediaQuery.of(context).size.width,
                          child: Image.asset(
                            'assets/images/img$chosenOne.jpg',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          )),
                      Positioned(
                          // height: 50,
                          width: 240,
                          bottom: 40,
                          // right: 50,
                          child: Text(
                            content[chosenOne]['text'],
                            textAlign: TextAlign.center,
                            textScaleFactor: 0.8,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          cardKey.currentState.toggleCard();
                          wasChosen = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.0),
                        margin: EdgeInsets.only(top: 18.0),
                        decoration: BoxDecoration(
                          color: Colors.red[200],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text('TENTAR DE NOVO',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white)),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
