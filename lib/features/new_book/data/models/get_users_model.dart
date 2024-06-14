class GetUsersModel {
  String? message;
  Pagination? pagination;
  List<DatumGetAllUsers>? data;

  GetUsersModel({
    this.message,
    this.pagination,
    this.data,
  });

  factory GetUsersModel.fromJson(Map<String, dynamic> json) => GetUsersModel(
    message: json["message"],
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    data: json["data"] == null ? [] : List<DatumGetAllUsers>.from(json["data"]!.map((x) => DatumGetAllUsers.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "pagination": pagination?.toJson(),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumGetAllUsers {
  VerificationCode? verificationCode;
  String? id;
  String? username;
  String? email;
  String? phone;
  bool? isVerified;
  DateTime? birthdate;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? token;
  int? point;
  String? userType;

  DatumGetAllUsers({
    this.verificationCode,
    this.id,
    this.username,
    this.email,
    this.phone,
    this.isVerified,
    this.birthdate,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
    this.point,
    this.userType,
  });

  factory DatumGetAllUsers.fromJson(Map<String, dynamic> json) => DatumGetAllUsers(
    verificationCode: json["verificationCode"] == null ? null : VerificationCode.fromJson(json["verificationCode"]),
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    isVerified: json["isVerified"],
    birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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

  factory VerificationCode.fromJson(Map<String, dynamic> json) => VerificationCode(
    code: json["code"],
    expireAt: json["expireAt"] == null ? null : DateTime.parse(json["expireAt"]),
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "expireAt": expireAt?.toIso8601String(),
    "reason": reason,
  };
}

class Pagination {
  int? currentPage;
  int? resultCount;
  int? totalPages;

  Pagination({
    this.currentPage,
    this.resultCount,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["currentPage"],
    resultCount: json["resultCount"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "resultCount": resultCount,
    "totalPages": totalPages,
  };
}
