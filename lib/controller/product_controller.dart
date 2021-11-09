/* // ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:shop_getx/services/Product_Api.dart';

class ProductController extends GetxController {
  List product = [].obs;
  RxBool loading = false.obs;
  RxBool showGrid = false.obs;
  ProductApi productApi = ProductApi();
  RxInt selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    loading.value = true;
    product = await productApi.loadProductsFromApi();
    loading.value = false;
    print(product);
  }

  void toggleGrid() {
    showGrid.value = !showGrid.value;
  }
}
 */