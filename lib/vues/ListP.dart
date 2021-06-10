import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apprania/model/list.dart';
import 'package:flutter_apprania/providers/patient_provider.dart';
import 'package:flutter_apprania/services/firestore_services.dart';
import 'package:flutter_apprania/vues/add-patient.dart';
import 'package:flutter_apprania/vues/modif-patient.dart';
import 'package:flutter_apprania/vues/patient_details.dart';
import 'package:flutter_apprania/vues/login-page.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ListP extends StatelessWidget {
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
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "Search ...";
  Future<List> filteredNames = null; // names filtered by search text
  final firestoreService = FirestoreService();

  _ListViewHomePageState(){
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames=firestoreService.getPatients().toList();
          print('List: $filteredNames.length');

        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final patients = Provider.of<List<Patient>>(context);
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: ListView(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.logout),
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text('LogOut'),
                              content: Text('Are you sure to quit?'),
                              actions: [
                                FlatButton(
                                    child: Text('yes'),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    }),
                                FlatButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => ListP()),
                                      );
                                    }),
                              ]);
                        });
                  },
                ),
                SizedBox(
                  width: 210.0,
                  child: TextField(
                    controller: _filter,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: _searchText,
                        hintStyle: TextStyle(color: Colors.white)),

                    onChanged: (text) {
                      print('First text field: $text');
                    },
                  ),
                ),
                Container(
                    width: 57.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.search),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ]))
              ]),
        ),
        SizedBox(
          height: 25.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Row(children: <Widget>[
            Text(
              '        Liste Patient',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 40.0,
        ),
        Container(
          height: MediaQuery.of(context).size.height - 185.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75.0),
              )),
          child: ListView.builder(
            itemCount: patients.length,
            itemBuilder: (context, index) {
              var imagePath = "assets/images/fem.png";
              return Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPatient(
                                  imagePath,
                                  patients[index].patientId,
                                  patients[index].nom,
                                  patients[index].prenom,
                                  patients[index].email,
                                  patients[index].cin,
                                  patients[index].tel,
                                  patients[index].adr,
                                  patients[index].genre,
                                  index)));
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
                                      )),
                                  SizedBox(
                                    width: 50.0,
                                  ),
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          patients[index].nom,
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          patients[index].prenom,
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ])
                                ],
                              )),
                          IconButton(
                            icon: Icon(Icons.arrow_forward,
                                color: Colors.deepPurple),
                            color: Colors.black,
                            onPressed: () {},
                          )
                        ])),
              );
            },
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddPatient()),
        ),
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
    );
  }
}
