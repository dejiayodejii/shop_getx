// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:shop_getx/services/Product_Api.dart';

class CategoryController extends GetxController{

 List categories = [].obs;
 ProductApi productApi = ProductApi();
 List product = [].obs;
  RxBool loading = false.obs;
  RxBool showGrid = false.obs;
  RxBool loading2 = false.obs;
  
  RxInt selectedCategoryIndex = 0.obs;

@override
  void onInit() {
    fetchCategories();
    super.onInit();
  }


  void fetchCategories() async {
     loading2.value = true;
    categories = await productApi.loadCategoriesFromApi();
    loading2.value = false;
    fetchProducts();
    }
    
  

  void fetchProducts() async {
     if(categories.isNotEmpty){
      loading.value = true;
    product = await productApi.loadProductsFromApi(categories[selectedCategoryIndex.value]);
    loading.value = false;
     }
  }

  void toggleGrid() {
    showGrid.value = !showGrid.value;
  }
  
}