import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/facture.dart';
import 'package:techme/missions.dart';
import 'package:techme/acceuil_op.dart';
import 'package:techme/rembourssement.dart';
import 'package:techme/ajoutertransporteur.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: transporteurs()));
}

class transporteurs extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<transporteurs> {
  void _seconnecter() {}
  void _supprimer() {}

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
                    MaterialPageRoute(builder: (context) => Facture()),
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
                  Row(
                    children: [
                      Column(
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
                                'Liste des transporteurs',
                                style: TextStyle(
                                    color: Color(0xFF4695CD),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 140,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ajoutertransporteur()),
                                  );
                                },
                                child: const Text(
                                  'Ajouter un transporteur',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
                                ),
                              )
                            ],
                          ),

                          // 1er transporteur

                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 220,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Color.fromARGB(
                                            255, 185, 185, 185))),
                                width: 910,
                                height: 180,
                                child: Row(children: [
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 30,
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
                                                  color: Color.fromARGB(
                                                      255, 120, 120, 120),
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
                                                  color: Color.fromARGB(
                                                      255, 120, 120, 120),
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
                                              'Date de recrutement',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 120, 120, 120),
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
                                              'Type de véhicule',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 120, 120, 120),
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
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 90,
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      Image.asset(
                                        'images/face.png',
                                        width: 110,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 115,
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 110,
                                      ),
                                      ElevatedButton(
                                        onPressed: _supprimer,
                                        child: const Text(
                                          'Supprimer',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFF4695CD),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20), // <-- Radius
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                            ],
                          ),

                          // 2ème transporteur

                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 220,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Color.fromARGB(
                                            255, 185, 185, 185))),
                                width: 910,
                                height: 180,
                                child: Row(children: [
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 30,
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
                                                  color: Color.fromARGB(
                                                      255, 120, 120, 120),
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
                                                  color: Color.fromARGB(
                                                      255, 120, 120, 120),
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
                                              'Date de recrutement',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 120, 120, 120),
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
                                              'Type de véhicule',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 120, 120, 120),
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
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 90,
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      Image.asset(
                                        'images/face.png',
                                        width: 110,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 115,
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 110,
                                      ),
                                      ElevatedButton(
                                        onPressed: _supprimer,
                                        child: const Text(
                                          'Supprimer',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFF4695CD),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20), // <-- Radius
                                          ),
                                        ),
                                      )
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
                        ],
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
