// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class suivant extends StatelessWidget {
  const suivant({super.key, required this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.blueAccent, borderRadius: BorderRadius.circular(8)),
          child: const Center(
              child: Text(
            'Suivant',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )),
        ));
  }
}
