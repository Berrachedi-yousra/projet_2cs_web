import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techme/transporteurs.dart';
import 'package:techme/missions.dart';
import 'package:techme/rembourssement.dart';
import 'package:techme/acceuil_op.dart';
import 'package:techme/services/api_service.dart';
import 'package:techme/models/facture.dart';

//import 'dart:async';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Facture()));
}

class Facture extends StatefulWidget {
  const Facture({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Facture> {
  bool loading = false;
  XFile? capture_ecran;
  XFile? attestation_medical;
  XFile? certificat_soin;
  bool attente  = false;

  FactureModel factureModel = FactureModel();

  DateTime dateMission = DateTime.now();

  Future<void> _selectDateCreation(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateMission,
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != dateMission) {
      setState(() {
        dateMission = picked;
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
                    MaterialPageRoute(builder: (context) => const AcceuilOp()),
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
                    MaterialPageRoute(builder: (context) => missions()),
                  );
                },
                child: const Text('Missions',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => transporteurs()),
                  );
                },
                child: const Text('Transporteurs',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Facture()),
                  );
                },
                child: const Text('Facture',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => rembourssement()),
                  );
                },
                child: const Text('Rembourssement',
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
                                        color: const Color.fromARGB(
                                            255, 185, 185, 185))),
                                width: 800,
                              //  height: 800,
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
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                             // factureModel.num = val;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      const SizedBox(
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
                                        child: ElevatedButton(
                                          onPressed: ()async{
                                            await _selectDateCreation(context);
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
                                            "${dateMission.toLocal()}".split(' ')[0],
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
                                          'Heure de départ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                              factureModel.heure_depart = val;
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
                                          'Heure d"arrivé',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                              factureModel.heure_arrive = val;
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
                                          'Nom du malade',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                              factureModel.nom_malade = val;
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
                                          'Prénom du malade',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                              factureModel.prenom_malade = val;
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
                                          'Opérateuré',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                              factureModel.operateur = val;
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
                                          'Adresse de départ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                              factureModel.adresse_depart = val;
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
                                          'Adresse d"arrivé',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                              factureModel.adresse_arrive = val;
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
                                          'Nombre de patients',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                              factureModel.nombre_patient = val;
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
                                          'Attente',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child:  Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: Colors.orange,
                                          value: attente,
                                          onChanged: (value) {
                                            setState(() {
                                              attente = value!;
                                              factureModel.attente = attente.toString();
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
                                          'Distance retour',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                              factureModel.distance_retour =
                                                  val;
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
                                          'Distance du siège',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                              factureModel.distance_siege = val;
                                            });
                                          },
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
                                        onPressed: () async {
                                          final ImagePicker _picker =
                                              ImagePicker();
                                          try {
                                            var file = await _picker.pickImage(
                                                source: ImageSource.gallery,
                                                imageQuality: 50);

                                            if (file != null) {
                                              setState(() {
                                                factureModel.capture_ecran = file;
                                              });
                                            }
                                          } catch (e) {}
                                        },
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
                                        onPressed: ()async {
                                          final ImagePicker _picker = ImagePicker();
                                          try {
                                            var file = await _picker.pickImage(
                                                source: ImageSource.gallery,
                                                imageQuality: 50);

                                            if (file != null) {
                                              setState(() {
                                                factureModel.attestation_medical = file;
                                              });
                                            }
                                          } catch (e) {}
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.orange,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20), // <-- Radius
                                          ),
                                        ),
                                        child: const Text(
                                          'Charger le document',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
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
                                        onPressed: ()async {
                                          final ImagePicker _picker = ImagePicker();
                                          try {
                                            var file = await _picker.pickImage(
                                                source: ImageSource.gallery,
                                                imageQuality: 50);

                                            if (file != null) {
                                              setState(() {
                                                factureModel.certificat_soin = file;
                                              });
                                            }
                                          } catch (e) {}
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.orange,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20), // <-- Radius
                                          ),
                                        ),
                                        child: const Text(
                                          'Charger le document',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
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
                                      SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onChanged: (val) {
                                            setState(() {
                                              factureModel.montant_total = val;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 225,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          setState(() {
                                            loading = true;
                                          });

                                          factureModel.date_mission =  dateMission.toString();

                                          ApiService apiService = ApiService();
                                          final url = await apiService
                                              .inscrireFacture(factureModel);

                                          /*  var data = await apiService
                      .getAllOperateurs();
                  print(data);*/
                                          setState(() {
                                            loading = false;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color(0xFF4695CD),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 20),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20), // <-- Radius
                                          ),
                                        ),
                                        child: loading
                                            ? const CircularProgressIndicator()
                                            : const Text('Envoyer',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15)),
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
      ),
    );
  }
}
