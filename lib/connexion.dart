import 'dart:html';
import 'package:flutter/material.dart';
import 'package:techme/config/constants.dart';
import 'package:techme/main.dart';
import 'package:techme/screens/reclamation/reclamation.dart';
import 'package:techme/inscription.dart';
import 'package:techme/acceuil_op.dart';
import 'package:techme/acceuil_cnas.dart';
import 'package:techme/services/api_service.dart';
import 'package:techme/widgets/widgets.dart';

//import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: connexion()));
}

class connexion extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<connexion> {
  bool _isLoading = false;
  bool showText = false;
  final _formKey = GlobalKey<FormState>();

  ApiService apiService = ApiService();

  Future<void> ConnecterCnas() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();

      try {
        setState(() {});
        await apiService.login(email, password, "cnas").then((value) =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => acceuil_cnas())));

        setState(() {
          _isLoading = false;
        });
        print('login success');
      } catch (e) {
        errorSnackBar(context, "mot de passe ou email incorrect");
        setState(() {
          _isLoading = false;
        });
      }

      //Navigator.pushReplacementNamed(context, Layout.route);
    }
  }

  Future<void> ConnecterOperateur() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();

      try {
        setState(() {});
        await apiService.login(email, password, "operateur").then((value) =>
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => AcceuilOp())));

        setState(() {
          _isLoading = false;
        });
        print('login success');
      } catch (e) {
        errorSnackBar(context, "mot de passe ou email incorrect");
        setState(() {
          _isLoading = false;
        });
      }

      //Navigator.pushReplacementNamed(context, Layout.route);
    }
  }

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Expanded(
              flex: 1,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      // login

                      Container(
                        width: 816,
                        //height: 600,
                        child: Form(
                          key: _formKey,
                          child: Column(children: [
                            const SizedBox(
                              height: 50,
                              width: 10,
                            ),
                            Image.asset(
                              'images/cnas-white.png',
                              width: 70,
                            ),
                            const SizedBox(
                              height: 70,
                              width: 150,
                            ),
                            const Text(
                              "Connexion à votre compte",
                              style: TextStyle(
                                  color: Color(0xFF4695CD),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                                width: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Color.fromARGB(
                                            255, 130, 130, 130))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Username",
                                        ),
                                        validator: (val) {
                                          if (!val!.isNotEmpty) {
                                            return "please enter an email";
                                          }
                                          return null;
                                        },
                                        textAlign: TextAlign.center,
                                        onChanged: (val) {
                                          setState(() {
                                            email = val;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                                width: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Color.fromARGB(
                                            255, 130, 130, 130))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                            hintText: "password",
                                            prefixIcon: Icon(Icons.lock)),
                                        validator: (val) {
                                          if (val!.length < 4) {
                                            return "please enter a 4+ char long password";
                                          }
                                          return null;
                                        },
                                        textAlign: TextAlign.center,
                                        onChanged: (val) {
                                          setState(() {
                                            password = val;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await ConnecterOperateur();
                              },
                              child: _isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'Se connecter',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20), // <-- Radius
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await ConnecterCnas();
                              },
                              child: _isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'Se connecter cnas',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20), // <-- Radius
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),

                      // bleu part

                      Container(
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF4695CD),
                        ),
                        width: 550,
                        height: 655,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bienvenue!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: 100,
                              height: 3,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Nous détectons votre type de compte',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()),
                                );
                              },
                              child: Text(
                                'retourner à la page d acceuil',
                                style: TextStyle(
                                    color: Color(0xFF4695CD),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20), // <-- Radius
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
        ],
      )),
    );
  }
}
