import 'amenity.dart';
import 'attachment.dart';
import 'plan.dart';

class RoomsModels {
  String? id;
  String? cover;
  List<Attachment>? attachments;
  String? title;
  String? description;
  int? seatsNum;
  int? seatsAvailable;
  String? location;
  List<RoomPlan>? plans;
  String? type;
  List<Amenity>? amenities;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  RoomsModels({
    this.id,
    this.cover,
    this.attachments,
    this.title,
    this.description,
    this.seatsNum,
    this.seatsAvailable,
    this.location,
    this.plans,
    this.type,
    this.amenities,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory RoomsModels.fromJson(Map<String, dynamic> json) => RoomsModels(
        id: json['_id'] as String?,
        cover: json['cover'] as String?,
        attachments: (json['attachments'] as List<dynamic>?)
            ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
            .toList(),
        title: json['title'] as String?,
        description: json['description'] as String?,
        seatsNum: json['seatsNum'] as int?,
        seatsAvailable: json['seatsAvailable'] as int?,
        location: json['location'] as String?,
        plans: (json['plans'] as List<dynamic>?)
            ?.map((e) => RoomPlan.fromJson(e as Map<String, dynamic>))
            .toList(),
        type: json['type'] as String?,
        amenities: (json['amenities'] as List<dynamic>?)
            ?.map((e) => Amenity.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'cover': cover,
        'attachments': attachments?.map((e) => e.toJson()).toList(),
        'title': title,
        'description': description,
        'seatsNum': seatsNum,
        'seatsAvailable': seatsAvailable,
        'location': location,
        'plans': plans?.map((e) => e.toJson()).toList(),
        'type': type,
        'amenities': amenities?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
