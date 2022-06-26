import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techme/connexion.dart';
import 'package:techme/main.dart';
import 'package:techme/models/operaeur.dart';
import 'package:techme/reclamation.dart';
import 'package:techme/inscription.dart';
import 'package:techme/services/api_service.dart';

//import 'dart:async';

void main() {
  runApp(const MaterialApp(home: Operateur()));
}

class Operateur extends StatefulWidget {
  const Operateur({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Operateur> {
  XFile? signature;
  bool loading = false;
  DateTime dateNaissance = DateTime.now();
  DateTime dateCreation = DateTime.now();
  DateTime dateDeclaration = DateTime.now();

  Future<void> _selectDateCreation(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateCreation,
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != dateCreation) {
      setState(() {
        dateCreation = picked;
      });
    }
  }

  Future<void> _selectDateNaissance(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateNaissance,
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != dateNaissance) {
      setState(() {
        dateNaissance = picked;
      });
    }
  }

  Future<void> _selectDateDeclaration(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateDeclaration,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != dateDeclaration) {
      setState(() {
        dateDeclaration = picked;
      });
    }
  }







  OperateurModel operateurModel =  OperateurModel();

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
                child:const  Text('Acceuil',
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
                child:const  Text('Inscription',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const  SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => reclamation()),
                  );
                },
                child: const Text('Réclamaton',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const  SizedBox(
                width: 15,
              ),
              const  OutlinedButton(
                onPressed: null,
                child: Text('A propos',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const   SizedBox(
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
                child:const  Text('Connexion',
                    style: TextStyle(color: Color(0xFF4695CD), fontSize: 17)),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          )
        ],
        backgroundColor:const  Color(0xFF4695CD),
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
                  const  SizedBox(
                    width: 230,
                    child: Text(
                      'Demande de convention d opérateur de transport',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const   SizedBox(
                    width: 400,
                  ),
                  Image.asset(
                    'images/protection2.png',
                    width: 100,
                  )
                ],
              ),

              // renseignement de l'opérateur

              Row(
                children:const  [
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

              const    SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const   SizedBox(
                    width: 270,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color:const  Color.fromARGB(255, 185, 185, 185))),
                    width: 800,
                    height: 400,
                    child: Column(children: [
                      const   SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const   SizedBox(
                            width: 60,
                          ),
                          const   SizedBox(
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
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.raison_social = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const    SizedBox(
                            width: 60,
                          ),
                          const    SizedBox(
                            width: 180,
                            child: Text(
                              'Siège sociale',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.siege_social = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const   SizedBox(height: 10,),
                      Row(
                        children: [
                          const    SizedBox(
                            width: 60,
                          ),
                          const     SizedBox(
                            width: 180,
                            child: Text(
                              'Date de création',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child:  SizedBox(
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
                                  "${dateCreation.toLocal()}".split(' ')[0],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),

                              ),
                          ),)
                        ],
                      ),
                      Row(
                        children: [
                          const  SizedBox(
                            width: 60,
                          ),
                          const   SizedBox(
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
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.wilaya = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const  SizedBox(
                            width: 60,
                          ),
                          const   SizedBox(
                            width: 180,
                            child: Text(
                              'Nombre d employé',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.nombre_employes =
                                      val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const    SizedBox(
                            width: 60,
                          ),
                          const   SizedBox(
                            width: 180,
                            child: Text(
                              'Nombre de transporteurs',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.nombre_transportateur =
                                      val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const   SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(20), // <-- Radius
                          ),
                        ),
                        child:const  Text(
                          'Charger le cachet avec signature',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),

                      ),
                    ]),
                  ),
                ],
              ),

              // renseignement du dirigeant

              Row(
                children:const  [
                  SizedBox(
                    width: 525,
                    height: 80,
                  ),
                  Text(
                    'Renseignement concernant le dirigeant',
                    style: TextStyle(
                        color: Color(0xFF4695CD),
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ],
              ),

              const   SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const   SizedBox(
                    width: 270,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Color.fromARGB(255, 185, 185, 185))),
                    width: 800,
                    height: 400,
                    child: Column(children: [
                      const    SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const    SizedBox(
                            width: 60,
                          ),
                          const    SizedBox(
                            width: 180,
                            child: Text(
                              'Nom',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.nom_dirigeant = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const     SizedBox(
                            width: 60,
                          ),
                          const    SizedBox(
                            width: 180,
                            child: Text(
                              'Prénom',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.prenom_dirigeant = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const    SizedBox(height: 10,),
                      Row(
                        children: [
                          const    SizedBox(
                            width: 60,
                          ),
                          const    SizedBox(
                            width: 180,
                            child: Text(
                              'Date de naissance',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: ()async{
                                await _selectDateNaissance(context);
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
                               "${dateNaissance.toLocal()}".split(' ')[0],
                                style:const  TextStyle(
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
                          const   SizedBox(
                            width: 60,
                          ),
                          const    SizedBox(
                            width: 180,
                            child: Text(
                              'Lieu de naissance',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.lieu_naissance_dirigeant = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const   SizedBox(
                            width: 60,
                          ),
                          const     SizedBox(
                            width: 180,
                            child: Text(
                              'Sexe',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.sexe_dirigeant = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const    SizedBox(
                            width: 60,
                          ),
                          const   SizedBox(
                            width: 180,
                            child: Text(
                              'adresse',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.adresse_dirigeant = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const     SizedBox(
                            width: 60,
                          ),
                          const    SizedBox(
                            width: 180,
                            child: Text(
                              'Situation familiale',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.situation_familiale_dirigeant = val;
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

              // renseignement transporteurs

              Row(
                children:const  [
                      SizedBox(
                    width: 500,
                    height: 80,
                  ),
                       Text(
                    'Renseignements concernant les transporteurs',
                    style: TextStyle(
                        color: Color(0xFF4695CD),
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ],
              ),

              const      SizedBox(
                height: 30,
              ),
              Row(children: [
                const     SizedBox(
                  width: 270,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color:const  Color.fromARGB(255, 185, 185, 185))),
                    width: 800,
                    height: 300,
                    child: Column(children: [
                      const    SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 60,
                          ),
                          Text(
                            '01',
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      Row(
                        children:const  [
                                SizedBox(
                            width: 60,
                          ),
                          Text(
                            '02',
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      Row(
                        children:const  [
                          SizedBox(
                            width: 60,
                          ),
                          Text(
                            '03',
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 60,
                          ),
                          Text(
                            '04',
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      Row(
                        children:const  [
                          SizedBox(
                            width: 60,
                          ),
                          Text(
                            '05',
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ]))
              ]),

              // renseignement du dirigeant

              Row(
                children:const  [
                  SizedBox(
                    width: 525,
                    height: 80,
                  ),
                  Text(
                    'Renseignement concernant le matériel',
                    style: TextStyle(
                        color: Color(0xFF4695CD),
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ],
              ),

              const   SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const    SizedBox(
                    width: 270,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color:const  Color.fromARGB(255, 185, 185, 185))),
                    width: 800,
                    height: 400,
                    child: Column(children: [
                      const         SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const      SizedBox(
                            width: 60,
                          ),
                          const     SizedBox(
                            width: 180,
                            child: Text(
                              'Nomre de véhicule type A',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.nombre_vehicule_type_a =
                                      val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const    SizedBox(
                            width: 60,
                          ),
                          const   SizedBox(
                            width: 180,
                            child: Text(
                              'Adresse de départ (A)',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.adresse_depart_vehicule_a =
                                      val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const     SizedBox(
                            width: 60,
                          ),
                          const     SizedBox(
                            width: 180,
                            child: Text(
                              'Nombre de véhicule type B',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.nombre_vehicule_type_b =
                                      val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const    SizedBox(
                            width: 60,
                          ),
                          const   SizedBox(
                            width: 180,
                            child: Text(
                              'Adresse de départ (B)',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.adresse_depart_vehicule_b =
                                      val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const    SizedBox(
                            width: 60,
                          ),
                          const   SizedBox(
                            width: 180,
                            child: Text(
                              'Nombre de véhicule type C',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.nombre_vehicule_type_c =
                                     val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const    SizedBox(
                            width: 60,
                          ),
                          const   SizedBox(
                            width: 180,
                            child: Text(
                              'Adresse de départ (C)',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.adresse_depart_vehicule_c =
                                      val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const         SizedBox(
                            width: 60,
                          ),
                          const    SizedBox(
                            width: 180,
                            child: Text(
                              'Disponibilité de matériel',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.disponibilite_materiel =
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

              // Déclaration de l'opérateur

              const  SizedBox(
                height: 30,
              ),
              Row(children: [
                const    SizedBox(
                  width: 270,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:const  Color.fromARGB(255, 207, 207, 207),
                    ),
                    width: 800,
                    height: 360,
                    child: Column(children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const   Text('Déclaration de l opérateur',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      const   SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          const    SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 700,
                            child: Column(
                              children:const  [
                                Text(
                                    'L’opérateur soussigné (Raison sociale de l’opérateur).',
                                    textAlign: TextAlign.left),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    'Déclare que les informations fugurant sur la présente demande d’affiliation sont exacte et commplétes.',
                                    textAlign: TextAlign.left),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    'En outre, je m’engage à informer immédiatement la caisse de tout changement pouvant intervenir dans ma situation familiale ou dans la situation socio-professionnelle de l’un de les ayants droit.',
                                    textAlign: TextAlign.left),
                              ],
                            ),
                          ),
                          const     SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const      SizedBox(
                            width: 200,
                          ),
                          const  Text('A'),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                setState(() {
                                  operateurModel.declaration_adresse = val;
                                });
                              },
                            ),
                          ),
                          const    SizedBox(
                            width: 100,
                          ),
                          const   Text('le'),
                          const    SizedBox(width: 10,),
                          SizedBox(
                            width: 150,
                            child:  SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: ()async{
                                  await _selectDateDeclaration(context);
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
                                  "${dateDeclaration.toLocal()}".split(' ')[0],
                                  style:const  TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),

                              ),
                          ),)
                        ],
                      ),
                      const      SizedBox(
                        height: 50,
                        width: 250,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final ImagePicker _picker = ImagePicker();
                          try {
                            var file = await _picker.pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 50);

                            if (file != null) {
                              setState(() {
                                operateurModel.signature = file;
                              });
                            }
                          } catch (e) {}
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
                        child: const Text(
                          'Charger la signature',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),

                      ),
                    ]))
              ]),

              const  SizedBox(
                height: 30,
                width: 600,
              ),

              Row(
                children: [
                  const   SizedBox(
                    width: 900,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });

                      operateurModel.date_creation =  dateCreation.toString();
                      operateurModel.date_naissance_dirigeant =  dateNaissance.toString();
                      operateurModel.declaration_date =  dateDeclaration.toString();

                      ApiService apiService =  ApiService();
                      final url = await apiService
                          .inscrireOperateur(operateurModel);

                    /*  var data = await apiService
                          .getAllOperateurs();
                      print(data);*/
                      setState(() {
                        loading = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary:const  Color(0xFF4695CD),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(20), // <-- Radius
                      ),
                    ),
                    child: loading ? const CircularProgressIndicator() :const  Text('Enregistrer',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15)),

                  ),
                ],
              ),

              //color footer

              const   SizedBox(
                height: 50,
              ),
              Container(
                color:const  Color(0xFF4695CD),
                height: 30,
              ),
            ],
          ))),
        ],
      ),
    );
  }
}
