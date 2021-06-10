import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apprania/model/list.dart';
import 'package:flutter_apprania/services/firestore_services.dart';
import 'package:flutter_apprania/vues/ListC.dart';
import 'package:flutter_apprania/vues/add-consultation.dart';
import 'package:flutter_apprania/vues/modif-patient.dart';
import 'package:provider/provider.dart';

import 'ListP.dart';


class DetailPatient extends StatefulWidget {

  final heroTag;
  var patientId;
  var nom;
  var prenom;
  var email;
  var tel;
  var adr;
  var cin;
  var genre;
  var index;

  DetailPatient(this.heroTag,this.patientId, this.nom, this.prenom,this.email,this.tel, this.adr, this.cin,this.genre, this.index);
  @override
  _DetailPatientState createState() => _DetailPatientState();
}

class _DetailPatientState extends State<DetailPatient> {
   var floatingActionButton;
  @override
  Widget build(BuildContext context) {
    final patients = Provider.of<List<Patient>>(context);
    final firestoreService = FirestoreService();


    return Scaffold(
      backgroundColor: Colors.redAccent,

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color:Colors.white,
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Detail Patient',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 18.0,
            color:Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.create_sharp),
            onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>ModifPatient(widget.patientId,
                  widget.nom, widget.prenom,widget.email,widget.cin,widget.tel, widget.adr,widget.genre
              )),);
            },
            color: Colors.white,
          ),
        ],
      ),

      body: ListView(

                children: [
                  Stack(
                    children: <Widget>[
      Container(
      height: MediaQuery
          .of(context)
          .size
          .height - 82,
      width: MediaQuery
          .of(context)
          .size
          .width,
      color: Colors.transparent,
    ),
    Positioned(
    top: 75.0,
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(45.0),
    topRight: Radius.circular(45.0),
    ),
    color: Colors.white,
    ),
    height: MediaQuery
        .of(context)
        .size
        .height - 100,
    width: MediaQuery
        .of(context)
        .size
        .width,
    )
    ),
    Positioned(
    top: 30,
    left: (MediaQuery
        .of(context)
        .size
        .width / 2) - 100,
    child: Hero(
    tag:widget.heroTag,
    child: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage(widget.heroTag),
    fit: BoxFit.cover,

    )
    ),
    )
    ),
    height: 200,
    width: 200,
    ),
    Positioned(
    top: 200,
    left: 25,
    right: 18,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Center(
    child: Text(widget.nom,
    style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    ),

    ),
    ),
    Center(
    child: Text(widget.prenom,
    style: TextStyle(
    fontSize: 20,
    ),

    ),
    ),

    ]
    ),

    ),
    SizedBox(height: 20,),
    Positioned(
    top: 300,
    left: 25,
    right: 18,

    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Container(
    child: Icon(Icons.email_rounded)
    ),

    Text('Email:',
    style: TextStyle(
    fontSize: 29,
    fontStyle: FontStyle.italic,
    ),
    ),
    Container(
    width: 10.0,
    ),
    Container(
    width: 260,
    child: Text(widget.email,
    style: TextStyle(
    fontSize: 20,
    )),
    )
    ],

    )


    ),
    SizedBox(height: 7.0,),
    Positioned(
    bottom: 300,
    left: 25,

    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[

    Container(
    child: Icon(Icons.call),
    ),

    Text('Télephone:',
    style: TextStyle(
    fontSize: 29,
    fontStyle: FontStyle.italic,
    ),
    ),
    Container(
    width: 10.0,
    ),

    Container(
    width: 260,
    child: Text(widget.tel,
    style: TextStyle(
    fontSize: 20,
    )),
    )
    ],

    )

    ),
    Positioned(
    bottom: 240,
    left: 20,

    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[

    Container(
    child: Icon(Icons.add_location_rounded),
    ),

    Text('Adresse:',
    style: TextStyle(
    fontSize: 29,
    fontStyle: FontStyle.italic,
    ),
    ),
    Container(
    width: 10.0,
    ),

    Container(
    width: 180,
    child: Text(widget.adr,
    style: TextStyle(
    fontSize: 20,
    )),
    )
    ],

    )

    ),
    Positioned(
    bottom: 180,
    left: 20,
    right: 18,

    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[

    Container(
    child: Icon(Icons.art_track_rounded),
    ),

    Text('Cin:',
    style: TextStyle(
    fontSize: 29,
    fontStyle: FontStyle.italic,
    ),
    ),
    Container(
    width: 10.0,
    ),

    Container(
    width: 260,
    child: Text(widget.cin,
    style: TextStyle(
    fontSize: 20,
    )),
    )
    ],

    )

    ),
    Positioned(
    bottom: 120,
    left: 20,

    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[

    Container(
    child: Icon(Icons.family_restroom_rounded),
    ),

    Text('Genre:',
    style: TextStyle(
    fontSize: 29,
    fontStyle: FontStyle.italic,
    ),
    ),
    Container(
    width: 10.0,
    ),

    Container(
    width: 260,
    child: Text(widget.genre,
    style: TextStyle(
    fontSize: 20,
    )),
    )

                    ],
                  )



                      ),
                    ],

                  ),



                ]

            ),

      Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:<Widget> [
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                AddConsultation()),),
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  ListC()),),
          child: Icon(Icons.list),
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
        ),
    ],
      )
    ]
    );







  }
}

