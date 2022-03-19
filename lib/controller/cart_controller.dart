// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:shop_getx/model/cart_model.dart';
import 'package:shop_getx/services/product_Api.dart';

class CartController extends GetxController {
  ProductApi productApi = ProductApi();
  List cartItems = [];
  var subtotal = 0.0.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    loadCartFromApi();
    super.onInit();
  }

  loadCartFromApi() async {
    loading.value = true;
    List<Products> pro = [];
    pro.addAll(await productApi.loadCartFromApi());
    print(pro);
    for (var i in pro) {
      var product = await productApi.getProductFromApi(i.productId);
      var quantity = i.quantity;
      subtotal(subtotal.value + product['price'] * quantity);
      cartItems.add({"product": product, "quantity": quantity});
      print(cartItems);
      print(subtotal);
    }
    loading.value = false;
  }
}
