import 'package:get/get.dart';
import 'package:test_app/models/cart_model.dart';
import 'package:test_app/models/product_model.dart';

class CartViewModel extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addToCart(Product product) {
    cartItems.add(CartItem(product: product));
  }
}



// import 'package:get/get.dart';
// import 'package:test_app/models/product_model.dart';

// class CartViewModel extends GetxController {
//   var cartItems = <CartItem>[].obs;

//   void addToCart(Product product) {
//     // Check if the product is already in the cart
//     var index = cartItems.indexWhere((item) => item.product.id == product.id);
//     if (index == -1) {
//       // If product is not in the cart, add it
//       cartItems.add(CartItem(product: product));
//     } else {
//       // If product is already in the cart, increase the quantity
//       cartItems[index].quantity++;
//     }
//   }

//   void removeFromCart(Product product) {
//     cartItems.removeWhere((item) => item.product.id == product.id);
//   }

//   void incrementQuantity(CartItem item) {
//     item.quantity++;
//     cartItems.refresh(); // Manually refresh to notify observers
//   }

//   void decrementQuantity(CartItem item) {
//     if (item.quantity > 1) {
//       item.quantity--;
//     } else {
//       cartItems.remove(item); // Remove item if quantity becomes zero
//     }
//     cartItems.refresh(); // Manually refresh to notify observers
//   }

//   double get totalPrice {
//     return cartItems.fold(0, (sum, item) => sum + item.product.price * item.quantity);
//   }
// }
