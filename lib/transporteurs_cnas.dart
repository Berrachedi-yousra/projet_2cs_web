import 'package:flutter/material.dart';
import 'package:techme/models/transportateur.dart';
import 'package:techme/services/api_service.dart';
import 'package:techme/tb.dart';
import 'package:techme/acceuil_cnas.dart';
import 'package:techme/screens/operateur/operateurs_screen.dart';
import 'package:techme/control.dart';

import 'screens/reclamation/reclamations_cnas_screen.dart';


class TransportateursCnas extends StatefulWidget {
   TransportateursCnas(this.idOperateur,{Key? key}) : super(key: key);

   @required String? idOperateur;
  @override
  _State createState() => _State();
}

class _State extends State<TransportateursCnas> {
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
                    MaterialPageRoute(
                        builder: (context) => const OperateursScreen()),
                  );
                },
                child: const Text('Opérateurs',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ControlScreen()),
                  );
                },
                child: const Text('Control',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReclamationCnasScreen()),
                  );
                },
                child: const Text('Réclamations',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 590,
                      ),
                      Text(
                        'Liste des transporteurs',
                        style: TextStyle(
                            color: Color(0xFF4695CD),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),

                  // 1er transporteur

                  const SizedBox(
                    height: 50,
                  ),

                  FutureBuilder<TransportateursModel>(
                      future: apiService.getOperateursAllTransportateur(widget.idOperateur!),
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

                  // 2ème transporteur

                  //color footer

                  const SizedBox(
                    height: 50,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
