import 'package:flutter/material.dart';
import 'package:shop_getx/controller/cart_controller.dart';
import 'package:shop_getx/pages/home.dart';

import 'package:shop_getx/utilities/widgets.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: buildAppBar(),
      body: Obx(
        () => _cartController.loading.value
            ? const Center(child: CircularProgressIndicator(color: Colors.amber,),)
            : Stack(
                children: [
                  Positioned.fill(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _cartController.cartItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 5, top: 5),
                            height: 100,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.5),
                                offset: const Offset(3, 2),
                                blurRadius: 7,
                              ),
                            ]),
                           
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                            _cartController.cartItems[index]
                                                ["product"]["image"]),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                   padding: const EdgeInsets.all(10.0),
                                    color: Colors.amber,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _cartController.cartItems[index]
                                              ["product"]["title"],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "\$${_cartController.cartItems[index]["product"]["price"]}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                /* const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 70,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.remove),
                                          iconSize: 20,
                                        ),
                                      ),
                                      Text(
                                        _cartController.cartItems[index]
                                                ["quantity"]
                                            .toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.add),
                                          iconSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ) */
                              ],
                            ),
                          );
                        }),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Card(
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.all(12),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Subtotal',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "\$${_cartController.subtotal.toString()}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text('Subtotal does not include shipping')
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        color: Colors.amber),
                                    child: TextButton(
                                      style: ButtonStyle(
                                        overlayColor:
                                            MaterialStateProperty.resolveWith(
                                          (states) => Colors.black12,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Check out',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 50,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        color: Colors.grey),
                                    child: TextButton(
                                      style: ButtonStyle(
                                        overlayColor:
                                            MaterialStateProperty.resolveWith(
                                          (states) => Colors.black12,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.to(HomeView());
                                      },
                                      child: const Text(
                                        'Continue Shopping',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
