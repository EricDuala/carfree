// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class add_button extends StatelessWidget {
  const add_button({super.key, required this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.only(left: 50),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 82, 150),
              borderRadius: BorderRadius.circular(8)),
          child: const Center(
              child: Text(
            'reserver',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )),
        ));
  }
}
