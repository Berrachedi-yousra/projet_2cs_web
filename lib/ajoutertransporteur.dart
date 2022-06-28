import 'dart:html';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techme/facture.dart';
import 'package:techme/missions.dart';
import 'package:techme/acceuil_op.dart';
import 'package:techme/models/transportateur.dart';
import 'package:techme/rembourssement.dart';
import 'package:techme/services/api_service.dart';
import 'package:techme/transporteurs.dart';

//import 'dart:async';


class ajoutertransporteur extends StatefulWidget {



  ajoutertransporteur({this.operateurId,Key? key}) : super(key: key);
  String? operateurId;
  @override
  _State createState() => _State();
}

class _State extends State<ajoutertransporteur> {


  ApiService apiService = ApiService();
  TransportateurModel transportateurModel = TransportateurModel();

  bool loading = false;

  DateTime dateRecrutement = DateTime.now();





  Future<void> _selectDateRecrutement(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateRecrutement,
        firstDate: DateTime(1920, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != dateRecrutement) {
      setState(() {
        dateRecrutement = picked;
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
                            MaterialPageRoute(
                                builder: (context) => transporteurs()),
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
                        'Ajouter un transporteur',
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
                        width: 330,
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
                                  'Nom du transporetur',
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
                                      transportateurModel.nom = val;
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
                                  'Prénom du transporteur',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 500,
                                child:TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (val){
                                    setState(() {
                                      transportateurModel.prenom = val;
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
                                  'Date de recrutement',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: 500,
                                child:  ElevatedButton(
                                  onPressed: ()async{
                                    await _selectDateRecrutement(context);
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
                                    "${dateRecrutement.toLocal()}".split(' ')[0],
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
                                  'Email',
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
                                      transportateurModel.email = val;
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
                                  'Mot de passe',
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
                                      transportateurModel.mot_de_passe_transportateur = val;
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
                                  'Type de véhicule',
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
                                      transportateurModel.type_vehicule = val;
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
                                  'Choisir une image',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              IconButton(
                                onPressed:()async {
                                  final ImagePicker _picker = ImagePicker();
                                  try {
                                    var file = await _picker.pickImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 50);

                                    if (file != null) {
                                      setState(() {
                                        transportateurModel.photo_transportateur_file = file;
                                      });
                                    }
                                  } catch (e) {}
                                },
                                icon: Image.asset('images/camera.png'),
                                iconSize: 30,
                              ),
                              const SizedBox(
                                width: 325,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });

                                  transportateurModel.date_recrutement =  dateRecrutement.toString();
                                  transportateurModel.id_operateur = widget.operateurId;



                                  final url = await apiService
                                      .inscrireTransportateur(transportateurModel);

                                  /*  var data = await apiService
                          .getAllOperateurs();
                      print(data);*/
                                  setState(() {
                                    loading = false;
                                  });
                                },
                                child: loading ? const CircularProgressIndicator() :const  Text(
                                  'Confirmer',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF4695CD),
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
                            height: 30,
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
