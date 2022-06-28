class ControlsModel {
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
    this.numero_controle,
    this.raison_social_operateur,
    this.nom_controleur1,
    this.nom_controleur2,
    this.prenom_cotroleur1,
    this.prenom_cotroleur2,
    this.date_controle,
    this.heure_controle,
  });

  factory ControlModel.fromJson(Map<String, dynamic> json) {
    return ControlModel(
      numero_controle: json["numero_controle"].toString(),
      raison_social_operateur: json["raison_social_operateur"],
      nom_controleur1: json["nom_controleur1"],
      nom_controleur2: json["nom_controleur2"],
      prenom_cotroleur1: json["prenom_cotroleur1"],
      prenom_cotroleur2: json["prenom_cotroleur2"],
      date_controle: json["date_controle"].toString(),
      heure_controle: json["heure_controle"],

    );
  }
}
