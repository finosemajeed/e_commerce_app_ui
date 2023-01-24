import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Cart extends Equatable {
  const Cart({this.items = const <Products>[]});

  final List<Products> items;

  double get totalPrice =>
      items.fold(0, (total, current) => total + current.price!.toDouble());

  @override
  List<Object> get props => [items];
}
