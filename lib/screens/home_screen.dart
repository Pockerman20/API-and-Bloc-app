import 'package:api_project/screens/product_screen.dart';
import 'package:flutter/material.dart';

import 'user_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text(
                "Get Users",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserScreen(),
                    ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              child: const Text(
                "Get Products",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
