import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/connexion.dart';
import 'package:techme/main.dart';
import 'package:techme/reclamation.dart';
import 'package:techme/inscription.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(home: assurance()));
}

class assurance extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<assurance> {
  void _enregistrer() {}
  void _charger_cacher_signature() {}

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
                    MaterialPageRoute(builder: (context) => MyApp()),
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
                    MaterialPageRoute(builder: (context) => inscription()),
                  );
                },
                child: Text('Inscription',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => reclamation()),
                  );
                },
                child: Text('Réclamaton',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: null,
                child: Text('A propos',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => connexion()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text('Connexion',
                    style: TextStyle(color: Color(0xFF4695CD), fontSize: 17)),
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
                  // Titre de page
                  Row(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 560,
                      ),
                      SizedBox(
                        width: 210,
                        child: Text(
                          'Déclaration et demande d assurance',
                          style: TextStyle(
                              color: Color(0xFF4695CD),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 400,
                      ),
                      Image.asset(
                        'images/assurance-medicale.png',
                        width: 100,
                      )
                    ],
                  ),

                  // Second section

                  const SizedBox(
                    height: 15,
                  ),

                  Row(children: [
                    SizedBox(
                      width: 270,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Color.fromARGB(255, 185, 185, 185))),
                      height: 120,
                      width: 800,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Numéro d immatriculation',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          SizedBox(
                            width: 500,
                            child: TextField(
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                        ],
                      ),
                    )
                  ]),

                  // section 3 employeur

                  Row(
                    children: [
                      SizedBox(
                        width: 450,
                        height: 80,
                      ),
                      Text(
                        'Déclaration de l employeur et de l organisation assimilé',
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
                  Row(children: [
                    SizedBox(
                      width: 270,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 800,
                        height: 420,
                        child: Column(children: [
                          SizedBox(
                            width: 400,
                          ),
                          SizedBox(
                              width: 150,
                              child: Column(
                                children: [
                                  TextField(textAlign: TextAlign.center),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Numéro employeur',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 141, 141, 141),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                ],
                              )),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                              'L’employeur ou l’organisme assimilé soussigné (Nom, Prénom, ou raison social)'),
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                  'Déclare que l’assuré désigné ci-dessous est embauché à compter du (date de recrutement) '),
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 130,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                  'En qualité de (profession ou situation de l’assuré):'),
                              SizedBox(
                                width: 350,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                              ),
                              Text('Fait le'),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text('à'),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            width: 250,
                          ),
                          ElevatedButton(
                            onPressed: _charger_cacher_signature,
                            child: Text(
                              'Charger le cachet avec signature',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF4695CD),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                          ),
                        ]))
                  ]),

                  // renseignement de l'assuré

                  Row(
                    children: [
                      SizedBox(
                        width: 525,
                        height: 80,
                      ),
                      Text(
                        'Renseignement concernant l assuré',
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
                        height: 800,
                        child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
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
                                  'Prenom',
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
                                  'Nom de l epoux',
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
                                  'Date de naissance',
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
                                  'Lieu de naissance',
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
                                  'Commune de naissance',
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
                                  'Wilaya de naissance',
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
                                  'Prénom du père',
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
                                  'Nom de la mère',
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
                                  'Prénom de la mère',
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
                                  'Sexe',
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
                                  'Situation familiale',
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
                                  'Nationalité',
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
                                  'Adresse complète',
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
                                  'Code postal',
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
                        ]),
                      ),
                    ],
                  ),

                  // ascendants

                  Row(
                    children: [
                      SizedBox(
                        width: 450,
                        height: 80,
                      ),
                      Text(
                        'Renseignements concernant les ascendants ayants droit',
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
                  Row(children: [
                    SizedBox(
                      width: 270,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 800,
                        height: 300,
                        child: Column(children: [
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                '01',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 126, 125, 125),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                '02',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 126, 125, 125),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                '03',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 126, 125, 125),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                '04',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 126, 125, 125),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                '05',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 126, 125, 125),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ]))
                  ]),

                  // conjoints

                  Row(
                    children: [
                      SizedBox(
                        width: 450,
                        height: 80,
                      ),
                      Text(
                        'Renseignements concernant les conjoint(s) ayants droit',
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
                  Row(children: [
                    SizedBox(
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
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                '01',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 126, 125, 125),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                '02',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 126, 125, 125),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                '03',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 126, 125, 125),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                '04',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 126, 125, 125),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ]))
                  ]),

                  //Déclaration d'assuré

                  const SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    SizedBox(
                      width: 270,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 207, 207, 207),
                        ),
                        width: 800,
                        height: 360,
                        child: Column(children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text('Déclaration de l assuré',
                              style: TextStyle(
                                  color: Color(0xFF4695CD),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 700,
                                child: Column(
                                  children: [
                                    Text(
                                        'L’assuré soussigné (Nom et Prénom de l’assuré).',
                                        textAlign: TextAlign.left),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                        'Déclare que les informations fugurant sur la présente demande d’affiliation sont exacte et commplétes.',
                                        textAlign: TextAlign.left),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                        'En outre, je m’engage à informer immédiatement la caisse de tout changement pouvant intervenir dans ma situation familiale ou dans la situation socio-professionnelle de l’un de les ayants droit.',
                                        textAlign: TextAlign.left),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 200,
                              ),
                              Text('A'),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text('le'),
                              SizedBox(
                                width: 150,
                                child: TextField(textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            width: 250,
                          ),
                          ElevatedButton(
                            onPressed: null,
                            child: Text(
                              'Charger la signature',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF4695CD)),
                            ),
                          ),
                        ]))
                  ]),

                  const SizedBox(
                    height: 30,
                    width: 600,
                  ),

                  Row(
                    children: [
                      const SizedBox(
                        width: 900,
                      ),
                      ElevatedButton(
                        onPressed: _enregistrer,
                        child: Text('Enregistrer',
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
                      ),
                    ],
                  ),

                  //color footer

                  const SizedBox(
                    height: 50,
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
