import 'package:flutter/material.dart';
import 'package:techme/connexion.dart';
import 'package:techme/main.dart';
import 'package:techme/inscription.dart';
import 'package:techme/screens/reclamation/reclamation_de_operateur.dart';
import 'package:techme/screens/reclamation/reclamation_de_cnas.dart';

import 'reclamation_sur_operateur.dart';



class Reclamation extends StatefulWidget {
  const Reclamation({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Reclamation> {
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
                child: const Text('Acceuil',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const   SizedBox(
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
                child:const  Text('Inscription',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const   SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Reclamation()),
                  );
                },
                child: const Text('Réclamaton',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const   SizedBox(
                width: 15,
              ),
              const     OutlinedButton(
                onPressed: null,
                child: Text('A propos',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const  SizedBox(
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
                child:const  Text('Connexion',
                    style: TextStyle(color: Color(0xFF4695CD), fontSize: 17)),
              ),
              const    SizedBox(
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
              // First section

              const     SizedBox(
                height: 100,
              ),

              Row(
                children: [
                  const    SizedBox(
                    width: 360,
                    height: 120,
                  ),
                  Column(
                    children: const [
                      SizedBox(
                        width: 250,
                        child: Text(
                          'Faire une réclamation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.orange),
                        ),

                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 350,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat.',
                          textAlign: TextAlign.center,
                        ),

                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                  const  SizedBox(
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

              const  SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 250,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:const Color.fromARGB(255, 200, 200, 200),
                    ),
                    height: 330,
                    width: 230,
                    child: Column(
                      children: [
                        const   SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
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
                        const SizedBox(
                          height: 30,
                          width: 15,
                        ),
                        const  SizedBox(
                          width: 150,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const  SizedBox(
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
                                    builder: (context) => const ReclamationSurOperateur()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary:const  Color(0xFF4695CD),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                            child:const Text(
                              'Faire une réclamation',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  const    SizedBox(
                    width: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:const  Color.fromARGB(255, 200, 200, 200),
                    ),
                    height: 330,
                    width: 230,
                    child: Column(
                      children: [
                        const   SizedBox(
                          height: 30,
                        ),
                        const     SizedBox(
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
                        const  SizedBox(
                          height: 35,
                          width: 15,
                        ),
                        const    SizedBox(
                          width: 150,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const   SizedBox(
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
                                    builder: (context) => const ReclamationCnas()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF4695CD),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                            child:const  Text(
                              'Faire une réclamation',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  const      SizedBox(
                    width: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 200, 200, 200),
                    ),
                    height: 330,
                    width: 230,
                    child: Column(
                      children: [
                        const      SizedBox(
                          height: 30,
                        ),
                        const   SizedBox(
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
                        const     SizedBox(
                          height: 30,
                          width: 15,
                        ),
                        const     SizedBox(
                          width: 150,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const      SizedBox(
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
                                    builder: (context) => const ReclamationDeOperateur()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary:const  Color(0xFF4695CD),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                            child:const  Text(
                              'Faire une réclamation',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //color footer

              const   SizedBox(
                height: 90,
              ),
              Container(
                color: Colors.orange,
                height: 30,
              ),
            ],
          ))),
        ],
      ),
    );
  }
}
