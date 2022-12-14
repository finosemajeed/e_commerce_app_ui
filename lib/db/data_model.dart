import 'package:e_comerce_app_ui/db/db.dart';

final productDetails = productData.map((product) {
  return DataModel.fromJson(product);
}).toList();

class DataModel {
  int? id;
  String? category;
  String? productName;
  double? productPrice;
  String? productImage;
  String? productDetails;
  double? rating;

  DataModel({
    this.id,
    this.category,
    this.productName,
    this.productPrice,
    this.productImage,
    this.productDetails,
    this.rating,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json['id'] as int?,
        category: json['category'] as String?,
        productName: json['productName'] as String?,
        productPrice: (json['productPrice'] as num?)?.toDouble(),
        productImage: json['productImage'] as String?,
        productDetails: json['productDetails'] as String?,
        rating: (json['rating'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'productName': productName,
        'productPrice': productPrice,
        'productImage': productImage,
        'productDetails': productDetails,
        'rating': rating,
      };
}
