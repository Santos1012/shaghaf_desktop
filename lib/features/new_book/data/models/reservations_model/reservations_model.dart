import 'member.dart';
import 'user.dart';

class ReservationsModel {
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

  ReservationsModel({
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

  factory ReservationsModel.fromJson(Map<String, dynamic> json) {
    return ReservationsModel(
      id: json['_id'] as String?,
      member: json['member'] == null
          ? null
          : Member.fromJson(json['member'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      paid: json['paid'] as bool?,
      totalPrice: json['totalPrice'] as int?,
      pointDiscount: json['pointDiscount'] as int?,
      stuffDiscount: json['stuffDiscount'] as int?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'member': member?.toJson(),
        'user': user?.toJson(),
        'paid': paid,
        'totalPrice': totalPrice,
        'pointDiscount': pointDiscount,
        'stuffDiscount': stuffDiscount,
        'start': start?.toIso8601String(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
