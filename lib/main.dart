import 'package:e_commerce_apps/models/cart.dart';
import 'package:e_commerce_apps/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
          home: const IntroPage(title: 'Flutter Demo Home Page'),
          builder: FToastBuilder(),
        );
      },
    );
  }
}
