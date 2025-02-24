import 'package:e_commerce_apps/models/payment_method.dart';
import 'package:flutter/material.dart';

class PaymentMethodList extends ChangeNotifier {
  List<PaymentMethod> paymentList = [
    PaymentMethod(
      id: 1,
      name: 'Apple Pay',
      picture: 'lib/images/icons/apple_pay.png',
    ),
    PaymentMethod(
      id: 2,
      name: 'Google Pay',
      picture: 'lib/images/icons/google_pay.png',
    ),
    PaymentMethod(id: 3, name: 'Visa', picture: 'lib/images/icons/visa.png'),
    PaymentMethod(
      id: 4,
      name: 'Mastercard',
      picture: 'lib/images/icons/mastercard.png',
    ),
    PaymentMethod(
      id: 5,
      name: 'American Express',
      picture: 'lib/images/icons/amex.png',
    ),
    PaymentMethod(
      id: 6,
      name: 'PayPal',
      picture: 'lib/images/icons/pay_pal.png',
    ),
    PaymentMethod(
      id: 7,
      name: 'Klarna',
      picture: 'lib/images/icons/klarna.png',
    ),
    PaymentMethod(
      id: 8,
      name: 'Facebook Pay',
      picture: 'lib/images/icons/facebook_pay.png',
    ),
  ];
}
