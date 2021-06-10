import 'package:flutter/cupertino.dart';
import 'package:flutter_apprania/model/list.dart';
import 'package:flutter_apprania/services/firestore_services.dart';
import 'package:flutter_apprania/vues/add-patient.dart';
import 'package:uuid/uuid.dart';

class PatientProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _patientId;
  String _nom;
  String _prenom;
  String _email;
  String _cin;
  String _tel;
  String _adr;
  String _genre;

  var uuid = Uuid();

  //Getters
  String get patientId => _patientId;
  String get nom => _nom;
  String get prenom => _prenom;
  String get email => _email;
  String get cin => _cin;
  String get tel => _tel;
  String get adr => _adr;
  String get genre => _genre;

  //Setters
  ChangeName(String value) {
    _nom = value;
    notifyListeners();
  }

  ChangePrenom(String value) {
    _prenom = value;
    notifyListeners();
  }

  ChangeEmail(String value) {
    _email = value;
    notifyListeners();
  }

  ChangeCin(String value) {
    _cin = value;
    notifyListeners();
  }

  ChangeTel(String value) {
    _tel = value.toString();
    notifyListeners();
  }

  ChangeAdresse(String value) {
    _adr = value;
    notifyListeners();
  }

  ChangeGenre(String val) {
    _genre = val;
    notifyListeners();
  }



 /* loadValues(Patient patient){
    _nom=Patient.nom;
    _nom=Patient.nom;

  }*/

  savePatient() {
    var newPatient = Patient(
        nom: nom,
        prenom: prenom,
        email: email,
        cin: cin,
        tel: tel,
        adr: adr,
        genre: genre,
        patientId: _patientId);
    firestoreService.savePatient(newPatient);
  }


updatePatient(patientId){
      var updatedPatient = Patient( nom: nom, prenom: prenom, email: email, cin: cin, tel: tel, adr: adr, genre: genre, patientId: uuid.v4());
      firestoreService.updatePatient(updatedPatient);
    }

}

