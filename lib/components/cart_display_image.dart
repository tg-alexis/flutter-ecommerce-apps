import 'package:e_commerce_apps/components/cart_item.dart';
import 'package:flutter/material.dart';

class CartDisplayImage extends StatelessWidget {
  const CartDisplayImage({super.key, required this.widget});

  final CartItem widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.shoe.picture),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
      ),
    );
  }
}
