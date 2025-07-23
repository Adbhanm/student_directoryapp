



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void>add_student({required String name,required String age,required String phone, required String department,required BuildContext context})
async
{await FirebaseFirestore.instance.collection("students").add({"Name":name,"Age":age,"phone no":phone,"Department":department});
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SUCCESFULLY SUBMITTED")));
}
Stream<QuerySnapshot>fetchdata(){return FirebaseFirestore.instance.collection("students").snapshots();}
Future<void>deletedata(String id)async{await FirebaseFirestore.instance.collection("students").doc(id).delete();}