import 'package:cloud_firestore/cloud_firestore.dart';
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
  String? dataid;

  void editform({DocumentSnapshot? data}) {
    if (data != null) {
      name.text = data["Name"];
      age.text = data["Age"];
      phone.text = data["phone no"];
      department.text = data["Department"];
      dataid = data.id;
    } else {
      name.clear();
      age.clear();
      phone.clear();
      department.clear();
      dataid = null;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("EDIT STUDENT"),
          content: Column(
            children: [
              TextField(controller: name, decoration: InputDecoration(labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.black),
                ),)),SizedBox(height: 10,),
              TextField(controller:age,decoration: InputDecoration(labelText: "Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.black),
                ),)),SizedBox(height: 10,),
              TextField(controller: phone,decoration: InputDecoration(labelText: "phone no",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.black),
                ),),),SizedBox(height: 10,),
              TextField(controller: department,decoration: InputDecoration(labelText: "Department",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.black),
                ),),),SizedBox(height: 10,),
              ElevatedButton(onPressed: (){}, child: Text("update"))
            ],
          ),
        );
      },
    );
  }

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
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: age,
                      decoration: InputDecoration(
                        labelText: "Age",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: phone,
                      decoration: InputDecoration(
                        labelText: "Phone no",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: department,
                      decoration: InputDecoration(
                        labelText: "Department",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        add_student(
                          name: name.text,
                          age: age.text,
                          phone: phone.text,
                          department: department.text,
                          context: context,
                        );
                      },
                      child: Text("ADD"),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fetchdata(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final studentdata = snapshot.data!.docs;
          return ListView.builder(
            itemCount: studentdata.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        deletedata(studentdata[index].id);
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(onPressed: () {editform(data:studentdata[index]);}, icon: Icon(Icons.edit)),
                  ],
                ),
                title: Text(studentdata[index]["Name"]),
                subtitle: Column(
                  children: [
                    Text(studentdata[index]["Age"]),
                    Text(studentdata[index]["phone no"]),
                    Text(studentdata[index]["Department"]),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
