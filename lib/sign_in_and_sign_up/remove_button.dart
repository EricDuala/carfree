// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class remove_button extends StatelessWidget {
  const remove_button({super.key, required this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.only(left: 170),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 182, 12, 0),
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
              child: Text(
            'supprimer',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )),
        ));
  }
}
