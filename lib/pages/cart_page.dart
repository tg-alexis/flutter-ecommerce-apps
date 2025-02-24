import 'package:e_commerce_apps/components/cart_item.dart';
import 'package:e_commerce_apps/components/text_with_variables.dart';
import 'package:e_commerce_apps/models/cart.dart';
import 'package:e_commerce_apps/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Scaffold(
            backgroundColor: Colors.grey[300]!,
            body: SafeArea(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "My Cart (${value.getTotalItems()})",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(Icons.shopping_cart, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.getUserCartItems().length,
                      itemBuilder: (context, index) {
                        Shoe individualShoe = value.getUserCartItems()[index];
                        return CartItem(shoe: individualShoe);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        right: 25.0,
                        top: 15,
                        bottom: 15,
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextComportWithVariable(
                                label: 'Livraison',
                                name: '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextComportWithVariable(
                                label: '\$0.00',
                                name: '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Total',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' TVA Incluse',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '\$${value.getTotalPrice().toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => PaymentPage(),
                              //   ),
                              // );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: Colors.black),
                              child: Center(
                                child: Text(
                                  "Commander",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: SizedBox(
                              height: 30,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  spacing: 1,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'lib/images/icons/apple_pay.png',
                                      width: 50,
                                    ),
                                    Image.asset(
                                      'lib/images/icons/google_pay.png',
                                      width: 50,
                                    ),
                                    Image.asset(
                                      'lib/images/icons/visa.png',
                                      width: 50,
                                    ),
                                    Image.asset(
                                      'lib/images/icons/mastercard.png',
                                      width: 50,
                                    ),
                                    Image.asset(
                                      'lib/images/icons/amex.png',
                                      width: 50,
                                    ),
                                    Image.asset(
                                      'lib/images/icons/pay_pal.png',
                                      width: 50,
                                    ),
                                    Image.asset(
                                      'lib/images/icons/klarna.png',
                                      width: 50,
                                    ),
                                    Image.asset(
                                      'lib/images/icons/facebook_pay.png',
                                      width: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // const SizedBox(height: 1500),
                ],
              ),
            ),
          ),
    );
  }
}
