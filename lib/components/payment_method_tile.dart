import 'package:e_commerce_apps/models/payment_method.dart';
import 'package:flutter/material.dart';

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethod paymentMethod;
  const PaymentMethodTile({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Image.asset(paymentMethod.picture, width: 50)],
      ),
    );
  }
}
