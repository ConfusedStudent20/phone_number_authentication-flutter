import 'package:flutter/material.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dash Screen'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/homeScreen');
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/mountain.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
