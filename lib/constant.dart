import 'package:flutter/material.dart';

const baseUrl = 'http://10.113.213.105:8000/api';
const registerUrl = '$baseUrl/enregistrer';
const loginUrl = '$baseUrl/connexion';
const userUrl = '$baseUrl/user';
const logoutUrl = '$baseUrl/logout';
const vehiculeUrl = '$baseUrl/vehicule';
const annonceUrl = '$baseUrl/annonce';
const rechercherUrl = '$baseUrl/rechercher';
const reserverUrl = '$baseUrl/reserver/{id}';
const forgotUrl = '$baseUrl/forgot';
const resetUrl = '$baseUrl/reset';
const estActifUrl = '$baseUrl/estActif/{id}';
const updateAnnonceUrl = '$baseUrl/update/{id}';
const destroyAnnonceUrl = '$baseUrl/destroy/{id}';
const showAnnonceUrl = '$baseUrl/showAnnonce';

const serverError = 'Server error';
const unAuthorizided = 'unAuthorizided';
const someThingWentWrong = 'Something Went Wrong, try again!';

const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF035AA6);
const kSecondaryColor = Color(0xFF000839);
const kTextColor = Color(0xFFFFA418);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);
const kDefaultPadding = 20.0;
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12,
);
