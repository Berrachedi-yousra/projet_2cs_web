class LoginModel {
  String? idOperateur;
  String? raison_social;
  String? siege_social;
  String? acessToken;
  String? refreshToken;

  LoginModel({
    this.idOperateur,
    this.raison_social,
    this.siege_social,
    this.acessToken,
    this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      idOperateur: json["idOperateur"] != null
          ? json["idOperateur"].toString()
          : json["idOperateur"],
      raison_social: json["raison_social"] ?? '',
      siege_social: json["siege_social"] ?? '',
      acessToken: json["acessToken"],
      refreshToken: json["refreshToken"],
    );
  }
}
