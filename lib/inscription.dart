import 'dart:html';

import 'package:flutter/material.dart';
import 'package:techme/connexion.dart';
import 'package:techme/main.dart';
import 'package:techme/reclamation.dart';
import 'package:techme/assurance.dart';
import 'package:techme/operateur.dart';
//import 'dart:async';

//Color(0xFF4695CD)

void main() {
  runApp(MaterialApp(debugShowMaterialGrid: false, home: inscription()));
}

class inscription extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<inscription> {
  void _telecharger_operateur() {}
  void _telecharger_assure() {}

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
              //child: FractionallySizedBox(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // First section

                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 360,
                        height: 120,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'images/quality.png',
                            width: 180,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            child: Text(
                              'Déclaration et demande d assurance',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color(0xFF4695CD)),
                            ),
                            width: 220,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const SizedBox(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat.',
                              textAlign: TextAlign.center,
                            ),
                            width: 350,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Assurance()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20), // <-- Radius
                                ),
                              ),
                              child: Text(
                                'devenir assuré',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  // Second section

                  const SizedBox(
                    height: 100,
                  ),

                  Row(
                    children: [
                      const SizedBox(
                        width: 360,
                        height: 120,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            child: Text(
                              'Déclaration d opérateur de transport',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color(0xFF4695CD)),
                            ),
                            width: 220,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const SizedBox(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat.',
                              textAlign: TextAlign.center,
                            ),
                            width: 350,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Operateur()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20), // <-- Radius
                                ),
                              ),
                              child: Text(
                                'devenir opérateur',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'images/person.png',
                            width: 180,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Third section

                  const SizedBox(
                    height: 100,
                  ),

                  Row(
                    children: [
                      const SizedBox(
                        width: 345,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 200, 200, 200),
                        ),
                        width: 700,
                        child: Column(children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 270,
                              ),
                              Text(
                                'Demande sur place',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Color(0xFF4695CD)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                height: 270,
                                width: 250,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        'Déclaration et demande d assurance',
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt',
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    ElevatedButton(
                                      onPressed: _telecharger_assure,
                                      child: Text(
                                        'télécharger le formulaire',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.orange,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                height: 270,
                                width: 250,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        'Déclaratin d opérateur de transport',
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt',
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    ElevatedButton(
                                      onPressed: _telecharger_operateur,
                                      child: Text(
                                        'télécharger le formulaire',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.orange,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          )
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
