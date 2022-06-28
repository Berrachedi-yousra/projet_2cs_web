import 'package:flutter/material.dart';
import 'package:techme/models/mission.dart';
import 'package:techme/tb.dart';

import 'acceuil_cnas.dart';
import 'acceuil_op.dart';
import 'control.dart';
import 'facture.dart';
import 'missions.dart';
import 'rembourssement.dart';
import 'screens/operateur/operateurs_screen.dart';
import 'screens/reclamation/reclamations_cnas_screen.dart';
import 'transporteurs.dart';

class MissionDetailScreen extends StatefulWidget {
  MissionDetailScreen({this.missionModel, Key? key}) : super(key: key);

  MissionModel? missionModel;

  @override
  _State createState() => _State();
}

class _State extends State<MissionDetailScreen> {
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
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Titre de page
                  Row(
                    children: [
                      const SizedBox(
                        height: 200,
                        width: 560,
                      ),
                      const SizedBox(
                        width: 230,
                        child: Text(
                          'Détails sur la mission',
                          style: TextStyle(
                              color: Color(0xFF4695CD),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 250,
                      ),
                      Image.asset(
                        'images/info.png',
                        width: 70,
                      )
                    ],
                  ),

                  // renseignement de l'opérateur

                  Row(
                    children: const [
                      SizedBox(
                        width: 525,
                        height: 80,
                      ),
                      Text(
                        'Renseignement concernant l opérateur',
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
                        //  height: 250,
                        child: Column(children: [
                          InfoWidget(
                              "Id mission", widget.missionModel!.idmission),
                          InfoWidget(
                              "Nom patient", widget.missionModel!.nom_patient),
                          InfoWidget("Prenom patient",
                              widget.missionModel!.prenom_patient),
                          InfoWidget("Date mission",
                              widget.missionModel!.date_mission),
                          InfoWidget("Heure depart",
                              widget.missionModel!.heure_depart),
                          InfoWidget("Adresse depart",
                              widget.missionModel!.adresse_depart),
                          InfoWidget("Adresse arrivé",
                              widget.missionModel!.adresse_arrive),
                          InfoWidget("Nombre patient",
                              widget.missionModel!.nombre_patient),
                          InfoWidget("attente", widget.missionModel!.attente),
                          InfoWidget("Temps d attente",
                              widget.missionModel!.temps_attente),
                          InfoWidget("Numero carte id patient",
                              widget.missionModel!.num_carte_id_patient),
                          InfoWidget("Mission effectué",
                              widget.missionModel!.mission_effectue),
                          InfoWidget(
                              "Kilométrage", widget.missionModel!.kilometrage),
                        ]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  PhotoInfo("Attestation medical",
                      widget.missionModel!.convention_url),
                  PhotoInfo("Capture iteneraire",
                      widget.missionModel!.image_liteneraire),

                  //color footer

                  Container(
                    color: const Color(0xFF4695CD),
                    height: 30,
                  ),
                ],
              ))),
        ],
      ),
    );
  }
}

Widget InfoWidget(String? typeInfo, String? info) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          const SizedBox(
            width: 60,
          ),
          SizedBox(
            width: 180,
            child: Text(
              '${typeInfo}',
              style: const TextStyle(
                  color: Color.fromARGB(255, 120, 120, 120),
                  fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          Text('${info}'),
        ],
      ),
    );

Widget PhotoInfo(String? typeInfo, String? info) => Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 60,
            ),
            SizedBox(
              width: 180,
              child: Text(
                '${typeInfo}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 120, 120, 120),
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: info != null ? 400 : null,
          //width: 00,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: info != null
              ? FadeInImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    info ?? "",
                    //scale: 10000
                  ),
                  placeholder: const AssetImage(
                    "assets/images/placeholder-image.png",
                  ),
                )
              : const SizedBox(),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
