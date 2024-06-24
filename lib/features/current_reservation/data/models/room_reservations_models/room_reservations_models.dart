import 'coffee.dart';
import 'plan.dart';
import 'room.dart';
import 'user.dart';

class RoomReservationsModels {
  String? id;
  User? user;
  Room? room;
  Plan? plan;
  int? seatCount;
  num? totalPrice;
  bool? reservationPaid;
  bool? coffeePaid;
  bool? extraPaid;
  num? coffeePrice;
  num? extraPrice;
  num? reservationPrice;
  DateTime? startDate;
  DateTime? endDate;
  List<Coffee>? coffee;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  RoomReservationsModels({
    this.id,
    this.user,
    this.room,
    this.plan,
    this.seatCount,
    this.totalPrice,
    this.reservationPaid,
    this.coffeePaid,
    this.extraPaid,
    this.coffeePrice,
    this.extraPrice,
    this.reservationPrice,
    this.startDate,
    this.endDate,
    this.coffee,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory RoomReservationsModels.fromJson(Map<String, dynamic> json) {
    return RoomReservationsModels(
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      room: json['room'] == null
          ? null
          : Room.fromJson(json['room'] as Map<String, dynamic>),
      plan: json['plan'] == null
          ? null
          : Plan.fromJson(json['plan'] as Map<String, dynamic>),
      seatCount: json['seatCount'] as int?,
      totalPrice: (json['totalPrice'] as num?) as num,
      reservationPaid: json['reservationPaid'] as bool?,
      coffeePaid: json['coffeePaid'] as bool?,
      extraPaid: json['extraPaid'] as bool?,
      coffeePrice: json['coffeePrice'] as num?,
      extraPrice: json['extraPrice'] as num?,
      reservationPrice: (json['reservationPrice'] as num?) as num,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      coffee: (json['coffee'] as List<dynamic>?)
          ?.map((e) => Coffee.fromJson(e as Map<String, dynamic>))
          .toList(),
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
        'user': user?.toJson(),
        'room': room?.toJson(),
        'plan': plan?.toJson(),
        'seatCount': seatCount,
        'totalPrice': totalPrice,
        'reservationPaid': reservationPaid,
        'coffeePaid': coffeePaid,
        'extraPaid': extraPaid,
        'coffeePrice': coffeePrice,
        'extraPrice': extraPrice,
        'reservationPrice': reservationPrice,
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
        'coffee': coffee?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
