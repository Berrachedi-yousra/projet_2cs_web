import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/main.dart';
import 'package:techme/reclamation.dart';
import 'package:techme/inscription.dart';
import 'package:techme/acceuil_op.dart';
import 'package:techme/acceuil_cnas.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: connexion()));
}

class connexion extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<connexion> {
  void _seconnecter() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AcceuilOp()),
    );
  }

  void _seconnecter_cnas() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => acceuil_cnas()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      // login

                      Container(
                        width: 816,
                        height: 600,
                        child: Column(children: [
                          const SizedBox(
                            height: 50,
                            width: 10,
                          ),
                          Image.asset(
                            'images/cnas-white.png',
                            width: 70,
                          ),
                          const SizedBox(
                            height: 70,
                            width: 150,
                          ),
                          const Text(
                            "Connexion à votre compte",
                            style: TextStyle(
                                color: Color(0xFF4695CD),
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              width: 350,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 130, 130, 130))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: const TextField(
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              width: 350,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 130, 130, 130))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: const TextField(
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: _seconnecter,
                            child: Text(
                              'Se connecter',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: _seconnecter_cnas,
                            child: Text(
                              'Se connecter cnas',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                          ),
                        ]),
                      ),

                      // bleu part

                      Container(
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF4695CD),
                        ),
                        width: 550,
                        height: 655,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 250,
                              width: 150,
                            ),
                            Text(
                              'Bienvenue!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: 100,
                              height: 3,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Nous détectons votre type de compte',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()),
                                );
                              },
                              child: Text(
                                'retourner à la page d acceuil',
                                style: TextStyle(
                                    color: Color(0xFF4695CD),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20), // <-- Radius
                                ),
                              ),
                            )
                          ],
                        ),
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
