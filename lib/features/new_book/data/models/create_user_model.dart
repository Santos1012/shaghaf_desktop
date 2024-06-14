class CreateUserModel {
  String? message;
  Data? data;

  CreateUserModel({
    this.message,
    this.data,
  });

  factory CreateUserModel.fromJson(Map<String, dynamic> json) =>
      CreateUserModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? username;
  String? email;
  String? phone;
  String? password;
  VerificationCode? verificationCode;
  bool? isVerified;
  DateTime? birthdate;
  String? userType;
  int? point;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.username,
    this.email,
    this.phone,
    this.password,
    this.verificationCode,
    this.isVerified,
    this.birthdate,
    this.userType,
    this.point,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        verificationCode: json["verificationCode"] == null
            ? null
            : VerificationCode.fromJson(json["verificationCode"]),
        isVerified: json["isVerified"],
        birthdate: json["birthdate"] == null
            ? null
            : DateTime.parse(json["birthdate"]),
        userType: json["userType"],
        point: json["point"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "verificationCode": verificationCode?.toJson(),
        "isVerified": isVerified,
        "birthdate": birthdate?.toIso8601String(),
        "userType": userType,
        "point": point,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class VerificationCode {
  dynamic reason;

  VerificationCode({
    this.reason,
  });

  factory VerificationCode.fromJson(Map<String, dynamic> json) =>
      VerificationCode(
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
      };
}
