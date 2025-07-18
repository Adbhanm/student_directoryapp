import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_directoryapp/services.dart';

class Pagee extends StatefulWidget {
  const Pagee({super.key});

  @override
  State<Pagee> createState() => _PageeState();
}

class _PageeState extends State<Pagee> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController department = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("STUDENT DIRECTORY APP"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("ADD STUDENTS"),
                content: Column(
                  children: [
                    TextField(controller: name,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(controller: age,
                      decoration: InputDecoration(
                        labelText: "Age",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(controller: phone,
                      decoration: InputDecoration(
                        labelText: "Phone no",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(controller: department,
                      decoration: InputDecoration(
                        labelText: "Department",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(onPressed: () {add_student(name: name.text, age: age.text, phone: phone.text, department: department.text);}, child: Text("ADD")),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
