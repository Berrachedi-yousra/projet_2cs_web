import 'package:image_picker/image_picker.dart';

class FactureModel {
 // String? num;
  String? date_mission;
  String? heure_depart;
  String? heure_arrive;
  String? nom_malade;
  String? prenom_malade;
  String? adresse_depart;
  String? adresse_arrive;
  String? nombre_patient;
  String? attente;
  String? distance_retour;
  String? distance_siege;
  String? montant_total;
  String? operateur;

  XFile? capture_ecran;
  XFile? attestation_medical;
  XFile? certificat_soin;

  FactureModel({
//    this.num,
    this.date_mission,
    this.heure_depart,
    this.heure_arrive,
    this.nom_malade,
    this.prenom_malade,
    this.adresse_arrive,
    this.adresse_depart,
    this.nombre_patient,
    this.attente,
    this.distance_retour,
    this.distance_siege,
    this.montant_total,
    this.operateur,
  });

  factory FactureModel.fromJson(Map<String, dynamic> json) {
    return FactureModel(
  //    num: json['num'],
      date_mission: json['date_mission'],
      heure_depart: json['heure_depart'],
      heure_arrive: json['heure_arrive'],
      nom_malade: json['nom_malade'],
      prenom_malade: json['prenom_malade'],
      adresse_depart: json['adresse_depart'],
      adresse_arrive: json['adress_arrive'],
      nombre_patient: json['nombre_patient'],
      attente: json['attente'],
      distance_retour: json['distance_retour'],
      distance_siege: json['distance_siege'],
      montant_total: json['montant_total'],
      operateur: json['operateur'],
    );
  }
}
