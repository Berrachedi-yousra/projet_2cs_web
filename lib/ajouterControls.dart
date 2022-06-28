import 'dart:html';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techme/facture.dart';
import 'package:techme/missions.dart';
import 'package:techme/acceuil_op.dart';
import 'package:techme/models/control.dart';
import 'package:techme/models/transportateur.dart';
import 'package:techme/rembourssement.dart';
import 'package:techme/services/api_service.dart';
import 'package:techme/tb.dart';
import 'package:techme/transporteurs.dart';

import 'acceuil_cnas.dart';
import 'control.dart';
import 'screens/operateur/operateurs_screen.dart';
import 'screens/reclamation/reclamations_cnas_screen.dart';

//import 'dart:async';


class ajouterControl extends StatefulWidget {



  ajouterControl({this.operateurId,Key? key}) : super(key: key);
  String? operateurId;
  @override
  _State createState() => _State();
}

class _State extends State<ajouterControl> {


  ApiService apiService = ApiService();
  ControlModel controlModel = ControlModel();

  bool loading = false;

  DateTime dateControl = DateTime.now();





  Future<void> _selectDateControl(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateControl,
        firstDate: DateTime(1920, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != dateControl) {
      setState(() {
        dateControl = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
                    MaterialPageRoute(builder: (context) => tb()),
                  );
                },
                child: Text('Tableau de bord',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OperateursScreen()),
                  );
                },
                child: Text('Opérateurs',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ControlScreen()),
                  );
                },
                child: Text('Control',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReclamationCnasScreen()),
                  );
                },
                child: Text('Réclamations',
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
                                'Ajouter un control',
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
                                          'Raison social de l\'operateur',
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
                                              controlModel.raison_social_operateur = val;
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
                                          'Nom du controleur 1',
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
                                              controlModel.nom_controleur1 = val;
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
                                          'Prénom du controleur 1',
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
                                              controlModel.prenom_cotroleur1 = val;
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
                                          'Nom du controleur 1',
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
                                              controlModel.nom_controleur2 = val;
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
                                          'Prénom du controleur 1',
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
                                              controlModel.prenom_cotroleur2 = val;
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
                                          'Date de controle',
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 120, 120, 120),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 500,
                                        child:  ElevatedButton(
                                          onPressed: ()async{
                                            await _selectDateControl(context);
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
                                            "${dateControl.toLocal()}".split(' ')[0],
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
                                          'Heure de controle',
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
                                              controlModel.heure_controle = val;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),


                                  Row(
                                    children: [

                                      const SizedBox(
                                        width: 325,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          setState(() {
                                            loading = true;
                                          });

                                          controlModel.date_controle =  dateControl.toString();




                                          final url = await apiService
                                              .inscrireControl(controlModel);

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
