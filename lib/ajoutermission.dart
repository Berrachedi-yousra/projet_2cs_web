import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/main.dart';
import 'package:techme/services/api_service.dart';
import 'package:techme/transporteurs.dart';
import 'package:techme/facture.dart';
import 'package:techme/rembourssement.dart';
import 'package:techme/acceuil_op.dart';
import 'package:techme/missions.dart';

import 'models/mission.dart';

//import 'dart:async';

void main() {
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: ajoutermission()));
}

class ajoutermission extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ajoutermission> {
  void _confirmer() {}

  ApiService apiService = ApiService();
  MissionModel missionModel = MissionModel();

  bool loading = false;
  bool attente = false;

  DateTime date_mission = DateTime.now();





  Future<void> _selectDateMission(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date_mission,
        firstDate: DateTime(1920, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != date_mission) {
      setState(() {
        date_mission = picked;
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
                  // Titre de la page d'ajout

                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 250,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => missions()),
                          );
                        },
                        icon: Image.asset(
                          'images/previous.png',
                        ),
                        iconSize: 50,
                      ),
                      const SizedBox(
                        width: 300,
                      ),
                      const Text(
                        'Ajouter une mission',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),

                  // Section d'ajout

                  const SizedBox(
                    height: 50,
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

                        child: Column(children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Nom du patient',
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
                                      missionModel.nom_patient = val;
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
                                  'Prenom du patient',
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
                                      missionModel.prenom_patient = val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
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
                              SizedBox(
                                width: 150,
                                child:  ElevatedButton(
                                  onPressed: ()async{
                                    await _selectDateMission(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(20), // <-- Radius
                                    ),
                                  ),
                                  child: Text(
                                    "${date_mission.toLocal()}".split(' ')[0],
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
                              SizedBox(
                                width: 150,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val){
                                    setState(() {
                                      missionModel.heure_depart = val;
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
                                  'Adresse de départ',
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
                                      missionModel.adresse_depart = val;
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
                                  'Adresse d"arrivé',
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
                                      missionModel.adresse_arrive = val;
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
                                  'Nombre de patients',
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
                                      missionModel.nombre_patient = val;
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
                                  'Attente',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.orange,
                                  value: attente,
                                  onChanged: (value) {
                                    setState(() {
                                      attente = value!;
                                      missionModel.attente = attente.toString();
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
                                  'Temps d"attente',
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
                                      missionModel.temps_attente = val;
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
                                  'Nom du transporteur',
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
                                      missionModel.nom_transportateur = val;
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
                                  'Prenom du transporteur',
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
                                      missionModel.prenom_transportateur = val;
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

                  // boutton confirmer

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

                          missionModel.date_mission =  date_mission.toString();
                          missionModel.attente = attente.toString();

                          ApiService apiService = ApiService();
                          final url = await apiService
                              .inscrireMission(missionModel);

                          /*  var data = await apiService
                      .getAllOperateurs();
                  print(data);*/
                          setState(() {
                            loading = false;
                          });
                        },
                        child:loading
                            ? const CircularProgressIndicator()
                            : const  Text('Confirmer',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
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
                    ],
                  ),

                  //color footer

                  const SizedBox(
                    height: 30,
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
