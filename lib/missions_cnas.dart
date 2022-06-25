import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/acceuil_cnas.dart';
import 'package:techme/tb.dart';
import 'package:techme/reclamation_cnas.dart';
import 'package:techme/control.dart';
import 'package:techme/op.dart';
import 'package:techme/facture_cnas.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: missions_cnas()));
}

class missions_cnas extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<missions_cnas> {
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
                        'Liste des missions',
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
                        height: 310,
                        child: Column(children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              const SizedBox(
                                width: 170,
                                child: Text(
                                  'Numéro de mission',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 200,
                                child: Text(
                                  'xxxxx',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 200,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => facture_cnas()),
                                  );
                                },
                                child: Text('Consulter la facture',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15)),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
                                ),
                              )
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
                                width: 170,
                                child: Text(
                                  'Nom complet du patient',
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
                                width: 170,
                                child: Text(
                                  'Date de mission',
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
                                width: 170,
                                child: Text(
                                  'Adresse de départ',
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
                                width: 170,
                                child: Text(
                                  'Adresse d"arrivé',
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
                                width: 170,
                                child: Text(
                                  'Nombre de patient',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  '01',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 80,
                              ),
                              SizedBox(
                                width: 120,
                                child: Text(
                                  'Attente',
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
                              const SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 170,
                                child: Text(
                                  'Temps d"attente',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  '0',
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
                                width: 170,
                                child: Text(
                                  'Nom complet de transporteur',
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
                        ]),
                      ),
                    ],
                  ),

                  // 2ème mission

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
                        height: 310,
                        child: Column(children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              const SizedBox(
                                width: 170,
                                child: Text(
                                  'Numéro de mission',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 200,
                                child: Text(
                                  'xxxxx',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 200,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => facture_cnas()),
                                  );
                                },
                                child: Text('Consulter la facture',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15)),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
                                ),
                              )
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
                                width: 170,
                                child: Text(
                                  'Nom complet du patient',
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
                                width: 170,
                                child: Text(
                                  'Date de mission',
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
                                width: 170,
                                child: Text(
                                  'Adresse de départ',
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
                                width: 170,
                                child: Text(
                                  'Adresse d"arrivé',
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
                                width: 170,
                                child: Text(
                                  'Nombre de patient',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  '01',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 80,
                              ),
                              SizedBox(
                                width: 120,
                                child: Text(
                                  'Attente',
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
                              const SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 170,
                                child: Text(
                                  'Temps d"attente',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  '0',
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
                                width: 170,
                                child: Text(
                                  'Nom complet de transporteur',
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
