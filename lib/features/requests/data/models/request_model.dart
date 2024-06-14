class RequestModel {
  String? message;
  Pagination? pagination;
  List<Datum>? data;

  RequestModel({
    this.message,
    this.pagination,
    this.data,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        message: json["message"],
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "pagination": pagination?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  Member? member;
  User? user;
  bool? paid;
  int? totalPrice;
  int? pointDiscount;
  int? stuffDiscount;
  DateTime? start;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.member,
    this.user,
    this.paid,
    this.totalPrice,
    this.pointDiscount,
    this.stuffDiscount,
    this.start,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        member: json["member"] == null ? null : Member.fromJson(json["member"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        paid: json["paid"],
        totalPrice: json["totalPrice"],
        pointDiscount: json["pointDiscount"],
        stuffDiscount: json["stuffDiscount"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "member": member?.toJson(),
        "user": user?.toJson(),
        "paid": paid,
        "totalPrice": totalPrice,
        "pointDiscount": pointDiscount,
        "stuffDiscount": stuffDiscount,
        "start": start?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Member {
  String? id;
  String? title;
  List<Detail>? details;
  int? price;
  int? duration;
  String? durationType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Member({
    this.id,
    this.title,
    this.details,
    this.price,
    this.duration,
    this.durationType,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["_id"],
        title: json["title"],
        details: json["details"] == null
            ? []
            : List<Detail>.from(
                json["details"]!.map((x) => Detail.fromJson(x))),
        price: json["price"],
        duration: json["duration"],
        durationType: json["durationType"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toJson())),
        "price": price,
        "duration": duration,
        "durationType": durationType,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Detail {
  String? title;
  String? id;

  Detail({
    this.title,
    this.id,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        title: json["title"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "_id": id,
      };
}

class User {
  String? id;
  String? username;
  String? email;

  User({
    this.id,
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
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
