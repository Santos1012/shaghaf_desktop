import 'product.dart';
import 'user.dart';

class RequestsModel {
  String? id;
  User? user;
  List<Product>? products;
  num? totalPrice;
  bool? paid;
  DateTime? startDate;
  DateTime? endDate;
  num? pointDiscount;
  num? stuffDiscount;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;

  RequestsModel({
    this.id,
    this.user,
    this.products,
    this.totalPrice,
    this.paid,
    this.startDate,
    this.endDate,
    this.pointDiscount,
    this.stuffDiscount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory RequestsModel.fromJson(Map<String, dynamic> json) => RequestsModel(
        id: json['_id'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPrice: json['totalPrice'] as num?,
        paid: json['paid'] as bool?,
        startDate: json['startDate'] == null
            ? null
            : DateTime.parse(json['startDate'] as String),
        endDate: json['endDate'] == null
            ? null
            : DateTime.parse(json['endDate'] as String),
        pointDiscount: json['pointDiscount'] as num?,
        stuffDiscount: json['stuffDiscount'] as num?,
        status: json['status'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as num?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user?.toJson(),
        'products': products?.map((e) => e.toJson()).toList(),
        'totalPrice': totalPrice,
        'paid': paid,
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
        'pointDiscount': pointDiscount,
        'stuffDiscount': stuffDiscount,
        'status': status,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
