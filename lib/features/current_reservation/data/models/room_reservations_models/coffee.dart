class Coffee {
  String? product;
  int? count;
  String? id;

  Coffee({this.product, this.count, this.id});

  factory Coffee.fromJson(Map<String, dynamic> json) => Coffee(
        product: json['product'] as String?,
        count: json['count'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product': product,
        'count': count,
        '_id': id,
      };
}
