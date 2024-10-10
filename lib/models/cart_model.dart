import 'package:test_app/models/product_model.dart';

class CartItem {
  Product? product;
  int? quantity;

  CartItem({this.product, this.quantity = 1});
}
