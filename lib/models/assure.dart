
class AssureModel {
  String? nss;
  String? nom;
  String? prenom;
  String? sexe;
  String? date_naissance;
  String? lieu_naissance; // could be student or parent
  String? commune_naissance;
  String? wilaya_naissance;
  String? nationalite;
  String? code_postal;
  String? adresse_complete;
  String? situation_familliale;
  String? prenom_pere;
  String? prenom_mere;
  String? nom_mere;
  String? nom_epoux;


  AssureModel({
    this.nss,
    this.nom,
    this.prenom,
    this.sexe,
    this.date_naissance,
    this.lieu_naissance,
    this.commune_naissance,
    this.wilaya_naissance,
    this.nationalite,
    this.code_postal,
    this.adresse_complete,
    this.situation_familliale,
    this.prenom_pere,
    this.prenom_mere,
    this.nom_mere,
    this.nom_epoux,
  });

  factory AssureModel.fromJson(Map<String, dynamic> json) {
    return AssureModel(
      nss: json["nss"],
      nom: json["nom"],
      prenom: json["prenom"],
      sexe: json["sexe"],
      date_naissance: json["date_naissance"],
      lieu_naissance: json["lieu_naissance"],
      commune_naissance: json["commune_naissance"],
      wilaya_naissance: json["wilaya_naissance"],
      nationalite: json["nationalite"],
      code_postal: json["code_postal"],
      adresse_complete: json["adresse_complete"],
      situation_familliale: json["situation_familliale"],
      prenom_pere: json["prenom_pere"],
      prenom_mere: json["prenom_mere"],
      nom_mere: json["nom_mere"],
      nom_epoux: json["nom_epoux"],
    );
  }
}
