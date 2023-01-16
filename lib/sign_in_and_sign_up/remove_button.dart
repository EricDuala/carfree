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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.only(left: 120, right: 120),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(8)),
          child: const Center(
              child: Text(
            'supprimer',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )),
        ));
  }
}
