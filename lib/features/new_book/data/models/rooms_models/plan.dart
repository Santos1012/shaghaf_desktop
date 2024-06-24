class RoomPlan {
  String? id;
  String? icon;
  int? price;
  String? stamp;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  RoomPlan({
    this.id,
    this.icon,
    this.price,
    this.stamp,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory RoomPlan.fromJson(Map<String, dynamic> json) => RoomPlan(
        id: json['_id'] as String?,
        icon: json['icon'] as String?,
        price: json['price'] as int?,
        stamp: json['stamp'] as String?,
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
        'icon': icon,
        'price': price,
        'stamp': stamp,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
