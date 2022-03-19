// ignore_for_file: file_names, avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shop_getx/model/cart_model.dart';

class ProductApi {
  var url = "https://fakestoreapi.com/products/category/";
  var url2 = "https://fakestoreapi.com/products/categories";
  var url3 = "https://fakestoreapi.com/carts";
  var url4 = "https://fakestoreapi.com/carts/1";
  var purl = "https://fakestoreapi.com/products/";

  loadProductsFromApi(String categoryName) async {
    var response = await http.get(Uri.parse(url + categoryName));
    return json.decode(response.body);
  }

  loadCategoriesFromApi() async {
    var response = await http.get(Uri.parse(url2));
    return json.decode(response.body);
  }

  Future<List<Products>> loadCartFromApi() async {
    List<Products> items = [];
    var response = await http.get(Uri.parse(url4));
    var productsJson = json.decode(response.body);
    var pro = productsJson["products"];
    for (var i in pro) {
      items.add(Products.fromJson(i));
    }
    return items;
  }

  Future getProductFromApi(productId) async {
    var response = await http.get(Uri.parse(purl + productId.toString()));
    return json.decode(response.body);
  }
}
