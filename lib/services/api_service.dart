import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:techme/models/operaeur.dart';

import '../config/api.dart';
import 'package:http/http.dart' as http;

class ApiService  {
  Future inscrireOperateur(OperateurModel operateurModel) async {
    final url = apiUrl + "admin/newOperateur";

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );

    request.files.add(
      http.MultipartFile(
        'signature',
        operateurModel.signature!.readAsBytes().asStream(),
        await operateurModel.signature!.length(),
        filename: operateurModel.signature!.name,
        contentType:
            MediaType('image', operateurModel.signature!.name.split(".")[1]),
      ),
    );

    final headers = {
      "Content-Type": "multipart/form-data",
      "Access-Control-Allow-Origin": "*"
    };

    request.headers.addAll(headers);

    print(operateurModel.toString());


    request.fields.addAll({
      "raison_social": operateurModel.raison_social ?? "d",
      "siege_social": operateurModel.siege_social ?? "d",
      "date_creation": operateurModel.date_creation ?? '2000-11-17',
      "wilaya": operateurModel.wilaya ?? "x",
      "nombre_employes": operateurModel.nombre_employes ?? "0",
      "nombre_transportateur": operateurModel.nombre_transportateur ?? "0",
      "nombre_vehicule_type_a": operateurModel.nombre_vehicule_type_a ?? "0",
      "nombre_vehicule_type_b": operateurModel.nombre_vehicule_type_b ?? "0" ,
      "adresse_depart_vehicule_b":
          operateurModel.adresse_depart_vehicule_b ?? "x",
      "adresse_depart_vehicule_a":
          operateurModel.adresse_depart_vehicule_a ?? "6",
      "nombre_vehicule_type_c":operateurModel.nombre_vehicule_type_c ?? "0",
      "adresse_depart_vehicule_c":
         operateurModel.adresse_depart_vehicule_c ?? "s",
      "disponibilite_materiel": operateurModel.disponibilite_materiel ?? "s",
      "declaration_adresse": operateurModel.declaration_adresse ?? "s",
      "declaration_date": operateurModel.declaration_date ?? '2000-11-17',
      "nom_utilisateur":   "s",
      "mot_de_pass":  "s",
      "nom_dirigeant": operateurModel.nom_dirigeant ?? "s",
      "prenom_dirigeant": operateurModel.prenom_dirigeant ?? "s",
      "date_naissance_dirigeant": operateurModel.date_naissance_dirigeant ?? "2000-11-17",
      "lieu_naissance_dirigeant": operateurModel.lieu_naissance_dirigeant ?? "s",
      "adresse_dirigeant": operateurModel.adresse_dirigeant ?? "s",
      "sexe_dirigeant":operateurModel.sexe_dirigeant ?? "s",
      "situation_familiale_dirigeant": operateurModel.situation_familiale_dirigeant ?? "s",
    });

    try {
      print(request.fields);
      var response = await request.send();
      var data = await response.stream.bytesToString();

      print(response.statusCode);
      if (response.statusCode == 200) {
        print(data);
        print('opérateur inscrit');

        //notifyListeners();
      } else {
        print('error');

        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<dynamic>> getAllOperateurs() async {


    String url =
        apiUrl + "operateurs";
    print(url);

    try {

      final response = await http.get(
        Uri.parse(url),
       /* headers: {
          //"Content-Type": "application/json",
        },*/
      );
      if (response.statusCode == 200) {
        print("test");
        List<dynamic> userData = json.decode(response.body);

        return userData;

      } else {
        final userData = json.decode(response.body);
        print(userData);
        print('xxx');
        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }

/*

  Future getUserData() async {
    print("wow");

    String url =
        apiUrl + "transportateurs/${_transportateur!.idTransportateur}";

    try {
      print(_transportateur!.idTransportateur);
      print(url);
      final response = await http.get(
        Uri.parse(url),
        headers: {
          //"Content-Type": "application/json",
          'Authorization': 'Bearer $_token',
        },
      );
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        print(userData);
        _transportateur = Transportateur.fromJson(userData);

        notifyListeners();
      } else {
        final userData = json.decode(response.body);
        print(userData);
        print('xxx');
        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }

  Future getMissions() async {
    final userData = await LocalStorage.getUser();

    print(int.parse(userData!["user_id"]!));

    String url =
        apiUrl + "transportateurs/${int.parse(userData["user_id"]!)}/missions";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          //"Content-Type": "application/json",
          'Authorization': 'Bearer $_token',
        },
      );
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        print(userData);
        _missions = MissionsModel.fromJson(userData);

        notifyListeners();
      } else {
        final userData = json.decode(response.body);
        print(userData);
        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> completeMission(String num_carte_id_patient,
      String temps_attente, XFile convention, XFile capture,String kilometrage) async {

    final url = apiUrl + "transportateur/missionComplete/${_missions?.missions![0].idmission}";
    Map<String, String> headers = {
      "Content-type": "multipart/form-data",
      'Authorization': 'Bearer $_token',
    };
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse(url),
    );
    request.files.add(
      http.MultipartFile(
        'conv_lit',
        convention.readAsBytes().asStream(),
        await convention.length(),
        filename: convention.name,
        contentType: MediaType('image', convention.name.split(".")[1]),
      ),
    );
    request.files.add(
      http.MultipartFile(
        'conv_lit',
        capture.readAsBytes().asStream(),
        await capture.length(),
        filename: capture.name,
        contentType: MediaType('image', capture.name.split(".")[1]),
      ),
    );
    request.headers.addAll(headers);
    request.fields.addAll({
      "num_carte_id_patient": num_carte_id_patient,
      "temps_attente": temps_attente,
      "kilometrage": kilometrage,
    });
    try {
      var response = await request.send();
      var data = await response.stream.bytesToString();
      print(data);
      if (response.statusCode == 200) print("Image saved");
      else print('error on updating mission'+response.statusCode.toString());

    } catch (e) {
      print('erroe');
      throw e;
    }
  }

  Future<bool> logOut() async {
    try {
      _isAuth = false;
      _token = null;
      _transportateur = null;
      await LocalStorage.clearLocalStorage();
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }*/
}
