import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/connexion.dart';
import 'package:techme/main.dart';
import 'package:techme/reclamation.dart';
import 'package:techme/inscription.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(home: reclamcnas()));
}

class reclamcnas extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<reclamcnas> {
  void _enregistrer() {}

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
                        width: 230,
                        child: Text(
                          'Réclamation en tant qu employé de la CNAS',
                          style: TextStyle(
                              color: Color(0xFF4695CD),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  // renseignement de l'opérateur

                  Row(
                    children: [
                      SizedBox(
                        width: 525,
                        height: 10,
                      ),
                      Text(
                        'Renseignement concernant l employé',
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
                        height: 300,
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
                                  'Matricule',
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
                                  'Prénom',
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
                                  'Siège de travail',
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

                  // Contenu de la réclamation

                  Row(
                    children: [
                      const SizedBox(
                        width: 575,
                        height: 80,
                      ),
                      const Text(
                        'Contenu de la réclamation',
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
                        height: 300,
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
                                  'Réclamation sur',
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
                                  'Nom',
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
                                  'Date de l accident',
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
                                  'Date de réclamation',
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
                                  'De quoi s agit-il?',
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

                  // boutton enregister

                  Row(
                    children: [
                      const SizedBox(
                        width: 900,
                        height: 150,
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
                    height: 20,
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
