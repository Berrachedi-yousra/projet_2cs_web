import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/tb.dart';
import 'package:techme/acceuil_cnas.dart';
import 'package:techme/reclamation_cnas.dart';
import 'package:techme/op.dart';
import 'package:techme/control.dart';
import 'package:techme/transporteurs_cnas.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: details()));
}

class details extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<details> {
  void _seconnecter() {}

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
                    MaterialPageRoute(builder: (context) => acceuil_cnas()),
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
                    MaterialPageRoute(builder: (context) => tb()),
                  );
                },
                child: Text('Tableau de bord',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => op()),
                  );
                },
                child: Text('Opérateurs',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => control()),
                  );
                },
                child: Text('Control',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => reclamation_cnas()),
                  );
                },
                child: Text('Réclamations',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const SizedBox(
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
                  // Titre de page
                  Row(
                    children: [
                      const SizedBox(
                        height: 200,
                        width: 560,
                      ),
                      const SizedBox(
                        width: 230,
                        child: Text(
                          'Détails sur l"opérateur',
                          style: TextStyle(
                              color: Color(0xFF4695CD),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 250,
                      ),
                      Image.asset(
                        'images/info.png',
                        width: 70,
                      )
                    ],
                  ),

                  // renseignement de l'opérateur

                  Row(
                    children: [
                      const SizedBox(
                        width: 525,
                        height: 80,
                      ),
                      const Text(
                        'Renseignement concernant l opérateur',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 270,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 800,
                        height: 200,
                        child: Column(children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Raison sociale',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Siège sociale',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Date de création',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Wilaya',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nombre d employé',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nombre de transporteurs',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),

                  // renseignement du dirigeant

                  Row(
                    children: [
                      const SizedBox(
                        width: 525,
                        height: 80,
                      ),
                      const Text(
                        'Renseignement concernant le dirigeant',
                        style: TextStyle(
                            color: Color(0xFF4695CD),
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 270,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 800,
                        height: 250,
                        child: Column(children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nom',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Prénom',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Date de naissance',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Lieu de naissance',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'adresse',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Situation familiale',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nombre de transporteurs',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),

                  // boutton des transporteurs

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 450,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => transporteurs_cnas()),
                          );
                        },
                        child: Text('Liste des transporteurs',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // <-- Radius
                          ),
                        ),
                      )
                    ],
                  ),

                  // renseignement sur le matériel

                  Row(
                    children: [
                      const SizedBox(
                        width: 525,
                        height: 80,
                      ),
                      const Text(
                        'Renseignement concernant le matériel',
                        style: TextStyle(
                            color: Color(0xFF4695CD),
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 270,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 800,
                        height: 250,
                        child: Column(children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Nomre de véhicule type A',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Adresse de départ (A)',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nombre de véhicule type B',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Adresse de départ (B)',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nombre de véhicule type C',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Adresse de départ (C)',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Disponibilité de matériel',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text('Lorem ipseum dolor sit amet'),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),

                  //color footer

                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    color: Color(0xFF4695CD),
                    height: 30,
                  ),
                ],
              ))),
        ],
      )),
    );
  }
}
