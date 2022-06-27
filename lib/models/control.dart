/*class ControlsModel {
  ControlsModel({
    this.controls,
  });

  List<ControlModel>? controls;

  factory ControlsModel.fromJson(dynamic json) {
    List<ControlModel> tempMissions = [];
    json.forEach((day) => tempMissions.add(ControlModel.fromJson(day)));

    return ControlsModel(controls: tempMissions);
  }
}

class ControlModel {
  String? numero_controle;
  String? raison_social_operateur;
  String? nom_controleur1;
  String? prenom_cotroleur1;
  String? nom_controleur2;
  String? prenom_cotroleur2;
  String? date_controle;
  String? heure_controle;

  ControlModel({
    this.id_operateur,
    this.nom,
    this.prenom,
    this.date_recrutement,
    this.type_vehicule,
    this.idtransportateur,
    this.photo_transportateur,
    this.email,
    this.mot_de_passe_transportateur,
  });

  factory ControlModel.fromJson(Map<String, dynamic> json) {
    return ControlModel(
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
*/