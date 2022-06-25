import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:techme/transporteurs.dart';
import 'package:techme/missions.dart';
import 'package:techme/rembourssement.dart';
import 'package:techme/acceuil_op.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: facture()));
}

class facture extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<facture> {
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
                    MaterialPageRoute(builder: (context) => facture()),
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
                                  'Créer une nouvelle facture',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 400,
                              ),
                              Image.asset(
                                'images/money.png',
                                width: 70,
                              )
                            ],
                          ),

                          // section

                          Row(
                            children: [
                              const SizedBox(
                                width: 130,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Color.fromARGB(
                                            255, 185, 185, 185))),
                                width: 800,
                                height: 800,
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
                                        width: 180,
                                        child: Text(
                                          'Numéro de facture',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 55,
                                      ),
                                      const SizedBox(
                                        width: 180,
                                        child: Text(
                                          'Capture d"écran de distance',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      IconButton(
                                        onPressed: _distance,
                                        icon: Image.asset('images/camera.png'),
                                        iconSize: 30,
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
                                        width: 180,
                                        child: Text(
                                          'Attestation médicale',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
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
                                            borderRadius: BorderRadius.circular(
                                                20), // <-- Radius
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
                                        width: 180,
                                        child: Text(
                                          'Certificat de soin',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
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
                                            borderRadius: BorderRadius.circular(
                                                20), // <-- Radius
                                          ),
                                        ),
                                      ),
                                    ],
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
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 150,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 225,
                                      ),
                                      ElevatedButton(
                                        onPressed: _envoyer,
                                        child: Text(
                                          'Envoyer',
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
                                            borderRadius: BorderRadius.circular(
                                                20), // <-- Radius
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ],
                          ),

                          // Footer

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
