

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";

  String? id;
  String? name;
  String? email;
  String? password;
  String? selectedcountry;
  String? selectedstate;

  UserModel({this.id, this.name,this.email});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {   
       Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
       
    name = data[NAME];
    email = data[EMAIL];
    id = data[ID];
    password=data["password"];
    selectedcountry=data["country"];
    selectedstate=data["state"];
    
  }
}
