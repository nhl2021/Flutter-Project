import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection('patients').where('name'.toUpperCase(),isEqualTo: searchField.toUpperCase());
  }
}