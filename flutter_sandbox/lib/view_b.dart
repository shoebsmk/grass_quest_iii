import 'package:flutter/material.dart';

class ViewB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Screen'),
      ),
      body: const Center(
        child: Text(
          'This is a B widget!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
