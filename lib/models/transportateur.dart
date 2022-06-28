import 'package:image_picker/image_picker.dart';

class TransportateursModel {
  TransportateursModel({
    this.transportateur,
  });

  List<TransportateurModel>? transportateur;

  factory TransportateursModel.fromJson(dynamic json) {
    List<TransportateurModel> tempMissions = [];
    json.forEach((day) => tempMissions.add(TransportateurModel.fromJson(day)));

    return TransportateursModel(transportateur: tempMissions);
  }
}

class TransportateurModel {
  String? idtransportateur;
  String? nom;
  String? prenom;
  String? date_recrutement;
  String? type_vehicule;
  String? id_operateur;
  String? photo_transportateur;
  String? email;
  String? mot_de_passe_transportateur;

  XFile? photo_transportateur_file;

  TransportateurModel({
    this.id_operateur,
    this.nom,
    this.prenom,
    this.date_recrutement,
    this.type_vehicule,
    this.idtransportateur,
    this.photo_transportateur,
    this.email,
    this.mot_de_passe_transportateur,
    this.photo_transportateur_file,
  });

  factory TransportateurModel.fromJson(Map<String, dynamic> json) {
    return TransportateurModel(
      id_operateur: json["id_operateur"].toString(),
      nom: json["nom"],
      prenom: json["prenom"],
      date_recrutement: json["date_recrutement"].toString(),
      type_vehicule: json["type_vehicule"],
      idtransportateur: json["idtransportateur"].toString(),
      photo_transportateur: json["photo_transportateur"],
      email: json["email"],
      mot_de_passe_transportateur: json["mot_de_passe_transportateur"],

    );
  }
}
