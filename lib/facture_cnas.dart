import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/acceuil_cnas.dart';
import 'package:techme/reclamation_cnas.dart';
import 'package:techme/op.dart';
import 'package:techme/control.dart';
import 'package:techme/tb.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: facture_cnas()));
}

class facture_cnas extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<facture_cnas> {
  void _distance() {}
  void _attestation() {}
  void _certificat() {}
  void _envoyer() {}

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
                        'Facture de la mission',
                        style: TextStyle(
                            color: Color(0xFF4695CD),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 250,
                      ),
                      Image.asset(
                        'images/money.png',
                        width: 70,
                      ),
                    ],
                  ),

                  // section
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 300,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 800,
                        height: 670,
                        child: Column(children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Numéro de facture',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Date de mission',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Heure de départ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Heure d"arrivé',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nom et prénom du malade',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Adresse de départ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Adresse d"arrivé',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nombre de patients',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Attente',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Distance retour',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Distance du siège',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 55,
                              ),
                              const SizedBox(
                                width: 200,
                                child: Text(
                                  'Capture d"écran de distance',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              ElevatedButton(
                                onPressed: _distance,
                                child: Text(
                                  'Charger le document',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 55,
                              ),
                              const SizedBox(
                                width: 250,
                                child: Text(
                                  'Attestation médicale',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: _attestation,
                                child: Text(
                                  'Charger le document',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 55,
                              ),
                              const SizedBox(
                                width: 250,
                                child: Text(
                                  'Certificat de soin',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: _certificat,
                                child: Text(
                                  'Charger le document',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Montant total (DA)',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text('Lorem ipseum'),
                              const SizedBox(
                                width: 200,
                              ),
                              ElevatedButton(
                                onPressed: _envoyer,
                                child: Text(
                                  'Valider',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF4695CD),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35, vertical: 17),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
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
                    height: 85,
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
