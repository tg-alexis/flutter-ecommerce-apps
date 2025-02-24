import 'package:e_commerce_apps/components/shoes_tile.dart';
import 'package:e_commerce_apps/models/cart.dart';
import 'package:e_commerce_apps/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FToast fToast = FToast();
  @override
  void initState() {
    super.initState();

    fToast.init(context);
  }

  void _addShoeToCard(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    _showToast(shoe.name);
  }

  _showToast(String name) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(width: 23),
          Text('$name added to cart'),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Column(
            spacing: 25,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Search', style: TextStyle(color: Colors.grey)),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  "Everyone flies...some  fly longer than others",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Hot Pick 🔥",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: value.getShoes().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Shoe shoe = value.getShoes()[index];
                    return ShoesTile(
                      shoe: shoe,
                      onTap: () => _addShoeToCard(shoe),
                    );
                  },
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Divider(color: Colors.white),
              ),
            ],
          ),
    );
  }
}
