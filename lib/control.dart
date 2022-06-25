import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/main.dart';
import 'package:techme/acceuil_cnas.dart';
import 'package:techme/tb.dart';
import 'package:techme/op.dart';
import 'package:techme/reclamation_cnas.dart';
import 'package:techme/liste_controles.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: control()));
}

class control extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<control> {
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
                  //Titre de la page

                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 450,
                      ),
                      Text(
                        'Plannifier les contrôles',
                        style: TextStyle(
                            color: Color(0xFF4695CD),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),

                  // section de texte

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
                              'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat.',
                              textAlign: TextAlign.center,
                            ),
                            width: 350,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'images/controls.png',
                            width: 180,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Consulter la liste des contrôles

                  const SizedBox(
                    height: 50,
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
                                builder: (context) => liste_controles()),
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
                          'Consulter la liste des contrôles',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),

                  // Titre 2

                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 450,
                      ),
                      Text(
                        'Créer un nouveau contrôle',
                        style: TextStyle(
                            color: Color(0xFF4695CD),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),

                  // Contenu du nouveau contrôle

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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              const SizedBox(
                                width: 250,
                                child: Text(
                                  'Raison sociale de l"opérateur',
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
                                width: 250,
                                child: Text(
                                  'Contrôleur responsable 1',
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
                                  'Contrôleur responsable 2',
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
                                  'Date de contrôle',
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
                                  'Heure de contrôle',
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
                              const SizedBox(
                                width: 200,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 450,
                                  ),
                                  ElevatedButton(
                                    onPressed: _enregistrer,
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF4695CD),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20), // <-- Radius
                                      ),
                                    ),
                                    child: Text(
                                      'Enregistrer',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
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
