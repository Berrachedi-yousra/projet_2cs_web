import 'package:flutter/material.dart';

import 'package:techme/acceuil_cnas.dart';
import 'package:techme/models/reclamation.dart';
import 'package:techme/screens/reclamation/reclamation_de_operateur.dart';
import 'package:techme/services/api_service.dart';
import 'package:techme/tb.dart';
import 'package:techme/screens/operateur/operateurs_screen.dart';
import 'package:techme/control.dart';

import 'reclamations_list.dart';





class ReclamationCnasScreen extends StatefulWidget {
  const ReclamationCnasScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ReclamationCnasScreen> {

  ApiService apiService = ApiService();
  List<ReclamationModel> reclamationSurOperateur = [];
  List<ReclamationModel>  reclamationDeOperateur = [];
  List<ReclamationModel>  reclamationDeCnas = [];

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
              const  SizedBox(
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
              const   SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OperateursScreen()),
                  );
                },
                child:const  Text('Opérateurs',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const    SizedBox(
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
              const  SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReclamationCnasScreen()),
                  );
                },
                child: const Text('Réclamations',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              const    SizedBox(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          'Reclamation par type',
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

                  const  SizedBox(
                    height: 50,
                  ),
                  FutureBuilder<ReclamationsModel>(
                      future: apiService.getAllReclamations(),
                      builder: (
                          BuildContext context,
                          AsyncSnapshot<ReclamationsModel> snapshot,
                          ) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Center(child:  Text('Error',style: TextStyle(color: Colors.red,fontSize: 25),));
                          } else if (snapshot.hasData) {
                            print("${snapshot.data!.reclamations!.length} xx");

                            for(int i=0;i<snapshot.data!.reclamations!.length;i++){

                              if(snapshot.data!.reclamations![i].type_reclammation == 'SurOperateur'){
                                reclamationSurOperateur.add(snapshot.data!.reclamations![i]);
                              }else {
                                if(snapshot.data!.reclamations![i].type_reclammation == 'DeOperateur'){
                                  reclamationDeOperateur.add(snapshot.data!.reclamations![i]);
                                }else{
                                  reclamationDeCnas.add(snapshot.data!.reclamations![i]);
                                }
                              }
                            }
                            return     Row(
                              children: [
                                const SizedBox(
                                  width: 250,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color:const Color.fromARGB(255, 200, 200, 200),
                                  ),
                                  width: 230,
                                  child: Column(
                                    children: [
                                      const   SizedBox(
                                        height: 30,
                                      ),
                                      const SizedBox(
                                        width: 100,
                                        child: Text(
                                          'Réclamation sur l opérateur',
                                          style: TextStyle(
                                              color: Color(0xFF4695CD),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                        width: 15,
                                      ),


                                      SizedBox(
                                        width: 150,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>  ListReclamations(reclamationsModel: reclamationSurOperateur,type: 'SurOperateur',)),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary:const  Color(0xFF4695CD),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20), // <-- Radius
                                            ),
                                          ),
                                          child:const Text(
                                            'Consulter les reclamations',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300),
                                          ),

                                        ),
                                      ),
                                      const   SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                const    SizedBox(
                                  width: 100,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color:const  Color.fromARGB(255, 200, 200, 200),
                                  ),
                                  width: 230,
                                  child: Column(
                                    children: [
                                      const   SizedBox(
                                        height: 30,
                                      ),
                                      const     SizedBox(
                                        width: 170,
                                        child: Text(
                                          'Réclamation en tant qu employé de la CNAS',
                                          style: TextStyle(
                                              color: Color(0xFF4695CD),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const  SizedBox(
                                        height: 35,
                                        width: 15,
                                      ),

                                      SizedBox(
                                        width: 150,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>  ListReclamations(reclamationsModel: reclamationDeCnas,type: 'cnas',)),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color(0xFF4695CD),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20), // <-- Radius
                                            ),
                                          ),
                                          child:const  Text(
                                            'Consulter les reclamations',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300),
                                          ),

                                        ),
                                      ),
                                      const   SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                const      SizedBox(
                                  width: 100,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color.fromARGB(255, 200, 200, 200),
                                  ),

                                  width: 230,
                                  child: Column(
                                    children: [
                                      const      SizedBox(
                                        height: 30,
                                      ),
                                      const   SizedBox(
                                        width: 100,
                                        child: Text(
                                          'Réclamation de l opérateur',
                                          style: TextStyle(
                                              color: Color(0xFF4695CD),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const     SizedBox(
                                        height: 30,
                                        width: 15,
                                      ),

                                      SizedBox(
                                        width: 150,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ListReclamations(reclamationsModel: reclamationDeOperateur,type: 'DeOperateur',)),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary:const  Color(0xFF4695CD),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20), // <-- Radius
                                            ),
                                          ),
                                          child:const  Text(
                                            'Consulter les reclamations',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300),
                                          ),

                                        ),
                                      ),
                                      const   SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Text('Empty data');
                          }
                        } else {
                          return Text('State: ${snapshot.connectionState}');
                        }
                      }),





                ],
              )),
        ],
      ),
    );
  }
}
