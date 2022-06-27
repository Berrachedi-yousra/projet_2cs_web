import 'package:image_picker/image_picker.dart';

class RemboursementsModel {
  RemboursementsModel({
    this.remboursements,
  });

  List<RemboursementModel>? remboursements;

  factory RemboursementsModel.fromJson(dynamic json) {
    List<RemboursementModel> tempMissions = [];
    json.forEach((day) => tempMissions.add(RemboursementModel.fromJson(day)));

    return RemboursementsModel(remboursements: tempMissions);
  }
}

class RemboursementModel {
  String? idDemandeRemboursement;
  String? numero_facture;
  String? montant_rembourse;
  String? montant_attendu;
  String? explication_preuve;
  String? preuve_url;
  XFile? preuve;

  RemboursementModel({
    this.idDemandeRemboursement,
    this.numero_facture,
    this.montant_rembourse,
    this.montant_attendu,
    this.explication_preuve,
    this.preuve_url,
    this.preuve,
  });

  factory RemboursementModel.fromJson(Map<String, dynamic> json) {
    return RemboursementModel(
      idDemandeRemboursement: json["idDemandeRemboursement"].toString(),
      numero_facture: json["numero_facture"].toString(),
      montant_rembourse: json["montant_rembourse"],
      montant_attendu: json["montant_attendu"],
      explication_preuve: json["explication_preuve"],
      preuve_url: json["preuve_url"],
    );
  }
}
