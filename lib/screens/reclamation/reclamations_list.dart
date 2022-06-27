import 'package:flutter/material.dart';
import 'package:techme/acceuil_cnas.dart';
import 'package:techme/control.dart';
import 'package:techme/models/reclamation.dart';
import 'package:techme/screens/operateur/operateurs_screen.dart';
import 'package:techme/services/api_service.dart';
import 'package:techme/tb.dart';

import 'reclamations_cnas_screen.dart';


class ListReclamations extends StatefulWidget {
  ListReclamations({this.reclamationsModel, this.type, Key? key})
      : super(key: key);

  List<ReclamationModel>? reclamationsModel;

  String? type;

  @override
  _State createState() => _State();
}

class _State extends State<ListReclamations> {
  bool isLoading = true;

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
                    MaterialPageRoute(
                        builder: (context) => ReclamationCnasScreen()),
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
                  // Titre de page
                  Row(
                    children: [
                      const SizedBox(

                        width: 585,
                      ),
                      const SizedBox(
                        width: 200,
                        child: Text(
                          'Liste des reclamations',
                          style: TextStyle(
                              color: Color(0xFF4695CD),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 400,
                      ),
                      Image.asset(
                        'images/complain.png',
                        width: 70,
                      )
                    ],
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.reclamationsModel!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: widget.type == 'DeOperateur'
                                ? Row(
                                    children: [
                                      const SizedBox(
                                        width: 270,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 185, 185, 185))),
                                        width: 800,
                                        child: Column(children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Text(
                                            'Renseignement concernant l\'operateur',
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
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
                                                  'Raison social',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 120, 120, 120),
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                  '${widget.reclamationsModel![index].raison_social}'),
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
                                                  'Siege social',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 120, 120, 120),
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                  '${widget.reclamationsModel![index].siege_social}'),
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
                                                  'Wilaya',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 120, 120, 120),
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                  '${widget.reclamationsModel![index].adresse}'),
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
                                                  "Poste de l\'emetteur",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 120, 120, 120),
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                  '${widget.reclamationsModel![index].post_emetteur}'),
                                            ],
                                          ),

                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Text(
                                            'Contenu de la reclamation',
                                            style: TextStyle(
                                                color: Color(0xFF4695CD),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
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
                                                  'Reclamation sur',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 120, 120, 120),
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                  '${widget.reclamationsModel![index].reclamation_sur}'),
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
                                                  'Date de l\'accident',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 120, 120, 120),
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                  '${widget.reclamationsModel![index].date_accident}'),
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
                                                  'Date de reclamation',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 120, 120, 120),
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                  '${widget.reclamationsModel![index].date_reclamation}'),
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
                                                  'Contenu de la reclamation :',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 120, 120, 120),
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                  '${widget.reclamationsModel![index].contenu_reclamation}'),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ]),
                                      ),
                                    ],
                                  )
                                : widget.type == 'SurOperateur'
                                    ? Row(
                                        children: [
                                          const SizedBox(
                                            width: 270,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 185, 185, 185))),
                                            width: 800,
                                            child: Column(children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Text(
                                                'Renseignement concernant l\'emetteur de la reclamation',
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
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
                                                      'Nom',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].nom}'),
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
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].prenom}'),
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
                                                      'Date de naissance',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].date_naissance}'),
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
                                                      'Etes vous assuré',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].si_assure}'),
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
                                                      'Adresse',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].adresse}'),
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
                                                      'Numero de telephone',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                          FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].numero_telephone}'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Text(
                                                'Contenu de la reclamation',
                                                style: TextStyle(
                                                    color: Color(0xFF4695CD),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
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
                                                      'Reclamation sur',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].reclamation_sur}'),
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
                                                      'Date de l\'accident',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].date_accident}'),
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
                                                      'Date de reclamation',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].date_reclamation}'),
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
                                                      'Contenu de la reclamation :',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].contenu_reclamation}'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                            ]),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          const SizedBox(
                                            width: 270,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 185, 185, 185))),
                                            width: 800,
                                            child: Column(children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Text(
                                                'Renseignement concernant l employé',
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
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
                                                      'Matricule',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].matricule}'),
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
                                                      'Nom',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].nom}'),
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
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].prenom}'),
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
                                                      'Date de naissance',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].date_naissance}'),
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
                                                      'Siege de travail',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].siege_social}'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Text(
                                                'Contenu de la reclamation',
                                                style: TextStyle(
                                                    color: Color(0xFF4695CD),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
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
                                                      'Reclamation sur',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].reclamation_sur}'),
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
                                                      'Date de l\'accident',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].date_accident}'),
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
                                                      'Date de reclamation',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].date_reclamation}'),
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
                                                      'Contenu de la reclamation :',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              120,
                                                              120,
                                                              120),
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                      '${widget.reclamationsModel![index].contenu_reclamation}'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                            ]),
                                          ),
                                        ],
                                      ));
                      },
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
