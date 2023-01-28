import 'package:e_comerce_app_ui/domain/model/model.dart';

class CartItem extends Model {
  // ignore: constant_identifier_names
  static const String PRODUCT_ID_KEY = "product_id";
  // ignore: constant_identifier_names
  static const String ITEM_COUNT_KEY = "item_count";

  final int itemCount;
  const CartItem({String? id, this.itemCount = 0}) : super(id);
  //  : super(id!);

  factory CartItem.fromMap(Map<String, dynamic> map, {String? id}) {
    return CartItem(
      id: id!,
      itemCount: map[ITEM_COUNT_KEY],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      PRODUCT_ID_KEY: id,
      ITEM_COUNT_KEY: itemCount,
    };
    return map;
  }

  @override
  Map<String, dynamic> toUpdateMap() {
    final map = <String, dynamic>{};
    map[ITEM_COUNT_KEY] = itemCount;
    return map;
  }
}
