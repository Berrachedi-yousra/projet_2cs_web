class ReclamationsModel {
  ReclamationsModel({
    this.reclamations,
  });

  List<ReclamationModel>? reclamations;

  factory ReclamationsModel.fromJson(dynamic json) {

    List<ReclamationModel> tempMissions = [];
    json.forEach((day) => tempMissions.add(ReclamationModel.fromJson(day)));

    return ReclamationsModel(reclamations: tempMissions);
  }
}



class ReclamationModel {
  String? id_reclamation;
  String? type_reclammation;
  String? matricule;
  String? nom;
  String? prenom;
  String? date_naissance;
  String? si_assure;
  String? adresse;
  String? numero_telephone;
  String? raison_social;
  String? siege_social;
  String? post_emetteur;
  String? reclamation_sur;
  String? date_accident;
  String? date_reclamation;
  String? contenu_reclamation;

  ReclamationModel({
    this.id_reclamation,
    this.nom,
    this.prenom,
    this.type_reclammation,
    this.matricule,
    this.date_naissance,
    this.si_assure,
    this.adresse,
    this.numero_telephone,
    this.raison_social,
    this.siege_social,
    this.post_emetteur,
    this.reclamation_sur,
    this.date_accident,
    this.date_reclamation,
    this.contenu_reclamation,
  });

  factory ReclamationModel.fromJson(Map<String, dynamic> json) {
    print('test,');
    return ReclamationModel(
      id_reclamation: json["id_reclamation"].toString(),
      nom: json["nom"]?? '',
      prenom: json["prenom"]?? '',
      type_reclammation: json["type_reclammation"]?? '',
      matricule: json["matricule"]?? '',
      date_naissance: json["date_naissance"]?? '',
      si_assure: json["si_assure"] != null ? json["si_assure"].toString() : '',
      adresse: json["adresse"]?? '',
      numero_telephone: json["numero_telephone"]?? '',
      raison_social: json["raison_social"]?? '',
      siege_social: json["siege_social"]?? '',
      post_emetteur: json["post_emetteur"]?? '',
      reclamation_sur: json["reclamation_sur"]?? '',
      date_accident: json["date_accident"]?? '',
      date_reclamation: json["date_reclamation"]?? '',
      contenu_reclamation: json["contenu_reclamation"]?? '',

    );
  }
}
