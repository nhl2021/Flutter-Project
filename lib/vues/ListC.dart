
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apprania/vues/ListP.dart';
import 'package:flutter_apprania/vues/add-consultation.dart';
import 'package:flutter_apprania/vues/add-patient.dart';
import 'package:flutter_apprania/vues/consultation_details.dart';
import 'package:flutter_apprania/vues/login-page.dart';
import 'package:flutter_apprania/vues/patient_details.dart';


class ListC extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListViewHomePage extends StatefulWidget {

  @override
  _ListViewHomePageState createState() => _ListViewHomePageState();
}

class _ListViewHomePageState extends State<ListViewHomePage> {
  @override
  Widget build(BuildContext context) {
    var floatingActionButton;
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color:Colors.white,
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListP()),),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('List Consultation',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 25.0,
            color:Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget> [
        ],
      ),

      body: ListView(
          children: <Widget>[

            SizedBox(height: 40.0,),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 185.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                  )
              ),
              child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 45.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height - 300,
                          child: ListView(
                              children: <Widget>[
                                _buildItem('assets/images/imgc.png',"12/04/2021", "168","12.6", "72"," 0.98", "5800", "non disponible", "non disponible",),
                                _buildItem('assets/images/imgc.png', "14/04/2021","178","16.9", "80"," 1.25", "4700", "non disponible", "non disponible"),

                              ]
                          ),
                        )
                    )

                  ]
              ),
            )
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                AddConsultation()),),
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),


    );
  }


  Widget _buildItem(String imagePath, String date ,String taille, String tension, String poids, String glycemie, String calories ,  String image ,String resultat) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailConsultation(imagePath, date ,taille, tension, poids, glycemie, calories, image  )));


          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                      children: <Widget>[
                        Hero(
                            tag: imagePath,
                            child: Image(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                              height: 75.0,
                              width: 75.0,
                            )
                        ),
                        SizedBox(width: 10.0,),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                date,
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),

                              ),

                            ]
                        )

                      ],
                    )
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.black,
                  onPressed: () {
                  },

                )

              ]


          )
      ),
    );
  }
}
