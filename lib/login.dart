import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Login extends StatelessWidget {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  
  void validate() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email:email.toString(),
        password: password.toString(), 
      );
      
    }on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        print('No user found');
      }
      else if(e.code=='wrong-password'){
        print('Wrong password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                //color: Colors.blue,
                //margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                child: Text("Log In",
                style: TextStyle(color: Colors.blue, fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Icon(
                  Icons.account_circle_sharp,
                  size: 150,
                  color: Colors.grey,
                  
                ),
              ),
              Container(
                //color: Colors.yellow,
                margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Enter email id",
                    border: OutlineInputBorder(
                    ),
                  ),
                ),
              ),
              Container(
                //color: Colors.green,
                margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
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
                  color: Colors.blue,
                  onPressed: (){
                    validate();
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
      ),
    );
  }
}