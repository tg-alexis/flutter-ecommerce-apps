import 'package:e_commerce_apps/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  final String title;
  const IntroPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // linear gradient
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('lib/images/logo-nike.png', width: 200),
              ),
              const SizedBox(height: 24),
              // title
              Text(
                "Just do it",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // description
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                child: Text(
                  "Brand new collection of shoes for running, training, and more.",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 48),
              GestureDetector(
                onTap:
                    () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: Center(
                    child: Text(
                      "Shop now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
