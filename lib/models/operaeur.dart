import 'package:image_picker/image_picker.dart';

class OperateurModel {
  String? raison_social;
  String? siege_social;
  String? date_creation;
  String? wilaya;
  String? nombre_employes;
  String? nombre_transportateur; // could be student or parent
  String? nombre_vehicule_type_a;
  String? nombre_vehicule_type_b;
  String? adresse_depart_vehicule_b;
  String? adresse_depart_vehicule_a;
  String? nombre_vehicule_type_c;
  String? adresse_depart_vehicule_c;
  String? disponibilite_materiel;
  String? declaration_adresse;
  String? declaration_date;
  String? nom_utilisateur;
  String? mot_de_pass;
  XFile? signature;

  String? nom_dirigeant;
  String? prenom_dirigeant;
  String? date_naissance_dirigeant;
  String? lieu_naissance_dirigeant;
  String? adresse_dirigeant;
  String? sexe_dirigeant;
  String? situation_familiale_dirigeant;

  OperateurModel({
    this.raison_social,
    this.siege_social,
    this.date_creation,
    this.wilaya,
    this.nombre_employes,
    this.nombre_transportateur,
    this.nombre_vehicule_type_a,
    this.nombre_vehicule_type_b,
    this.adresse_depart_vehicule_b,
    this.adresse_depart_vehicule_a,
    this.nombre_vehicule_type_c,
    this.adresse_depart_vehicule_c,
    this.disponibilite_materiel,
    this.declaration_adresse,
    this.declaration_date,
    this.nom_utilisateur,
    this.mot_de_pass,
    this.adresse_dirigeant,
    this.nom_dirigeant,
    this.prenom_dirigeant,
    this.date_naissance_dirigeant,
    this.lieu_naissance_dirigeant,
    this.sexe_dirigeant,
    this.situation_familiale_dirigeant,
  });

  factory OperateurModel.fromJson(Map<String, dynamic> json) {
    return OperateurModel(
      raison_social: json["raison_social"],
      siege_social: json["siege_social"],
      date_creation: json["date_creation"],
      wilaya: json["wilaya"],
      nombre_employes: json["nombre_employes"],
      nombre_transportateur: json["nombre_transportateur"],
      nombre_vehicule_type_a: json["nombre_vehicule_type_a"],
      nombre_vehicule_type_b: json["nombre_vehicule_type_b"],
      adresse_depart_vehicule_b: json["adresse_depart_vehicule_b"],
      adresse_depart_vehicule_a: json["adresse_depart_vehicule_a"],
      nombre_vehicule_type_c: json["nombre_vehicule_type_c"],
      adresse_depart_vehicule_c: json["adresse_depart_vehicule_c"],
      disponibilite_materiel: json["disponibilite_materiel"],
      declaration_adresse: json["declaration_adresse"],
      declaration_date: json["declaration_date"],
      nom_utilisateur: json["nom_utilisateur"],
      mot_de_pass: json["mot_de_pass"],
      nom_dirigeant: json["nom_dirigeant"],
      prenom_dirigeant: json["prenom_dirigeant"],
      date_naissance_dirigeant: json["date_naissance_dirigeant"],
      lieu_naissance_dirigeant: json["lieu_naissance_dirigeant"],
      adresse_dirigeant: json["adresse_dirigeant"],
      sexe_dirigeant: json["sexe_dirigeant"],
      situation_familiale_dirigeant: json["situation_familiale_dirigeant"],
    );
  }
}
