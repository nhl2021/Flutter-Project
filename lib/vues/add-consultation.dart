import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apprania/pallette.dart';
import 'package:flutter_apprania/widgets/background-image.dart';

import 'package:flutter_apprania/vues/ListP.dart';
import 'package:image_picker/image_picker.dart';

import 'ListP.dart';
class AddConsultation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddConsultationState();
}

class _AddConsultationState extends State<AddConsultation> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  DateTime date ;
  String taille;
  Double tension;
  Double poids;
  String glycemie ;
  String calories;
  String image ;
  String resultat ;
  String colorGroupValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /*_openCamera(BuildContext context) async{
    var picture = await ImagePicker.pickImage(source:ImageSource.camera);
    this.setState(() {
      imageFile=picture ;
    });
    Navigator.of(context).pop();
  }*/
  void validate(){
    if(_formKey.currentState.validate()){
      print("validated");
    }else {
      print("not validated");
    }
  }


  Widget _buildnamee() {
    return Text(
      'Dossier médical',
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
    );
  }

  Widget _builddate() {

    return TextFormField(

      decoration: const InputDecoration(labelText: 'Date',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Date is Required';
        }

        return null;
      },
      onSaved: (String value) {
        date = value as DateTime;
      },
    );
  }
  Widget _buildtaille() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Taille',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'taille is Required';
        }

        return null;
      },
      onSaved: (String value) {
        taille = value;
      },
    );
  }

  Widget _buildtension() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Tension',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value .isEmpty) {
          return 'tension is Required';
        }

        return null;
      },
      onSaved: (String value) {
        tension = value as Double;
      },
    );
  }

  Widget _buildpoids() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Poids',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value .isEmpty) {
          return 'poids is Required';
        }

        return null;
      },
      onSaved: (String value) {
        poids = value as Double;
      },
    );
  }
  Widget _buildnamegly() {
    return Text(
      'Type Diabète:                                                                             ',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 15),

    );
  }
  Widget _buildglycemie() {


    return Container(


      width: 500,


      child: Row(
        children: [

          Radio(value: 'Type1', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});

          }),
          Text(
            'Type1', style: TextStyle(fontSize: 20),
          ),
          Radio(value: 'Type2', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});
          }),
          Text(
            'Type2', style: TextStyle(fontSize: 20),
          ),
          Radio(value: 'Gestationnel', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});

          }),
          Text(
            'Gestationnel', style: TextStyle(fontSize: 20),
          )
        ],

      ),
    );
  }



  Widget _buildnamecardio() {
    return Text(
      'Type Diabète:                                                                             ',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 15),

    );
  }
  Widget _buildcardio() {


    return Container(


      width: 500,


      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Radio(value: 'HTA', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});

          }),
          Text(
            'HTA', style: TextStyle(fontSize: 14),
          ),
          Radio(value: 'Dyslipidémie', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});
          }),
          Text(
            'Dyslipidémie', style: TextStyle(fontSize: 14),
          ),
          Radio(value: 'Tabac', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});

          }),
          Text(
            'Tabac', style: TextStyle(fontSize: 14),
          ),
          Radio(value: 'Cancer', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});

          }),
          Text(
            'Cancer', style: TextStyle(fontSize: 14),
          )
        ],

      ),
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Calories',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        calories = value;
      },
    );
  }
  Widget _buildImage() {
    return Container(


      child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [


            Text('Images'),
      FlatButton.icon(onPressed: (){
      },
          icon: Icon(Icons.add_a_photo),
        label: Text('add'),

          ),



      /*RaisedButton (onPressed: (){

            FlatButton.icon(
                  icon: Icon(Icons.camera),
              onPressed: (){
             takePhoto(ImageSource.camera);
               },
            label:Text("Camera"),
            );
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: (){
               takePhoto(ImageSource.gallery);
               },
              label:Text("Gallerie"),
             );
          },
           child:Text("Select Image !"),
    )*/
    ]
    ),
    );
  }

 /*Widget _selectImage(){


  }*/
  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
  Widget _buildresultat() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'resultat ',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
      keyboardType: TextInputType.multiline,
      maxLength: null,
      maxLines: null,
      validator: (String value) {

        return null;
      },
      onSaved: (String value) {
        resultat = value ;
      },
    );
  }

  Widget _buildnamequalite() {

                 return Text(' Qualité image:                                                                               ',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15),
                     );



  }

  Widget _buildQualite() {
    return Container(

      width: 500,


      child: Row(
        children: [

          Radio(value: 'bonne', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});

          }),
          Text(
            'bonne', style: TextStyle(fontSize: 20),
          ),
          Radio(value: 'moyenne', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});
          }),
          Text(
            'moyenne', style: TextStyle(fontSize: 20),
          ),
          Radio(value: 'mauvaise', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});

          }),
          Text(
            'mauvaise', style: TextStyle(fontSize: 20),
          )
        ],

      ),
    );

  }



  Widget _buildnametrtm() {
    width: 500;
    return Text(
      'Traitement:                                                                                 ',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 15),



    );
  }

  Widget _buildTraitment() {

    return Container(

      width: 500,


      child: Row(
        children: [

          Radio(value: 'ADO', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});

          }),
          Text(
            'ADO', style: TextStyle(fontSize: 20),
          ),
          Radio(value: 'Insuline', groupValue: colorGroupValue, onChanged: (val){
            colorGroupValue = val;
            setState((){});
          }),
          Text(
            'Insuline', style: TextStyle(fontSize: 20),
          ),

        ],

      ),
    );

  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        elevation: 10.0,
        title: Text('Ajouter Consultation',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 18.0,
            color:Colors.white,
          ),
        ),


      ),

      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 40,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(

                  top:50.0,
                  child:Container(
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white,
                    ),
                    height:MediaQuery.of(context).size.height - 82,
                    width: MediaQuery.of(context).size.width  ,
                  )



              ),
              SizedBox(height: 100.0,),
              Stack(
                children: [
                  Container(
                      child: Column(
                          children : <Widget> [
                            _buildnamee(),
                            SizedBox(height: 30.0,),
                            _builddate(),
                            SizedBox(height: 0.0,),
                            _buildtaille(),
                            SizedBox(height: 0.0,),
                            _buildtension(),
                            SizedBox(height: 0.0,),
                            _buildpoids(),
                            SizedBox(height: 0.0,),
                            _buildCalories(),
                            SizedBox(height: 10.0,),
                            _buildImage(),
                            SizedBox(height: 10.0,),
                            _buildnamequalite(),
                            SizedBox(height: 0.0,),
                            _buildQualite(),
                            SizedBox(height:0,),
                            _buildnamegly(),
                            SizedBox(height: 0.0,),
                            _buildglycemie(),
                            SizedBox(height: 0.0,),

                            _buildnametrtm(),
                            SizedBox(height: 0.0,),
                            _buildTraitment(),
                            SizedBox(height: 0.0,),
                            _buildnamecardio(),
                            SizedBox(height: 0.0,),
                            _buildcardio(),
                            SizedBox(height: 0.0,),
                            _buildresultat(),
                            SizedBox(height: 0.0,),

                          ]
                      )
                  )
                ],
              )
            ],

          ),

        ],


      ),



      floatingActionButton:FloatingActionButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ListP()),),
        child: Icon(Icons.done_outline),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),



    );





  }
}
