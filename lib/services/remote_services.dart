import 'package:http/http.dart' as http;
import 'package:test_app/models/product_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var Response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (Response.statusCode == 200) {
      var json = Response.body;
      return productFromJson(json);
    } else {
      return [];
    }
  }
}
