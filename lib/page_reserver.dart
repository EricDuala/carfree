// ignore_for_file: unused_local_variable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:yoga/base_de_donnees/CreateBD.dart';
import 'package:yoga/constant.dart';
import 'package:yoga/creationAnnonce/dashboard/dashboard.dart';
import 'package:yoga/detail.dart';
import 'package:yoga/vehicule_card.dart';

class ReserverAnnonce extends StatelessWidget {
  const ReserverAnnonce({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          const SearchSection(),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          Expanded(
              child: Stack(
            children: <Widget>[
              // Our background
              Container(
                margin: const EdgeInsets.only(top: 70),
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              ListView.builder(
                // here we use our demo procuts list
                itemCount: vehicules.length,
                itemBuilder: (context, index) => VehiculeCard(
                  itemIndex: index,
                  vehicule: vehicules[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: vehicules[index],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
