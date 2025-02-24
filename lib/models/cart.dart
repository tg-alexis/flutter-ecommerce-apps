import 'package:e_commerce_apps/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // List of shoes for sale
  List<Shoe> shoes = [
    Shoe(
      id: 1,
      name: 'Nike Air Max 90',
      price: 299.99,
      picture: 'lib/images/nike-1.jpg',
      description:
          'The Nike Air Max 90 stays true to its OG roots with its iconic Waffle outsole, stitched overlays and classic, color-accented TPU plates. Retro colors celebrate the first generation while Max Air cushioning adds comfort to your journey.',
    ),
    Shoe(
      id: 2,
      name: 'Nike Air Max 2090',
      price: 799.99,
      picture: 'lib/images/nike-2.jpg',
      description:
          'Bring the past into the future with the Nike Air Max 2090, a bold look inspired by the DNA of the iconic Air Max 90. Brand-new Nike Air cushioning underfoot adds unparalleled comfort while transparent mesh and vibrantly colored textile on select colorways blend with timeless OG features for an edgy, modernized look.',
    ),
    // 10 elements
    Shoe(
      id: 3,
      name: 'Nike Air Max 90',
      price: 299.99,
      picture: 'lib/images/nike-3.jpg',
      description:
          'The Nike Air Max 90 stays true to its OG roots with its iconic Waffle outsole, stitched overlays and classic, color-accented TPU plates. Retro colors celebrate the first generation while Max Air cushioning adds comfort to your journey.',
    ),
    Shoe(
      id: 4,
      name: 'Nike Air Max 95',
      price: 399.99,
      picture: 'lib/images/nike-4.jpg',
      description:
          'The Nike Air Max 95 made its mark as the first shoe to include visible Nike Air cushioning in the forefoot. The Nike Air Max 95 OG celebrates the icon\'s bold, disruptive spirit with a mix of materials that draw inspiration from the original.',
    ),
    Shoe(
      id: 5,
      name: 'Nike Air Max 97',
      price: 499.99,
      picture: 'lib/images/nike-5.jpg',
      description:
          'The Nike Air Max 97 keeps a sneaker icon going strong with the same design details that made it famous: water-ripple lines, reflective piping and full-length Max Air cushioning.',
    ),
    Shoe(
      id: 6,
      name: 'Nike Air Max 270',
      price: 599.99,
      picture: 'lib/images/nike-6.jpg',
      description:
          'The Nike Air Max 270 delivers visible air under every step. Updated for modern comfort, it nods to the original, 1991 Air Max 180 with its exaggerated tongue top and heritage tongue logo.',
    ),
    Shoe(
      id: 7,
      name: 'Nike Air Max 720',
      price: 699.99,
      picture: 'lib/images/nike-7.jpg',
      description:
          'The Nike Air Max 720 goes bigger than ever before with Nike\'s tallest Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.',
    ),
    Shoe(
      id: 8,
      name: 'Nike Air Max 2090',
      price: 799.99,
      picture: 'lib/images/nike-8.jpg',
      description:
          'Bring the past into the future with the Nike Air Max 2090, a bold look inspired by the DNA of the iconic Air Max 90. Brand-new Nike Air cushioning underfoot adds unparalleled comfort while transparent mesh and vibrantly colored textile on select colorways blend with timeless OG features for an edgy, modernized look.',
    ),
    Shoe(
      id: 9,
      name: 'Nike Air Max 95',
      price: 399.99,
      picture: 'lib/images/nike-9.jpg',
      description:
          'The Nike Air Max 95 made its mark as the first shoe to include visible Nike Air cushioning in the forefoot. The Nike Air Max 95 OG celebrates the icon\'s bold, disruptive spirit with a mix of materials that draw inspiration from the original.',
    ),
    Shoe(
      id: 10,
      name: 'Nike Air Max 97',
      price: 499.99,
      picture: 'lib/images/nike-10.jpg',
      description:
          'The Nike Air Max 97 keeps a sneaker icon going strong with the same design details that made it famous: water-ripple lines, reflective piping and full-length Max Air cushioning.',
    ),
  ];

  // list of items in user cart
  List<Shoe> cartItems = [];

  // get list of shoe for sale
  List<Shoe> getShoes() {
    return shoes;
  }

  // get cart items
  List<Shoe> getUserCartItems() {
    return cartItems;
  }

  // add shoe to cart
  void addItemToCart(Shoe shoe) {
    var position = cartItems.indexOf(shoe);

    if (position == -1) {
      shoe.qte = 1;
      shoe.totalAmount = shoe.price;
      cartItems.add(shoe);
    } else {
      int qte = getQuantity(shoe) + 1;
      cartItems[position].qte = qte;
      cartItems[position].totalAmount = getItemTotalAmount(shoe);
    }

    notifyListeners();
  }

  // remove shoe from cart
  void removeItemFromCart(Shoe shoe) {
    cartItems.remove(shoe);
    notifyListeners();
  }

  bool isProductInCart(Shoe product) =>
      getUserCartItems()
          .where((element) => element.id == product.id)
          .isNotEmpty;

  // get total price of items in cart
  double getTotalPrice() {
    double total = 0.0;
    for (Shoe shoe in cartItems) {
      total += shoe.totalAmount ?? 0.0;
    }
    return total;
  }

  double getItemTotalAmount(Shoe shoe) {
    return shoe.price * (shoe.qte ?? 1);
  }

  // get total number of items in cart
  int getTotalItems() {
    int total = 0;
    for (Shoe shoe in cartItems) {
      total += (shoe.qte ?? 1);
    }
    return total;
  }

  // check item quantity in cart
  int getQuantity(Shoe shoe) {
    var position = cartItems.indexOf(shoe);
    return cartItems[position].qte ?? 1;
  }

  // check if element is in cart
  bool isInCart(Shoe shoe) {
    return cartItems.contains(shoe);
  }

  // inscrease quantity of item in cart
  void increaseQuantity(Shoe shoe) {
    var position = cartItems.indexOf(shoe);
    int qte = getQuantity(shoe) + 1;
    cartItems[position].qte = qte;
    cartItems[position].totalAmount = getItemTotalAmount(shoe);
    notifyListeners();
  }

  // decrease quantity of item in cart
  void decreaseQuantity(Shoe shoe) {
    var position = cartItems.indexOf(shoe);
    int qte = getQuantity(shoe) - 1;
    if (qte == 0) {
      removeItemFromCart(shoe);
    } else {
      cartItems[position].qte = qte;
      cartItems[position].totalAmount = getItemTotalAmount(shoe);
    }
    notifyListeners();
  }
}
