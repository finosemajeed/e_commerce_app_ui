import 'package:e_comerce_app_ui/domain/data_streams/data_stream.dart';
import 'package:e_comerce_app_ui/infrastructure/favourite_screen/favourite_screen_helper.dart';

class FavouriteProductsStream extends DataStream<List<String>> {
  @override
  void reload() {
    final favProductsFuture =
        FavouriteScreenHelper().usersFavouriteProductsList;
    favProductsFuture.then((favProducts) {
      addData(favProducts.cast<String>());
    }).catchError((e) {
      addError(e);
    });
  }
}
