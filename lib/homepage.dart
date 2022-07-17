import 'package:flutter/material.dart';
import 'package:universal_app/app/homeplay.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homeplay(),
    );
  }
}
