import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/view/cart/cart_view_model.dart';

class CartView extends StatelessWidget {
  final CartViewModel _cartViewModel = Get.find<CartViewModel>();

  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Obx(() {
        if (_cartViewModel.cartItems.isEmpty) {
          return Center(child: Text("No items in cart"));
        }
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: _cartViewModel.cartItems.length,
                    itemBuilder: (context, index) {
                      var cartItem = _cartViewModel
                          .cartItems[index]; // Get the CartItem object

                      return ListTile(
                        title: Text(cartItem.product!.name),
                      );
                    }))
          ],
        );
      }),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_app/view/cart/cart_view_model.dart';

// class CartView extends StatelessWidget {
//   final CartViewModel cartViewModel = Get.find<CartViewModel>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Cart")),
//       body: Obx(() {
//         if (cartViewModel.cartItems.isEmpty) {
//           return Center(child: Text("No items in cart"));
//         }
//         return Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: cartViewModel.cartItems.length,
//                 itemBuilder: (context, index) {
//                   var item = cartViewModel.cartItems[index];
//                   return ListTile(
//                     title: Text(item.product.name),
//                     subtitle: Text("Quantity: ${item.quantity}"),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.remove),
//                           onPressed: () => cartViewModel.decrementQuantity(item),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.add),
//                           onPressed: () => cartViewModel.incrementQuantity(item),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Text("Total: \$${cartViewModel.totalPrice}"),
//             ElevatedButton(
//               onPressed: () {
//                 // Checkout logic
//               },
//               child: Text("Checkout"),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
