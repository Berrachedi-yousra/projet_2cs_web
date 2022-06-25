import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/acceuil_cnas.dart';
import 'package:techme/tb.dart';
import 'package:techme/op.dart';
import 'package:techme/reclamation_cnas.dart';
import 'package:techme/control.dart';

//import 'dart:async';

void main() {
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: liste_controles()));
}

class liste_controles extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<liste_controles> {
  void _valider() {}

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
                  //titre de page
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 590,
                      ),
                      const Text(
                        'Liste des contrôles',
                        style: TextStyle(
                            color: Color(0xFF4695CD),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 140,
                      ),
                    ],
                  ),

                  // 1ère mission

                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 230,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 910,
                        height: 250,
                        child: Column(children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  'Raison sociale de l"opérateur',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  'Lorem ipseum dolor sit amet',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
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
                                width: 200,
                                child: Text(
                                  'loreum ipseum dorot sit amet',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  'Contrôleur responsable 2',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  'loreum ipseum',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 300,
                              ),
                              SizedBox(
                                width: 170,
                                child: Text(
                                  'Heure de départ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  'loreum',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  'Date de contrôle',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  'loreum ipseum dorot sit amet',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  'Heure de contrôle',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  'loreum ipseum',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 250,
                              ),
                              ElevatedButton(
                                onPressed: _valider,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
                                ),
                                child: Text(
                                  'Valider',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ],
              ))),
        ],
      )),
    );
  }
}
