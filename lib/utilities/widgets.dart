// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_getx/pages/cart_screen.dart';
import 'package:shop_getx/pages/home.dart';

 AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text('My Shop', style: TextStyle(color: Colors.black)),
      centerTitle: true,
      leading: IconButton(onPressed: () {
        Get.to(HomeView());
      }, icon: Icon(Icons.arrow_back)),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
        IconButton(onPressed: () {
          Get.to(CartScreen());
          
        }, icon: Icon(Icons.shopping_cart_outlined)),
      ],
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  