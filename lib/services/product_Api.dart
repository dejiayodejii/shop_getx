// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductApi {
  var url = "https://fakestoreapi.com/products/category/";
  var url2 = "https://fakestoreapi.com/products/categories";
  

  loadProductsFromApi(String categoryName) async {
    var response = await http.get(Uri.parse(url+ categoryName));
    return json.decode(response.body);
  }

  loadCategoriesFromApi() async {
    var response = await http.get(Uri.parse(url2));
    return json.decode(response.body);
  }

}
