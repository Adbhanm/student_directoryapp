import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_directoryapp/home.dart';

import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home:Pagee()));
}

