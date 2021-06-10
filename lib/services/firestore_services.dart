import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_apprania/model/list.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<void> savePatient(Patient patient) {
    return  _db.collection('patients').doc(patient.patientId).set(
        patient.toMap());
  }

  Future<void> updatePatient(Patient patient) {
    print("ID IS "+patient.patientId);
    print("ID IS "+patient.nom);
    print("ID IS "+patient.prenom);
    print("ID IS "+patient.cin);
    print("ID IS "+patient.tel);


    Patient pp= new Patient();
     Future<DocumentSnapshot> searchP=_db.collection('patients').doc(patient.patientId).get();
    searchP.then((document) =>{
    // pp = Patient.fromFirestore (document.data() ),
      pp.nom =patient.nom,
      if(pp!=null){
        _db.collection('patients').doc(pp.patientId).set(
        patient.toMap(
        ))
      }else{
        print("can not find patient with this patient_id"+patient.patientId)
      }
    }
    ).catchError((error) => print("error"));
}


  Stream<List<Patient>> getPatients() {
    return _db.collection('patients').snapshots().map((snapshot) =>
        snapshot.docs.map((document) =>Patient.fromFirestore(document.data())).toList());
  }

  Stream<List<Patient>> searchByName(String searchField) {
    return _db.collection('patients').where('email'.toUpperCase(),isEqualTo: searchField.toUpperCase()).snapshots().map((snapshot) =>
        snapshot.docs.map((document) =>Patient.fromFirestore(document.data())).toList());
  }

  Stream<List<Patient>> getByEmail(Patient p)  {
    return _db.collection('patients').where('name'.toUpperCase(),isEqualTo: p.email.toUpperCase()).snapshots().map((snapshot) =>
        snapshot.docs.map((document) =>Patient.fromFirestore(document.data())).toList());

  }
 /*UpdatePatient(){
    var updatedPatient = Patient(nom: nom, prenom: prenom, email: email, cin: cin, tel: tel, adr: adr, genre: genre, patientId: uuid.v4());
    firestoreService.savePatient(updatedPatient);
  }*/


}