import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/acceuil_cnas.dart';
import 'package:techme/missions_cnas.dart';
import 'package:techme/tb.dart';
import 'package:techme/reclamation_cnas.dart';
import 'package:techme/control.dart';
import 'package:techme/details.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: op()));
}

class op extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<op> {
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
                      const SizedBox(
                        height: 200,
                        width: 585,
                      ),
                      const SizedBox(
                        width: 200,
                        child: Text(
                          'Liste des opérateurs',
                          style: TextStyle(
                              color: Color(0xFF4695CD),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 400,
                      ),
                      Image.asset(
                        'images/location.png',
                        width: 70,
                      )
                    ],
                  ),

                  // 1er opérateur

                  Row(
                    children: [
                      const SizedBox(
                        width: 220,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 910,
                        height: 50,
                        child: Row(children: [
                          const SizedBox(
                            width: 60,
                          ),
                          const Text(
                            'Nom de l"opérateur',
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          const Text('lorem ipseum'),
                          const SizedBox(
                            width: 270,
                            height: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => missions_cnas()),
                              );
                            },
                            child: Text('Missions',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF4695CD),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                            height: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => details()),
                              );
                            },
                            child: Text('Details',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),

                  // 2ème opérateur

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
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 910,
                        height: 50,
                        child: Row(children: [
                          const SizedBox(
                            width: 60,
                          ),
                          const Text(
                            'Nom de l"opérateur',
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          const Text('lorem ipseum'),
                          const SizedBox(
                            width: 270,
                            height: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => missions_cnas()),
                              );
                            },
                            child: Text('Missions',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF4695CD),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                            height: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => details()),
                              );
                            },
                            child: Text('Details',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),

                  // 3ème opérateur

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
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 910,
                        height: 50,
                        child: Row(children: [
                          const SizedBox(
                            width: 60,
                          ),
                          const Text(
                            'Nom de l"opérateur',
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          const Text('lorem ipseum'),
                          const SizedBox(
                            width: 270,
                            height: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => missions_cnas()),
                              );
                            },
                            child: Text('Missions',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF4695CD),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                            height: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => details()),
                              );
                            },
                            child: Text('Details',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
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
