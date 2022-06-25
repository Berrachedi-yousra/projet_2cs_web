import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/connexion.dart';
import 'package:techme/main.dart';
import 'package:techme/reclamation.dart';
import 'package:techme/inscription.dart';
import 'package:techme/reclamsurop.dart';
import 'package:techme/reclamop.dart';
import 'package:techme/reclamcnas.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(home: reclamation()));
}

class reclamation extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<reclamation> {
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
                  // First section

                  SizedBox(
                    height: 100,
                  ),

                  Row(
                    children: [
                      SizedBox(
                        width: 360,
                        height: 120,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            child: Text(
                              'Faire une réclamation',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.orange),
                            ),
                            width: 250,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat.',
                              textAlign: TextAlign.center,
                            ),
                            width: 350,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'images/complain.png',
                            width: 170,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // les 3 containers

                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 250,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 200, 200, 200),
                        ),
                        height: 330,
                        width: 230,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                'Réclamation sur l opérateur',
                                style: TextStyle(
                                    color: Color(0xFF4695CD),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 15,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => reclamsurop()),
                                  );
                                },
                                child: Text(
                                  'Faire une réclamation',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF4695CD),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
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
                          color: Color.fromARGB(255, 200, 200, 200),
                        ),
                        height: 330,
                        width: 230,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 170,
                              child: Text(
                                'Réclamation en tant qu employé de la CNAS',
                                style: TextStyle(
                                    color: Color(0xFF4695CD),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 35,
                              width: 15,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => reclamcnas()),
                                  );
                                },
                                child: Text(
                                  'Faire une réclamation',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF4695CD),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
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
                          color: Color.fromARGB(255, 200, 200, 200),
                        ),
                        height: 330,
                        width: 230,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                'Réclamation de l opérateur',
                                style: TextStyle(
                                    color: Color(0xFF4695CD),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 15,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => reclamop()),
                                  );
                                },
                                child: Text(
                                  'Faire une réclamation',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF4695CD),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  //color footer

                  SizedBox(
                    height: 90,
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
