import 'package:flutter/material.dart';
import 'package:techme/acceuil_cnas.dart';
import 'package:techme/missions_cnas.dart';
import 'package:techme/models/operaeur.dart';
import 'package:techme/services/api_service.dart';
import 'package:techme/tb.dart';
import 'package:techme/control.dart';
import 'package:techme/widgets/widgets.dart';

import '../reclamation/reclamations_cnas_screen.dart';
import 'OperateurDetails.dart';

//import 'dart:async';


class OperateursScreen extends StatefulWidget {
  const OperateursScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<OperateursScreen> {

  ApiService apiService = ApiService();
  bool isLoading = true;
  OperateursModel operateursModel = OperateursModel();

  getUserData() async {
    try {
      OperateursModel operateursModels = await apiService.getAllOperateurs();

      setState(() {
        operateursModel = operateursModels;
      });

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
      errorSnackBar(context, "Connecting...");
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserData();
    //print("${operateursModel.operateurs![0].idoperateur } xx");
    super.initState();
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
                    MaterialPageRoute(
                        builder: (context) => acceuil_cnas()),
                  );
                },
                child: const  Text('Acceuil',
                    style: TextStyle(
                        color: Colors.white, fontSize: 17)),
              ),
              const   SizedBox(
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
                    style: TextStyle(
                        color: Colors.white, fontSize: 17)),
              ),
              const  SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const OperateursScreen()),
                  );
                },
                child: const  Text('Opérateurs',
                    style: TextStyle(
                        color: Colors.white, fontSize: 17)),
              ),
              const   SizedBox(
                width: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ControlScreen()),
                  );
                },
                child:  const Text('Control',
                    style: TextStyle(
                        color: Colors.white, fontSize: 17)),
              ),
              const    SizedBox(
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
                child:  const Text('Réclamations',
                    style: TextStyle(
                        color: Colors.white, fontSize: 17)),
              ),
              const    SizedBox(
                width: 30,
              ),
            ],
          )
        ],
        backgroundColor:  const Color(0xFF4695CD),
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
                          'Liste des opérateurs',
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
                        'images/location.png',
                        width: 70,
                      )
                    ],
                  ),

            FutureBuilder<OperateursModel>(
                future: apiService.getAllOperateurs(),
                builder: (
                BuildContext context,
                AsyncSnapshot<OperateursModel> snapshot,
                ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  print("${snapshot.data!.operateurs!.length} xx");
                  return  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.operateurs!.length,
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
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
                                height: 50,
                                child: Row(children: [
                                  const SizedBox(
                                    width: 60,
                                  ),
                                   Text(
                                    '${snapshot.data!.operateurs![index].raison_social}',
                                    style:const  TextStyle(
                                        color: Color.fromARGB(
                                            255, 120, 120, 120),
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                   Text( '${snapshot.data!.operateurs![index].siege_social}'),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                missions_cnas()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:  const Color(0xFF4695CD),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 15),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            20), // <-- Radius
                                      ),
                                    ),
                                    child:  const Text('Missions',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15)),

                                  ),
                                  const SizedBox(
                                    width: 50,
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OperateurDetailsScreen(operateurModel: snapshot.data!.operateurs![index],)),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.orange,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 15),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            20), // <-- Radius
                                      ),
                                    ),
                                    child:  const Text('Details',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15)),

                                  ),
                                  const SizedBox(
                                    width: 60,
                                  ),
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
                }),




                ],
              )),
        ],
      ),
    );


  }
}

/* FutureBuilder<OperateursModel>(
        future: apiService.getAllOperateurs(),
        builder: (
          BuildContext context,
          AsyncSnapshot<OperateursModel> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              print("${snapshot.data!.operateurs!.length} xx");
              return
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        }); */