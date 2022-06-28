import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:techme/models/assure.dart';
import 'package:techme/models/control.dart';
import 'package:techme/models/facture.dart';
import 'package:techme/models/operaeur.dart';
import 'package:techme/models/reclamation.dart';
import 'package:techme/models/remboursement.dart';
import 'package:techme/models/transportateur.dart';

import '../config/api.dart';
import 'package:http/http.dart' as http;

import '../models/mission.dart';
import 'localstorage.dart';

class ApiService {
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
      "nombre_vehicule_type_b": operateurModel.nombre_vehicule_type_b ?? "0",
      "adresse_depart_vehicule_b":
          operateurModel.adresse_depart_vehicule_b ?? "x",
      "adresse_depart_vehicule_a":
          operateurModel.adresse_depart_vehicule_a ?? "6",
      "nombre_vehicule_type_c": operateurModel.nombre_vehicule_type_c ?? "0",
      "adresse_depart_vehicule_c":
          operateurModel.adresse_depart_vehicule_c ?? "s",
      "disponibilite_materiel": operateurModel.disponibilite_materiel ?? "s",
      "declaration_adresse": operateurModel.declaration_adresse ?? "s",
      "declaration_date": operateurModel.declaration_date ?? '2000-11-17',
      "nom_utilisateur": "s",
      "mot_de_pass": "s",
      "nom_dirigeant": operateurModel.nom_dirigeant ?? "s",
      "prenom_dirigeant": operateurModel.prenom_dirigeant ?? "s",
      "date_naissance_dirigeant":
          operateurModel.date_naissance_dirigeant ?? "2000-11-17",
      "lieu_naissance_dirigeant":
          operateurModel.lieu_naissance_dirigeant ?? "s",
      "adresse_dirigeant": operateurModel.adresse_dirigeant ?? "s",
      "sexe_dirigeant": operateurModel.sexe_dirigeant ?? "s",
      "situation_familiale_dirigeant":
          operateurModel.situation_familiale_dirigeant ?? "s",
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

  Future inscrireRemboursement(RemboursementModel remboursementModel) async {
    final url = apiUrl + "admin/newDemandeRemboursement";

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );

    request.files.add(
      http.MultipartFile(
        'preuves',
        remboursementModel.preuve!.readAsBytes().asStream(),
        await remboursementModel.preuve!.length(),
        filename: remboursementModel.preuve!.name,
        contentType:
            MediaType('image', remboursementModel.preuve!.name.split(".")[1]),
      ),
    );

    final headers = {
      "Content-Type": "multipart/form-data",
      "Access-Control-Allow-Origin": "*"
    };

    request.headers.addAll(headers);

    print(remboursementModel.toString());

    request.fields.addAll({
      "numero_facture": remboursementModel.numero_facture ?? "0",
      "montant_rembourse": remboursementModel.montant_rembourse ?? "0",
      "montant_attendu": remboursementModel.montant_attendu ?? '0',
      "explication_preuve": remboursementModel.explication_preuve ?? "x",
    });

    try {
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


  Future inscrireTransportateur(TransportateurModel transportateurModel) async {
    final url = apiUrl + "admin/transportateurForm";

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );

    request.files.add(
      http.MultipartFile(
        'photo_transportateur',
        transportateurModel.photo_transportateur_file!.readAsBytes().asStream(),
        await transportateurModel.photo_transportateur_file!.length(),
        filename: transportateurModel.photo_transportateur_file!.name,
        contentType:
        MediaType('image', transportateurModel.photo_transportateur_file!.name.split(".")[1]),
      ),
    );

    final headers = {
      "Content-Type": "multipart/form-data",
      "Access-Control-Allow-Origin": "*"
    };

    request.headers.addAll(headers);

    print(transportateurModel.toString());

    request.fields.addAll({
      "nom": transportateurModel.nom ?? "",
      "prenom": transportateurModel.prenom ?? "",
      "date_recrutement": transportateurModel.date_recrutement ?? '',
      "type_vehicule": transportateurModel.type_vehicule ?? "",
      "id_operateur": transportateurModel.id_operateur ?? "3",
      "email": transportateurModel.email ?? "",
      "mot_de_passe_transportateur": transportateurModel.mot_de_passe_transportateur ?? "",

    });

    try {
      var response = await request.send();
      var data = await response.stream.bytesToString();

      print(response.statusCode);
      if (response.statusCode == 200) {
        print(data);
        print('transportateur inscrit');

        //notifyListeners();
      } else {
        print('error');

        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }


  Future inscrireAssure(AssureModel assureModel) async {
    final url = apiUrl + "newAssure";

    final headers = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    };

    final body = {
      "nss": assureModel.nss ?? "",
      "nom": assureModel.nom ?? "",
      "date_naissance": assureModel.date_naissance ?? '2000-11-17',
      "sexe": assureModel.sexe ?? "",
      "prenom": assureModel.prenom ?? "",
      "lieu_naissance": assureModel.lieu_naissance ?? "",
      "commune_naissance": assureModel.commune_naissance ?? "",
      "wilaya_naissance": assureModel.wilaya_naissance ?? "",
      "nationalite": assureModel.nationalite ?? "",
      "code_postal": assureModel.code_postal ?? '',
      "adresse_complete": assureModel.adresse_complete ?? "",
      "situation_familliale": assureModel.situation_familliale ?? "",
      "prenom_pere": assureModel.prenom_pere ?? "",
      "prenom_mere": assureModel.prenom_mere ?? "",
      "nom_mere": assureModel.nom_mere ?? "",
      "nom_epoux": assureModel.nom_epoux ?? "",
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));

      print(response.statusCode);
      if (response.statusCode == 200) {
        print('assuré inscrit');

        //notifyListeners();
      } else {
        print('error');

        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }

  Future inscrireControl(ControlModel controlModel) async {
    final url = apiUrl + "admin/newControl";

    final headers = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    };

    final body = {
      "raison_social_operateur": controlModel.raison_social_operateur ?? "",
      "nom_controleur1": controlModel.nom_controleur1 ?? "",
      "nom_controleur2": controlModel.nom_controleur2 ?? '',
      "prenom_cotroleur1": controlModel.prenom_cotroleur1 ?? "",
      "prenom_cotroleur2": controlModel.prenom_cotroleur2 ?? "",
      "date_controle": controlModel.date_controle ?? "2000-11-17",
      "heure_controle": controlModel.heure_controle ?? "",
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));

      print(response.statusCode);
      if (response.statusCode == 200) {
        print('control inscrit');

        //notifyListeners();
      } else {
        print('error');

        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }

  Future inscrireReclamation(
      ReclamationModel reclamationModel, String type) async {
    final url = apiUrl + "newReclamation";

    final headers = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    };

    final body = {
      "type_reclammation": type,
      "matricule": reclamationModel.matricule,
      "nom": reclamationModel.nom,
      "prenom": reclamationModel.prenom,
      "date_naissance": reclamationModel.date_naissance,
      "si_assure": reclamationModel.si_assure,
      "adresse": reclamationModel.adresse,
      "numero_telephone": reclamationModel.numero_telephone,
      "raison_social": reclamationModel.raison_social,
      "siege_social": reclamationModel.siege_social,
      "post_emetteur": reclamationModel.post_emetteur,
      "reclamation_sur": reclamationModel.reclamation_sur,
      "date_accident": reclamationModel.date_accident,
      "date_reclamation": reclamationModel.date_reclamation,
      "contenu_reclamation": reclamationModel.contenu_reclamation,
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));

      print(response.statusCode);
      if (response.statusCode == 200) {
        print('reclamation inscrit');

        //notifyListeners();
      } else {
        print('error');

        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }


  Future inscrireMission(
      MissionModel missionModel) async {
    final url = apiUrl + "admin/missionsForm";

    final headers = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    };

    final body = {
      "nom_patient": missionModel.nom_patient,
      "prenom_patient": missionModel.prenom_patient,
      "date_mission": missionModel.date_mission,
      "heure_depart": missionModel.heure_depart,
      "adresse_depart": missionModel.adresse_depart,
      "adresse_arrive": missionModel.adresse_arrive,
      "nombre_patient": missionModel.nombre_patient,
      "attente": missionModel.attente,
      "temps_attente": missionModel.temps_attente,
      "nom_transportateur": missionModel.nom_transportateur,
      "prenom_transportateur": missionModel.prenom_transportateur,

    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));

      print(response.statusCode);
      if (response.statusCode == 200) {
        print('reclamation inscrit');

        //notifyListeners();
      } else {
        print('error');

        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }

  Future inscrireFacture(FactureModel factureModel) async {
    final url = apiUrl + "admin/newFacture";

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );

    request.files.add(
      http.MultipartFile(
        'fichier',
        factureModel.capture_ecran!.readAsBytes().asStream(),
        await factureModel.capture_ecran!.length(),
        filename: factureModel.capture_ecran!.name,
        contentType:
            MediaType('image', factureModel.capture_ecran!.name.split(".")[1]),
      ),
    );
    request.files.add(
      http.MultipartFile(
        'fichier',
        factureModel.attestation_medical!.readAsBytes().asStream(),
        await factureModel.attestation_medical!.length(),
        filename: factureModel.attestation_medical!.name,
        contentType: MediaType(
            'image', factureModel.attestation_medical!.name.split(".")[1]),
      ),
    );
    request.files.add(
      http.MultipartFile(
        'fichier',
        factureModel.certificat_soin!.readAsBytes().asStream(),
        await factureModel.certificat_soin!.length(),
        filename: factureModel.certificat_soin!.name,
        contentType: MediaType(
            'image', factureModel.certificat_soin!.name.split(".")[1]),
      ),
    );

    final headers = {
      "Content-Type": "multipart/form-data",
      "Access-Control-Allow-Origin": "*"
    };

    request.headers.addAll(headers);

    print(factureModel.toString());

    request.fields.addAll({
      // "num": factureModel.num ?? "d",
      "date_mission": factureModel.date_mission ?? "d",
      "heure_depart": factureModel.heure_depart ?? "d",
      "heure_arrive": factureModel.heure_arrive ?? "d",
      "nom_malade": factureModel.nom_malade ?? "d",
      "prenom_malade": factureModel.prenom_malade ?? "d",
      "adresse_depart": factureModel.adresse_depart ?? "d",
      "adresse_arrive": factureModel.adresse_arrive ?? "d",
      "nombre_patient": factureModel.nombre_patient ?? "d",
      "attente": factureModel.attente ?? "d",
      "distance_retour": factureModel.distance_retour ?? "d",
      "distance_siege": factureModel.distance_siege ?? "d",
      "montant_total": factureModel.montant_total ?? "d",
      "operateur": factureModel.operateur ?? "d",
    });

    try {
      print(request.fields);
      var response = await request.send();
      var data = await response.stream.bytesToString();

      print(response.statusCode);
      if (response.statusCode == 200) {
        print(data);
        print('facture enregistrée');

        //notifyListeners();
      } else {
        print('error');

        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<OperateursModel> getAllOperateurs() async {
    String url = apiUrl + "operateurs";
    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
        /* headers: {
          //"Content-Type": "application/json",
        },*/
      );
      if (response.statusCode == 200) {
        List<dynamic> userData = json.decode(response.body);
        OperateursModel operateursModel = OperateursModel.fromJson(userData);
        return operateursModel;
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

  Future<MissionsModel> getAllMissions() async {
    String url = apiUrl + "admin/allmissions";
    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
        /* headers: {
          //"Content-Type": "application/json",
        },*/
      );
      if (response.statusCode == 200) {
        List<dynamic> userData = json.decode(response.body);
        MissionsModel missionsModel = MissionsModel.fromJson(userData);
        return missionsModel;
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

  Future<TransportateursModel> getOperateursAllTransportateur(
      String idOperateur) async {
    String url = apiUrl + "operateurs/${idOperateur}/transportateurs";
    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
        /* headers: {
          //"Content-Type": "application/json",
        },*/
      );
      if (response.statusCode == 200) {
        List<dynamic> userData = json.decode(response.body);
        TransportateursModel transportateursModel =
            TransportateursModel.fromJson(userData);
        return transportateursModel;
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


  Future<ControlsModel> getControlsByOperateur(
      String idOperateur) async {
    String url = apiUrl + "admin/getControlsByOperator/${idOperateur}";
    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
        /* headers: {
          //"Content-Type": "application/json",
        },*/
      );
      if (response.statusCode == 200) {
        List<dynamic> userData = json.decode(response.body);
        ControlsModel controlsModel =
        ControlsModel.fromJson(userData);
        return controlsModel;
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


  Future<ReclamationsModel> getAllReclamations() async {
    String url = apiUrl + "admin/getAllReclamations";
    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
        /* headers: {
          //"Content-Type": "application/json",
        },*/
      );

      if (response.statusCode == 200) {
        List<dynamic> userData = json.decode(response.body);
        print(userData.length);
        ReclamationsModel reclamationsModel =
            ReclamationsModel.fromJson(userData);
        return reclamationsModel;
      } else {
        final userData = json.decode(response.body);

        print(userData);
        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }

  Future login(String? email, String? password,String typeConnexion) async {
    final url = typeConnexion=='cnas' ? apiUrl + "cnasConnexion" : apiUrl + "operateurConnexion";
    final headers = {
      "Content-Type": "application/json",
    };
    final body = {
      "username": email,
      "password": password,
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);

        await LocalStorage.saveUser(
            data["acessToken"].toString(), data["idOperateur"].toString());
/*
        _isAuth = true;
        _token = data["acessToken"];
        _transportateur = Transportateur();
        _transportateur!.idTransportateur = data["idTransportateur"];
        await LocalStorage.saveUser(
            _token, data["idTransportateur"].toString(), data["acessToken"]);
        notifyListeners();*/
      } else {
        final data = jsonDecode(response.body);
      /*  _transportateur = Transportateur();
        _transportateur = Transportateur.fromJson(data);*/

        throw Error();
      }
    } catch (e) {
      print("login error");
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
