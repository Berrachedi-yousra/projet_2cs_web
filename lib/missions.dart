import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/main.dart';
import 'package:techme/mission_detail_screen.dart';
import 'package:techme/models/transportateur.dart';
import 'package:techme/services/api_service.dart';
import 'package:techme/transporteurs.dart';
import 'package:techme/facture.dart';
import 'package:techme/rembourssement.dart';
import 'package:techme/acceuil_op.dart';
import 'package:techme/ajoutermission.dart';

import 'models/mission.dart';
import 'services/localstorage.dart';

//import 'dart:async';


class missions extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<missions> {
  void _seconnecter() {}


  List<MissionModel> missionsOperateur = [];


  ApiService apiService = ApiService();

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
      body: Stack(
        children: [
      Expanded(
          flex: 1,
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
                'Liste des missions',
                style: TextStyle(
                    color: Color(0xFF4695CD),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 140,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ajoutermission()),
                  );
                },
                child: const Text(
                  'Ajouter une mission',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // <-- Radius
                  ),
                ),
              )
            ],
          ),

          // 1ère mission

          const SizedBox(
            height: 50,
          ),


              FutureBuilder<Map<String, dynamic>?>(
                  future: LocalStorage.getUser(),
                  builder: (
                      BuildContext context,
                      AsyncSnapshot<Map<String, dynamic>?> snapshot2,
                      ) {
                    if (snapshot2.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot2.connectionState == ConnectionState.done) {
                      if (snapshot2.hasError) {
                        return const Text('Error');
                      } else if (snapshot2.hasData) {
                        return FutureBuilder<MissionsModel>(
                            future: apiService.getAllMissions(),
                            builder: (
                                BuildContext context,
                                AsyncSnapshot<MissionsModel> snapshot1,
                                ) {
                              if (snapshot1.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (snapshot1.connectionState == ConnectionState.done) {
                                if (snapshot1.hasError) {
                                  return const Text('Error');
                                } else if (snapshot1.hasData) {
                                  print("${snapshot1.data!.missions!.length} xx");
                                  return FutureBuilder<TransportateursModel>(
                                      future: apiService.getOperateursAllTransportateur(snapshot2.data!["operateurId"]),
                                      builder: (
                                          BuildContext context,
                                          AsyncSnapshot<TransportateursModel> snapshot,
                                          ) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const Center(child: CircularProgressIndicator());
                                        } else if (snapshot.connectionState == ConnectionState.done) {
                                          if (snapshot.hasError) {
                                            return const Text('Error');
                                          } else if (snapshot.hasData) {

                                            for(int i=0;i<snapshot1.data!.missions!.length;i++){
                                              for(int j=0;j<snapshot.data!.transportateur!.length;j++){
                                                if(snapshot1.data!.missions![i].prenom_transportateur ==snapshot.data!.transportateur![j].prenom && snapshot1.data!.missions![i].nom_transportateur ==snapshot.data!.transportateur![j].nom ){

                                                    missionsOperateur.add(snapshot1.data!.missions![i]);

                                                }
                                              }
                                            }




                                            return Expanded(
                                              child: ListView.builder(
                                                itemCount: missionsOperateur.length,
                                                itemBuilder: (context, index) {
                                                  return  Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                                    child: Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 230,
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(30),
                                                              border: Border.all(
                                                                  color: Color.fromARGB(255, 185, 185, 185))),
                                                          width: 910,
                                                       //   height: 300,
                                                          child: Column(children: [
                                                            const SizedBox(
                                                              height: 30,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 60,
                                                                ),

                                                                SizedBox(
                                                                  width: 170,
                                                                  child: Text(
                                                                    'Numéro de mission',
                                                                    style: TextStyle(
                                                                        color: Colors.orange,
                                                                        fontWeight: FontWeight.w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 100,
                                                                  child: Text(
                                                                    missionsOperateur[index].idmission ?? "",
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 300,
                                                                ),
                                                                SizedBox(
                                                                  width: 170,
                                                                  child: Text(
                                                                    'Attente',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(255, 120, 120, 120),
                                                                        fontWeight: FontWeight.w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 50,
                                                                  child: Text(
                                                                    " ${missionsOperateur[index].attente}",
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 50,
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 60,
                                                                ),
                                                                SizedBox(
                                                                  width: 170,
                                                                  child: Text(
                                                                    'Nom complet du patient',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(255, 120, 120, 120),
                                                                        fontWeight: FontWeight.w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    "${missionsOperateur[index].nom_patient}  ${missionsOperateur[index].prenom_patient}" ,
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 60,
                                                                ),
                                                                SizedBox(
                                                                  width: 170,
                                                                  child: Text(
                                                                    'Date de mission',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(255, 120, 120, 120),
                                                                        fontWeight: FontWeight.w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 100,
                                                                  child: Text(
                                                                   " ${missionsOperateur[index].date_mission}",
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 300,
                                                                ),
                                                                SizedBox(
                                                                  width: 170,
                                                                  child: Text(
                                                                    'Heure de départ',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(255, 120, 120, 120),
                                                                        fontWeight: FontWeight.w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 50,
                                                                  child: Text(
                                                                    " ${missionsOperateur[index].heure_depart}",
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 60,
                                                                ),
                                                                SizedBox(
                                                                  width: 170,
                                                                  child: Text(
                                                                    'Adresse de départ',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(255, 120, 120, 120),
                                                                        fontWeight: FontWeight.w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    " ${missionsOperateur[index].adresse_depart}",
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 60,
                                                                ),
                                                                SizedBox(
                                                                  width: 170,
                                                                  child: Text(
                                                                    'Adresse d"arrivé',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(255, 120, 120, 120),
                                                                        fontWeight: FontWeight.w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    " ${missionsOperateur[index].adresse_arrive}",
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 60,
                                                                ),
                                                                SizedBox(
                                                                  width: 170,
                                                                  child: Text(
                                                                    'Nombre de patient',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(255, 120, 120, 120),
                                                                        fontWeight: FontWeight.w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 100,
                                                                  child: Text(
                                                                    " ${missionsOperateur[index].nombre_patient}",
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 300,
                                                                ),

                                                                SizedBox(
                                                                  width: 170,
                                                                  child: Text(
                                                                    'Temps d"attente',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(255, 120, 120, 120),
                                                                        fontWeight: FontWeight.w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 50,
                                                                  child: Text(
                                                                    " ${missionsOperateur[index].temps_attente}",
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 60,
                                                                ),
                                                                SizedBox(
                                                                  width: 170,
                                                                  child: Text(
                                                                    'Nom complet de transporteur',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(255, 120, 120, 120),
                                                                        fontWeight: FontWeight.w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    " ${missionsOperateur[index].nom_transportateur} ${missionsOperateur[index].prenom_transportateur}",
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                const SizedBox(width: 150,),
                                                                ElevatedButton(
                                                                  onPressed: () {
                                                                    Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => MissionDetailScreen(missionModel: missionsOperateur[index],)),
                                                                    );
                                                                  },
                                                                  child: const Text(
                                                                    'Consulter le detail de la mission',
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 13,
                                                                        fontWeight: FontWeight.w300),
                                                                  ),
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Colors.orange,
                                                                    padding: const EdgeInsets.symmetric(
                                                                        horizontal: 25, vertical: 20),
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(20), // <-- Radius
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(height: 20,),
                                                          ]),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          } else {
                                            return const Text('Empty data');
                                          }
                                        } else {
                                          return Text('State: ${snapshot.connectionState}');
                                        }
                                      });
                                } else {
                                  return const Text('Empty data');
                                }
                              } else {
                                return Text('State: ${snapshot1.connectionState}');
                              }
                            });
                      } else {
                        return const Text('Empty data');
                      }
                    } else {
                      return Text('State: ${snapshot2.connectionState}');
                    }
                  }),






          // 2ème mission


          //color footer

          const SizedBox(
            height: 50,
          ),
          Container(
            color: Color(0xFF4695CD),
            height: 30,
          ),
            ],
          )),
        ],
      ),
    );
  }
}
