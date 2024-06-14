import 'detail.dart';

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
        id: json['_id'] as String?,
        title: json['title'] as String?,
        details: (json['details'] as List<dynamic>?)
            ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
            .toList(),
        price: json['price'] as int?,
        duration: json['duration'] as int?,
        durationType: json['durationType'] as String?,
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
        'title': title,
        'details': details?.map((e) => e.toJson()).toList(),
        'price': price,
        'duration': duration,
        'durationType': durationType,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
