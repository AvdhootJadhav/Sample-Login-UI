import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Data extends StatelessWidget {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  String user;
  CollectionReference users = FirebaseFirestore.instance.collection('Data');
  Future<void> addUser(){
      return users.add({
        'FullName': name.text,
        'Email': email.text,
      }).then((value) => print('User added')).catchError((error)=> print('Failed to add user'));
    }
  
  @override
  Widget build(BuildContext context) {
    user= name.toString();
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Firestore"),
        backgroundColor: Colors.purple[800],
      ),
      body: Column(
        children: <Widget>[
          Container(
                //color: Colors.yellow,
                margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Enter Name",
                    border: OutlineInputBorder(
                    ),
                  ),
                ),
              ),
              Container(
                //color: Colors.green,
                margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Enter email",
                    border: OutlineInputBorder(
                      
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: RaisedButton(
                  color: Colors.purple[800],
                  onPressed: (){
                    addUser();
                  },
                  child: Text("Sign In",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}