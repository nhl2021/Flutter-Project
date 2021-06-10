import 'package:flutter/material.dart';

class Consultation {
  String date ;



  String imageurl;

  Consultation(
      {
        @required this.date,

      });

}
List<Consultation> listConsultation= [
  Consultation(
    date:'20-04-2021'

  ),
  Consultation(
    date:'21-04-2021'
  ),
];