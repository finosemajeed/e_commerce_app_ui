import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:e_comerce_app_ui/db/product_repository.dart';
import 'package:e_comerce_app_ui/infrastructure/cart_screen/cart_screen_helper.dart';
import 'package:e_comerce_app_ui/infrastructure/favourite_screen/favourite_screen_helper.dart';

class FetchProduct {
  Future<List<Products>> cartProduct() async {
    var productList = ProductRepository.fetchProducts();
    var cartIds = await CartHelper().allCartItemsList;
    final cartProducts =
        productList.where((element) => cartIds!.contains(element.id)).toList();
    return cartProducts;
  }

  Future<List<Products>> favouriteProduts() async {
    var productList = ProductRepository.fetchProducts();
    var favouriteItems =
        await FavouriteScreenHelper().usersFavouriteProductsList;
    final newlist = favouriteItems.cast<String>();
    final favourite = productList
        .where((element) => newlist.contains('${element.id}'))
        .toList();
    return favourite;
  }

  List<Products> allProducts() {
    final allProducts = ProductRepository.fetchProducts();
      return allProducts;
  }
}