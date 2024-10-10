import 'package:get/get.dart';
import 'package:test_app/models/product_model.dart';
import 'package:test_app/services/remote_services.dart';

class ProductViewModel extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var products = await RemoteServices.fetchProducts();
    if (products != null) {
      productList.value = products;
    }
  }
}
