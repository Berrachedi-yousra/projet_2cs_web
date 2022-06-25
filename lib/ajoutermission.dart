import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/main.dart';
import 'package:techme/transporteurs.dart';
import 'package:techme/facture.dart';
import 'package:techme/rembourssement.dart';
import 'package:techme/acceuil_op.dart';
import 'package:techme/missions.dart';

//import 'dart:async';

void main() {
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: ajoutermission()));
}

class ajoutermission extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ajoutermission> {
  void _confirmer() {}

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
                    MaterialPageRoute(builder: (context) => AcceuilOp()),
                  );
                },
                child: Text('Acceuil',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
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
                child: Text('Missions',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => transporteurs()),
                  );
                },
                child: Text('Transporteurs',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => facture()),
                  );
                },
                child: Text('Facture',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => rembourssement()),
                  );
                },
                child: Text('Rembourssement',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          )
        ],
        backgroundColor: Color(0xFF4695CD),
        shadowColor: Colors.transparent,
      ),
      body: Container(
          child: Stack(
        children: [
          Expanded(
              flex: 1,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Titre de la page d'ajout

                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 250,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => missions()),
                          );
                        },
                        icon: Image.asset(
                          'images/previous.png',
                        ),
                        iconSize: 50,
                      ),
                      const SizedBox(
                        width: 300,
                      ),
                      const Text(
                        'Ajouter une mission',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),

                  // Section d'ajout

                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 300,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 800,
                        height: 500,
                        child: Column(children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nom complet du patient',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 500,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Date de mission',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Heure de départ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Adresse de départ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 500,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Adresse d"arrivé',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 500,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nombre de patients',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Attente',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Temps d"attente',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nom complet du transporteur',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),

                  // boutton confirmer

                  Row(
                    children: [
                      const SizedBox(
                        width: 900,
                        height: 150,
                      ),
                      ElevatedButton(
                        onPressed: _confirmer,
                        child: Text('Confirmer',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // <-- Radius
                          ),
                        ),
                      ),
                    ],
                  ),

                  //color footer

                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.orange,
                    height: 30,
                  ),
                ],
              ))),
        ],
      )),
    );
  }
}
