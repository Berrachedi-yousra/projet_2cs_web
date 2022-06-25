import 'dart:html';
import 'package:provider/provider.dart';
import 'package:techme/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:techme/connexion.dart';
import 'package:techme/inscription.dart';
import 'package:techme/reclamation.dart';
//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  _gosite() async {
    const url = 'https://teledeclaration.cnas.dz/';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                          MaterialPageRoute(
                              builder: (context) => inscription()),
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
                          MaterialPageRoute(
                              builder: (context) => reclamation()),
                        );
                      },
                      child: Text('Réclamaton',
                          style: TextStyle(color: Colors.white, fontSize: 17)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    OutlinedButton(
                      onPressed: _gosite,
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text('Connexion',
                          style: TextStyle(
                              color: Color(0xFF4695CD), fontSize: 17)),
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
            body: Stack(
              children: [
            Expanded(
                flex: 1,
                //child: FractionallySizedBox(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Background image

                    Image.asset(
                      'images/acceuil.png',
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 90,
                    ),

                    //First section

                    Row(
                      children: [
                        const SizedBox(
                          width: 300,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              width: 300,
                              child: Text(
                                'A propos de la Caisse Nationale des Assurés Sociaux',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            const SizedBox(
                              width: 250,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF4695CD)),
                              ),
                              child: const Text(
                                'Consulter le site officiel',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 300,
                          width: 200,
                        ),
                        Image.asset(
                          'images/protection2.png',
                          width: 250,
                          height: 300,
                        ),
                      ],
                    ),

                    // Second section

                    const SizedBox(
                      height: 90,
                    ),

                    Row(
                      children: [
                        const SizedBox(
                          width: 400,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Besoin d une prise en charge?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/appel-telephonique.png',
                                      width: 90,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 150,
                                      child: Text(
                                        'Appel téléphonique',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 200,
                                      child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 170,
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/adresse.png',
                                      width: 110,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 200,
                                      child: Text(
                                        'Sur place',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
                                        textAlign: TextAlign.center,
                                      ),
                                      width: 190,
                                    )
                                  ],
                                )
                              ],
                            )
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
                        SizedBox(
                          width: 370,
                          height: 120,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'images/gestion-de-projet.png',
                              width: 180,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 120,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              child: Text(
                                'La prise en charge, comment ça se passe?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                              width: 350,
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
                            )
                          ],
                        )
                      ],
                    ),

                    // Fourth section
                    const SizedBox(
                      height: 70,
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 400,
                        ),
                        Column(
                          children: [
                            Image.asset('images/one.png'),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              child: Text(
                                'Se rapprocher d un apérateur de transport',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 123, 121, 121),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              width: 150,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Image.asset('images/two.png'),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              child: Text(
                                'Fournir les documents nécessaires',
                                style: TextStyle(
                                    color:
                                        Color.fromARGB(255, 123, 121, 121),
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              width: 150,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Image.asset('images/three.png'),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              child: Text(
                                'Avoir la réponse de la demande',
                                style: TextStyle(
                                    color:
                                        Color.fromARGB(255, 123, 121, 121),
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              width: 150,
                            )
                          ],
                        ),
                      ],
                    ),

                    // footer

                    const SizedBox(
                      height: 100,
                    ),

                    Container(
                      color: Color.fromARGB(255, 187, 187, 187),
                      child: Row(children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 400,
                                    ),
                                    Text(
                                      'Contactez-nous',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  children: [
                                    Text('loreum ipseum'),
                                    Text('loreum ipseum'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                ),
                                IconButton(
                                    onPressed: null,
                                    icon:
                                        Image.asset('images/linkedin.png')),
                                IconButton(
                                    onPressed: null,
                                    icon:
                                        Image.asset('images/facebook.png')),
                                IconButton(
                                  onPressed: null,
                                  icon: Image.asset('images/twitter.png'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 400,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'images/map.jpg',
                              width: 200,
                            ),
                          ],
                        ),
                      ]),
                    ),

                    Container(
                      color: Color(0xFF4695CD),
                      child: const SizedBox(height: 25),
                    ),
                  ],
                ))),
              ],
            ),
          );

  }
}
