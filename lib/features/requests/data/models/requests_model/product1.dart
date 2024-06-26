class Product1 {
  String? id;
  String? cover;
  String? title;
  num? price;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;

  Product1({
    this.id,
    this.cover,
    this.title,
    this.price,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Product1.fromJson(Map<String, dynamic> json) => Product1(
        id:json['_id'] == null
            ? null
            : json['_id'] as String?,
        cover:json['cover'] == null
            ? null
            : json['cover'] as String?,
        title:json['title'] == null
            ? null
            : json['title'] as String?,
        price:json['price']  == null
            ? null
            : json['price'] as num?,
        type: json['type'] == null
            ? null
            :json['type'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] == null
            ? null
            : json['__v'] as num?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'cover': cover,
        'title': title,
        'price': price,
        'type': type,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
