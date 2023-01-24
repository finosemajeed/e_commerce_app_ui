import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  static Future<List<Products>> fetchProducts() async {
    try {
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        var data = response.body;
        return productsFromJson(data);
      } else {
        throw Exception('failed to load post');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
