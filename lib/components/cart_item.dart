import 'package:e_commerce_apps/components/cart_display_image.dart';
import 'package:e_commerce_apps/components/text_with_variables.dart';
import 'package:e_commerce_apps/models/cart.dart';
import 'package:e_commerce_apps/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;
  const CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void _removeShoeFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  void _increaseShoeQte() {
    Provider.of<Cart>(context, listen: false).increaseQuantity(widget.shoe);
  }

  void _decreaseShoeQte() {
    Provider.of<Cart>(context, listen: false).decreaseQuantity(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CartDisplayImage(widget: widget),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 8),
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.shoe.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 16,
                            ),
                            onPressed: _removeShoeFromCart,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComportWithVariable(
                            label: 'Prix : ',
                            name:
                                '\$${widget.shoe.totalAmount?.toStringAsFixed(2) ?? 0}',
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextComportWithVariable(
                            label: 'Qte : ',
                            name: '${widget.shoe.qte ?? 1}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.grey,
                                ),
                                onPressed: _decreaseShoeQte,
                              ),
                              Text(
                                '${widget.shoe.qte ?? 1}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add, color: Colors.grey),
                                onPressed: _increaseShoeQte,
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
          ],
        ),
      ),
    );
  }
}
