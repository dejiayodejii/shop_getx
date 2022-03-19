// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shop_getx/controller/category_controller.dart';

import 'package:get/get.dart';
import 'package:shop_getx/pages/cart_screen.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CategoryController _categoryController = Get.put(CategoryController());
  int? selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text('My Shop', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
          IconButton(
              onPressed: () {
                Get.to(CartScreen());
              },
              icon: Icon(Icons.shopping_cart_outlined)),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cloths',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down)),
                      ]),
                ),
              ),
              IconButton(
                onPressed: () {
                  _categoryController.toggleGrid();
                },
                icon: Icon(Icons.grid_view),
              ),
            ],
          ),
          Obx(
            () => _categoryController.loading2.value
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    ),
                  )
                : category(),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => _categoryController.loading.value
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    ),
                  )
                : Expanded(
                    child: _categoryController.showGrid.value
                        ? gridViewProduct()
                        : listViewProduct(),
                  ),
          )
        ]),
      ),
    );
  }

  Container category() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      //color: Colors.green,
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categoryController.categories.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            _categoryController.selectedCategoryIndex.value = index;
            _categoryController.fetchProducts();
            setState(() {
              selectedCategory = index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color:
                  index == selectedCategory ? Colors.amber : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              _categoryController.categories[index],
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListView listViewProduct() {
    return ListView.builder(
        itemCount: _categoryController.product.length,
        itemBuilder: (context, index) => Container(
              height: 120,
              //width: 100,
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    offset: Offset(3, 2),
                    blurRadius: 7)
              ]),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      //color: Colors.green,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              _categoryController.product[index]['image']),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _categoryController.product[index]['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _categoryController.product[index]['description'],
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '\$${_categoryController.product[index]['price']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
  }

  GridView gridViewProduct() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.79, crossAxisCount: 2),
        itemCount: _categoryController.product.length,
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            margin: EdgeInsets.only(bottom: 8, right: 4, left: 4),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7,
              ),
            ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            _categoryController.product[index]['image']),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    color: Colors.amber,
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _categoryController.product[index]['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _categoryController.product[index]['description'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '\$${_categoryController.product[index]['price']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
