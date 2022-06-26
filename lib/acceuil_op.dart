import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/main.dart';
import 'package:techme/transporteurs.dart';
import 'package:techme/facture.dart';
import 'package:techme/missions.dart';
import 'package:techme/rembourssement.dart';

//import 'dart:async';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: AcceuilOp()));
}

class AcceuilOp extends StatefulWidget {
  const AcceuilOp({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<AcceuilOp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const  AcceuilOp()),
                  );
                },
                child:const  Text('Acceuil',
                    style:  TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const  SizedBox(
                width: 15,
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => missions()),
                  );
                },
                child:const  Text('Missions',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const   SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => transporteurs()),
                  );
                },
                child:const  Text('Transporteurs',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const   SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Facture()),
                  );
                },
                child:const  Text('Facture',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const   SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => rembourssement()),
                  );
                },
                child:const  Text('Rembourssement',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const    SizedBox(
                width: 30,
              ),
            ],
          )
        ],
        backgroundColor:const  Color(0xFF4695CD),
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [
      Expanded(
          flex: 1,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children:const  [
                  SizedBox(
                    width: 630,
                  ),
                  Text(
                    'Bienvenue!',
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w900,
                        fontSize: 25),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 540,
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const      SizedBox(
                    width: 200,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:const  Color.fromARGB(255, 200, 200, 200),
                    ),
                    height: 270,
                    width: 250,
                    child: Column(
                      children: [
                        const   SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                            ),
                            Image.asset(
                              'images/money.png',
                              width: 50,
                            ),
                          ],
                        ),
                        const   SizedBox(
                          height: 15,
                        ),
                        const  SizedBox(
                          width: 150,
                          child: Text(
                            'Système de facturation',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const   SizedBox(
                          height: 15,
                          width: 15,
                        ),
                        const  SizedBox(
                          width: 170,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const   SizedBox(
                    width: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 200, 200, 200),
                    ),
                    height: 270,
                    width: 250,
                    child: Column(
                      children: [
                        const   SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const   SizedBox(
                              width: 100,
                            ),
                            Image.asset(
                              'images/protection2.png',
                              width: 50,
                            ),
                          ],
                        ),
                        const    SizedBox(
                          height: 15,
                        ),
                        const   SizedBox(
                          width: 150,
                          child: Text(
                            'Accès aux données',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const     SizedBox(
                          height: 15,
                          width: 15,
                        ),
                        const    SizedBox(
                          width: 170,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const     SizedBox(
                    width: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:const  Color.fromARGB(255, 200, 200, 200),
                    ),
                    height: 270,
                    width: 250,
                    child: Column(
                      children: [
                        const     SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const      SizedBox(
                              width: 100,
                            ),
                            Image.asset(
                              'images/money.png',
                              width: 50,
                            ),
                          ],
                        ),
                        const   SizedBox(
                          height: 15,
                        ),
                        const    SizedBox(
                          width: 150,
                          child: Text(
                            'Système de rembourssement',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const    SizedBox(
                          height: 15,
                          width: 15,
                        ),
                        const    SizedBox(
                          width: 170,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ))),
        ],
      ),
    );
  }
}
