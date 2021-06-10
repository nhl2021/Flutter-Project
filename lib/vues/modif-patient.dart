import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apprania/model/list.dart';
import 'package:flutter_apprania/providers/patient_provider.dart';
import 'package:flutter_apprania/vues/ListP.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';



class ModifPatient extends StatefulWidget {

  @override
  _ModifPatientState createState() => _ModifPatientState();
  var patientId;
  var nom;
  var prenom;
  var email;
  var tel;
  var adr;
  var cin;
  var genre;

  ModifPatient(this.patientId,this.nom, this.prenom, this.email, this.tel, this.adr, this.cin,
      this.genre);
}

class _ModifPatientState extends State<ModifPatient> {
  String colorGroupValue;
  var nameController = TextEditingController();
  var prenomController = TextEditingController();
  var emailController = TextEditingController();
  var cinController = TextEditingController();
  var telController = TextEditingController();
  var adrController = TextEditingController();
  var genreController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    prenomController.dispose();
    emailController.dispose();
    cinController.dispose();
    telController.dispose();
    adrController.dispose();
    genreController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget == null){
      nameController.text = "";
      prenomController.text = "";
      emailController.text = "";
      cinController.text = "";
      telController.text = "";
      adrController.text = "";
      genreController.text = "";
    } else{
      nameController.text= widget.nom;
      prenomController.text = widget.prenom;
      emailController.text= widget.email;
      cinController.text = widget.cin;
      telController.text = widget.tel;
      adrController.text = widget.adr;
      genreController.text = widget.genre;
    }
  }

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);
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

        title: Text('Modifier Profil Patient',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),


      ),
      body: ListView(
        children: [
          Stack(
              children: <Widget> [
                Container(
                  height: MediaQuery.of(context).size.height - 82,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                ),
                Positioned(
                    top:65.0,
                    child:Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white,
                      ),
                      height:MediaQuery.of(context).size.height - 100,
                      width: MediaQuery.of(context).size.width  ,
                    )
                ),

                Padding(
                  padding: const EdgeInsets.only(top:130.0,left:17,right: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  <Widget>[
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'saisir le nom',
                          labelText: 'Nom',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),
                          icon:Icon(Icons.person),
                        ),
                        onChanged: (value){
                          patientProvider.ChangeName(value);

                        },
                        keyboardType: TextInputType.name,
                        maxLength: 10,
                      ),
                      TextField(
                        controller: prenomController,
                        decoration: InputDecoration(
                          hintText: "Saisir prenom",
                          labelText: 'Prénom',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),
                          icon:Icon(Icons.person),
                        ),
                        onChanged: (value){
                          patientProvider.ChangePrenom(value);
                        },
                        keyboardType: TextInputType.name,
                        maxLength: 10,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Saisir email",
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),
                          icon:Icon(Icons.email_rounded),
                        ),
                        onChanged: (value){
                          patientProvider.ChangeEmail(value);
                        },
                        keyboardType: TextInputType.emailAddress,



                      ),
                      TextField(
                        controller: cinController,
                        decoration: InputDecoration(
                          hintText: "Saisir cin",
                          labelText: 'Cin',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),
                          icon:Icon(Icons.art_track_rounded),
                        ),
                        onChanged: (value){
                          patientProvider.ChangeCin(value);

                        },
                        keyboardType: TextInputType.number,
                        maxLength: 8,



                      ),

                      TextField(
                        controller: telController,
                        decoration: InputDecoration(
                          hintText: "Saisir numéro de telephone",
                          labelText: 'Telephone',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),
                          icon:Icon(Icons.call),
                        ),
                        onChanged: (value){
                          patientProvider.ChangeTel(value);

                        },
                        keyboardType: TextInputType.number,
                        maxLength: 8,



                      ),
                      TextField(
                        controller: adrController,
                        decoration: InputDecoration(
                          hintText: "Saisir adresse",
                          labelText: 'Adresse',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),
                          icon:Icon(Icons.add_location_rounded),
                        ),
                        onChanged: (value){
                          patientProvider.ChangeAdresse(value);
                        },
                        keyboardType: TextInputType.streetAddress,
                        maxLength: 10,
                      ),
                      Container(
                        width: 350,
                        child: Row(
                          children: [

                            Radio(value: 'Femme', groupValue: colorGroupValue, onChanged: (val){
                              colorGroupValue = val;
                              setState((){});

                            }),
                            Text(
                              'Femme', style: TextStyle(fontSize: 24),
                            ),
                            Radio(value: 'Homme', groupValue: colorGroupValue, onChanged: (val){
                              colorGroupValue = val;
                              setState((){});
                            }),
                            Text(
                              'Homme', style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),

                      ),


                    ],



                  ),
                )


              ]
          )
        ],
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){

          Navigator.push(context, MaterialPageRoute(builder: (context)=>ListP()),);
          patientProvider.updatePatient(widget.patientId);
          },
        child: Icon(Icons.done_outline),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),


    );
  }
}

