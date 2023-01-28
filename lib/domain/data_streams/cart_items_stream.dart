import 'package:e_comerce_app_ui/domain/data_streams/data_stream.dart';
import 'package:e_comerce_app_ui/infrastructure/cart_screen/cart_screen_helper.dart';

class CartItemsStream extends DataStream<List<String>> {
  @override
  void reload() {
    final allProductsFuture = CartHelper().allCartItemsList;
    allProductsFuture.then((favProducts) {
      addData(favProducts!.cast<String>());
    }).catchError((e) {
      addError(e);
    });
  }
}
