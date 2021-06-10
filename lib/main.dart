
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apprania/providers/patient_provider.dart';
import 'package:flutter_apprania/services/firestore_services.dart';
import 'package:flutter_apprania/validations/add_validation.dart';
import 'package:flutter_apprania/vues/ListC.dart';
import 'package:flutter_apprania/vues/add-consultation.dart';

import 'package:flutter_apprania/vues/modif-patient.dart';
import 'vues/login-page.dart';
import 'vues/forgot-password.dart';

import 'vues/add-patient.dart';
import 'vues/ListP.dart';
import 'package:provider/provider.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreService =FirestoreService();
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) =>PatientProvider()),
    StreamProvider(create: (context) => firestoreService.getPatients()),
    ChangeNotifierProvider(create: (context) => AddValidation()),
    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doctor',
        theme: ThemeData(

            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          'ForgotPassword': (context) => ForgotPassword(),
          'listP':(context)=> ListP(),
          'AddPatient': (context) => AddPatient(),

          'AddConsultation': (context) => AddConsultation(),
       //   'ModifPatient': (context) => ModifPatient(),
         /* 'listC':(context)=> ListC(),*/

        }
    ),
    );
  }
}

