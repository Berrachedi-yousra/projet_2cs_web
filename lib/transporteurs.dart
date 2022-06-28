import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/facture.dart';
import 'package:techme/missions.dart';
import 'package:techme/acceuil_op.dart';
import 'package:techme/rembourssement.dart';
import 'package:techme/ajoutertransporteur.dart';
import 'package:techme/services/api_service.dart';

import 'models/transportateur.dart';
import 'services/localstorage.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: transporteurs()));
}

class transporteurs extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<transporteurs> {

  ApiService apiService = ApiService();

  String operateurId ="";



  @override
  Widget build(BuildContext context) {

    return  FutureBuilder<Map<String, dynamic>?>(
        future: LocalStorage.getUser(),
        builder: (
            BuildContext context,
            AsyncSnapshot<Map<String, dynamic>?> snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              print("${snapshot.data!}");



              return    Scaffold(
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
                            const SizedBox(
                              height: 70,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 590,
                                ),
                                const Text(
                                  'Liste des transporteurs',
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
                                          builder: (context) =>
                                              ajoutertransporteur(operateurId:snapshot.data!["operateurId"])),
                                    );
                                  },
                                  child: const Text(
                                    'Ajouter un transporteur',
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

                            // 1er transporteur


                            FutureBuilder<TransportateursModel>(
                                future: apiService.getOperateursAllTransportateur("${snapshot.data!["operateurId"]}"),
                                builder: (
                                    BuildContext context,
                                    AsyncSnapshot<TransportateursModel> snapshot,
                                    ) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasError) {
                                      return const Text('Error');
                                    } else if (snapshot.hasData) {
                                      if(snapshot.data!.transportateur!.length!=0){
                                        return Expanded(
                                          child: ListView.builder(
                                            itemCount:
                                            snapshot.data!.transportateur!.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 15),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 220,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(30),
                                                          border: Border.all(
                                                              color: const Color.fromARGB(
                                                                  255, 185, 185, 185))),
                                                      width: 910,
                                                      //  height: 180,
                                                      child: Row(children: [
                                                        Column(
                                                          children: [
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
                                                                    'Nom',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            120,
                                                                            120,
                                                                            120),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    '${snapshot.data!.transportateur![index].nom}',
                                                                    textAlign:
                                                                    TextAlign.center,
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
                                                                    'Prénom',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            120,
                                                                            120,
                                                                            120),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    '${snapshot.data!.transportateur![index].prenom}',
                                                                    textAlign:
                                                                    TextAlign.center,
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
                                                                    'Date de recrutement',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            120,
                                                                            120,
                                                                            120),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    '${snapshot.data!.transportateur![index].date_recrutement}',
                                                                    textAlign:
                                                                    TextAlign.center,
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
                                                                    'Type de véhicule',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            120,
                                                                            120,
                                                                            120),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    '${snapshot.data!.transportateur![index].type_vehicule}',
                                                                    textAlign:
                                                                    TextAlign.center,
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
                                                                    'Email',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            120,
                                                                            120,
                                                                            120),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    '${snapshot.data!.transportateur![index].email}',
                                                                    textAlign:
                                                                    TextAlign.center,
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
                                                                    'Mot de passe',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            120,
                                                                            120,
                                                                            120),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w300),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    '${snapshot.data!.transportateur![index].mot_de_passe_transportateur}',
                                                                    textAlign:
                                                                    TextAlign.center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 30,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 90,
                                                        ),
                                                        Column(
                                                          children: [
                                                            const SizedBox(height: 20),
                                                            snapshot
                                                                .data!
                                                                .transportateur![
                                                            index]
                                                                .photo_transportateur !=
                                                                null
                                                                ? FadeInImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                snapshot
                                                                    .data!
                                                                    .transportateur![
                                                                index]
                                                                    .photo_transportateur!,
                                                              ),
                                                              height: 130,
                                                              width: 130,
                                                              placeholder:
                                                              const AssetImage(
                                                                "assets/images/placeholder-image.png",
                                                              ),
                                                            )
                                                                : const CircleAvatar(
                                                              backgroundColor:
                                                              Colors.red,
                                                              radius: 30,
                                                              child: Icon(
                                                                Icons.person,
                                                                size: 130,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 115,
                                                        ),
                                                        Column(
                                                          children: [
                                                            const SizedBox(
                                                              height: 110,
                                                            ),
                                                            ElevatedButton(
                                                              onPressed: null,
                                                              style:
                                                              ElevatedButton.styleFrom(
                                                                primary:
                                                                const Color(0xFF4695CD),
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal: 20,
                                                                    vertical: 15),
                                                                shape:
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      20), // <-- Radius
                                                                ),
                                                              ),
                                                              child: const Text(
                                                                'Supprimer',
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                    FontWeight.w300),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ]),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );}else{
                                        return const Center(child: Text("Aucun transportateur"),);
                                      }
                                    } else {
                                      return const Text('Empty data');
                                    }
                                  } else {
                                    return Text('State: ${snapshot.connectionState}');
                                  }
                                }),
                            //color footer

                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        )),
                  ],
                ),
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        });



  }
}
