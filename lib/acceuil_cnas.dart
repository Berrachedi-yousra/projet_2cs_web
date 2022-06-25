import 'package:flutter/material.dart';
import 'package:techme/reclamation_cnas.dart';
import 'package:techme/tb.dart';
import 'package:techme/op.dart';
import 'package:techme/control.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: acceuil_cnas()));
}

class acceuil_cnas extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<acceuil_cnas> {
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
                child: const Text('Acceuil',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const SizedBox(
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
                child: const Text('Tableau de bord',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => op()),
                  );
                },
                child: const Text('Opérateurs',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const   SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => control()),
                  );
                },
                child: const Text('Control',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const   SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => reclamation_cnas()),
                  );
                },
                child:const  Text('Réclamations',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const  SizedBox(
                width: 30,
              ),
            ],
          )
        ],
        backgroundColor:const  Color(0xFF4695CD),
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [
      Expanded(
          flex: 1,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: const [
                   SizedBox(
                    width: 630,
                  ),
                   Text(
                    'Bienvenue!',
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w900,
                        fontSize: 25),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children:const  [
                  SizedBox(
                    width: 540,
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 200,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:const  Color.fromARGB(255, 200, 200, 200),
                    ),
                    height: 270,
                    width: 250,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                            ),
                            Image.asset(
                              'images/location.png',
                              width: 50,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          width: 150,
                          child: Text(
                            'Données des opérateurs',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                          width: 15,
                        ),
                        const SizedBox(
                          width: 170,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 200, 200, 200),
                    ),
                    height: 270,
                    width: 250,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                            ),
                            Image.asset(
                              'images/protection2.png',
                              width: 50,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          width: 150,
                          child: Text(
                            'Tableau de bord',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                          width: 15,
                        ),
                        const SizedBox(
                          width: 170,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:const  Color.fromARGB(255, 200, 200, 200),
                    ),
                    height: 270,
                    width: 250,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                            ),
                            Image.asset(
                              'images/info.png',
                              width: 50,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          width: 150,
                          child: Text(
                            'Controls et réclamations',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                          width: 15,
                        ),
                        const SizedBox(
                          width: 170,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ))),
        ],
      ),
    );
  }
}
