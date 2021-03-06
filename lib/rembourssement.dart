import 'dart:html';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techme/models/remboursement.dart';
import 'package:techme/transporteurs.dart';
import 'package:techme/facture.dart';
import 'package:techme/missions.dart';
import 'package:techme/acceuil_op.dart';

import 'services/api_service.dart';



class rembourssement extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<rembourssement> {

  RemboursementModel remboursementModel = RemboursementModel();

  bool loading = false;

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
                  // Titre de page

                  Row(
                    children: [
                      const SizedBox(
                        height: 155,
                        width: 480,
                      ),
                      const SizedBox(
                        width: 400,
                        child: Text(
                          'Demande de rembourssement',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  // Contenu de la r??clamation

                  Row(
                    children: [
                      const SizedBox(
                        width: 290,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 185, 185, 185))),
                        width: 800,
                        height: 300,
                        child: Column(children: [
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
                                  'Num??ro de la facture',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val){
                                    setState(() {
                                      remboursementModel.numero_facture = val;
                                    });
                                  },
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
                                  'Montant rembourss?? (DA)',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val){
                                    setState(() {
                                      remboursementModel.montant_rembourse = val ;
                                    });
                                  },
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
                                  'Montant attendu (DA)',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val){
                                    setState(() {
                                      remboursementModel.montant_attendu = val ;
                                    });
                                  },
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
                                  'Explications et preuves',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                               SizedBox(
                                width: 500,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val){
                                    setState(() {
                                      remboursementModel.explication_preuve = val;
                                    });
                                  },
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
                                  'Joindre des preuves',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  final ImagePicker _picker =
                                  ImagePicker();
                                  try {
                                    var file = await _picker.pickImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 50);

                                    if (file != null) {
                                      setState(() {
                                        remboursementModel.preuve = file;
                                      });
                                    }
                                  } catch (e) {}
                                },
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
                        ]),
                      ),
                    ],
                  ),

                  // boutton envoyer

                  Row(
                    children: [
                      const SizedBox(
                        width: 900,
                        height: 100,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });



                          ApiService apiService = ApiService();
                          final url = await apiService
                              .inscrireRemboursement(remboursementModel);


                          setState(() {
                            loading = false;
                          });
                        },
                        child: loading ?const  Center(child: CircularProgressIndicator(),) : Text('Envoyer',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // <-- Radius
                          ),
                        ),
                      ),
                    ],
                  ),

                  //color footer

                  const SizedBox(
                    height: 15,
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
