import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/connexion.dart';
import 'package:techme/main.dart';
import 'package:techme/models/reclamation.dart';
import 'package:techme/screens/reclamation/reclamation.dart';
import 'package:techme/inscription.dart';
import 'package:techme/services/api_service.dart';

//import 'dart:async';

class ReclamationDeOperateur extends StatefulWidget {
  const ReclamationDeOperateur({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ReclamationDeOperateur> {
  ReclamationModel reclamationModel = ReclamationModel();

  DateTime dateAccident = DateTime.now();
  DateTime dateReclamation = DateTime.now();
  bool loading = false;

  Future<void> _selectDatedateAccident(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateAccident,
        firstDate: DateTime(1920, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != dateAccident) {
      setState(() {
        dateAccident = picked;
      });
    }
  }

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
              const SizedBox(
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
                child: const Text('Inscription',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Reclamation()),
                  );
                },
                child: const Text('R??clamaton',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const SizedBox(
                width: 15,
              ),
              const OutlinedButton(
                onPressed: null,
                child: Text('A propos',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const SizedBox(
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
                child: const Text('Connexion',
                    style: TextStyle(color: Color(0xFF4695CD), fontSize: 17)),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          )
        ],
        backgroundColor: const Color(0xFF4695CD),
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
                  // Titre de page

                  Row(
                    children: const [
                      SizedBox(
                        height: 200,
                        width: 560,
                      ),
                      SizedBox(
                        width: 230,
                        child: Text(
                          'R??clamation de l\'op??rateur',
                          style: TextStyle(
                              color: Color(0xFF4695CD),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  // renseignement concernant l'op??rateur

                  Row(
                    children: const [
                      SizedBox(
                        width: 525,
                        height: 10,
                      ),
                      Text(
                        'Renseignement concernant l op??rateur',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 270,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 185, 185, 185))),
                        width: 800,
                        height: 250,
                        child: Column(children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Raison sociale',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val) {
                                    setState(() {
                                      reclamationModel.raison_social = val;
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
                                  'Si??ge social',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val) {
                                    setState(() {
                                      reclamationModel.siege_social = val;
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
                                  'Wilaya',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val) {
                                    setState(() {
                                      reclamationModel.adresse = val;
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
                                  'Poste de l emetteur',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val) {
                                    setState(() {
                                      reclamationModel.post_emetteur = val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),

                  // Contenu de la r??clamation

                  Row(
                    children: const [
                      SizedBox(
                        width: 575,
                        height: 80,
                      ),
                      Text(
                        'Contenu de la r??clamation',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 270,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 185, 185, 185))),
                        width: 800,
                        child: Column(children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'R??clamation sur',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val) {
                                    setState(() {
                                      reclamationModel.reclamation_sur = val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Date de l accident',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await _selectDatedateAccident(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20), // <-- Radius
                                    ),
                                  ),
                                  child: Text(
                                    "${dateAccident.toLocal()}".split(' ')[0],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
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
                                  'De quoi s agit-il?',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val) {
                                    setState(() {
                                      reclamationModel.contenu_reclamation =
                                          val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),

                  // boutton enregister

                  Row(
                    children: [
                      const SizedBox(
                        width: 900,
                        height: 150,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });

                          reclamationModel.date_accident =
                              dateAccident.toString();
                          reclamationModel.date_reclamation =
                              DateTime.now().toString();

                          ApiService apiService = ApiService();
                          final url = await apiService.inscrireReclamation(
                              reclamationModel, "DeOperateur");

                          /*  var data = await apiService
                      .getAllOperateurs();
                  print(data);*/
                          setState(() {
                            loading = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // <-- Radius
                          ),
                        ),
                        child: loading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const Text('Enregistrer',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)),
                      ),
                    ],
                  ),

                  //color footer

                  const SizedBox(
                    height: 20,
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
