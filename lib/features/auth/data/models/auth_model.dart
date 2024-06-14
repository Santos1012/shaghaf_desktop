class AuthModel {
  String? message;
  Data? data;

  AuthModel({
    this.message,
    this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  VerificationCode? verificationCode;
  String? id;
  String? username;
  String? email;
  String? phone;
  String? password;
  bool? isVerified;
  DateTime? birthdate;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? token;
  int? point;
  String? userType;

  Data({
    this.verificationCode,
    this.id,
    this.username,
    this.email,
    this.phone,
    this.password,
    this.isVerified,
    this.birthdate,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
    this.point,
    this.userType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        verificationCode: json["verificationCode"] == null
            ? null
            : VerificationCode.fromJson(json["verificationCode"]),
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        isVerified: json["isVerified"],
        birthdate: json["birthdate"] == null
            ? null
            : DateTime.parse(json["birthdate"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["token"],
        point: json["point"],
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "verificationCode": verificationCode?.toJson(),
        "_id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "isVerified": isVerified,
        "birthdate": birthdate?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "token": token,
        "point": point,
        "userType": userType,
      };
}

class VerificationCode {
  String? code;
  DateTime? expireAt;
  String? reason;

  VerificationCode({
    this.code,
    this.expireAt,
    this.reason,
  });

  factory VerificationCode.fromJson(Map<String, dynamic> json) =>
      VerificationCode(
        code: json["code"],
        expireAt:
            json["expireAt"] == null ? null : DateTime.parse(json["expireAt"]),
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "expireAt": expireAt?.toIso8601String(),
        "reason": reason,
      };
}
