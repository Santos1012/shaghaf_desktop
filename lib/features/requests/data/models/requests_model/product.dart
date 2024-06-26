import 'package:saghaf_desktop/features/requests/data/models/requests_model/product1.dart';

class Product {
  Product1? product;
  num? count;
  String? id;

  Product({this.product, this.count, this.id});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        product: json['product'] == null
            ? null
            : Product1.fromJson(json['product'] as Map<String, dynamic>),
        count: json['count'] as num?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
        'count': count,
        '_id': id,
      };
}
