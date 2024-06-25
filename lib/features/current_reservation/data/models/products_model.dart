class ProductsModel {
  String? id;
  String? category;
  int? price;
  String? title;
  int? count;
  String? cover;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProductsModel({
    this.id,
    this.category,
    this.price,
    this.title,
    this.count,
    this.cover,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json['_id'] as String?,
        category: json['category'] as String?,
        price: json['price'] as int?,
        title: json['title'] as String?,
        count: json['count'] as int?,
        cover: json['cover'] as String?,
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
        'category': category,
        'price': price,
        'title': title,
        'count': count,
        'cover': cover,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
