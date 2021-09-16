import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    getUsers();
    // getUserById();
    super.initState();
  }

getUsers() async {
  final QuerySnapshot snapshot = await usersRef
  .where("postCount", isLessThan: 3)
  .where("username", isEqualTo: "Fred")
  .getDocuments();

    snapshot.documents.forEach((DocumentSnapshot doc) {
      print(doc.data);
      print(doc.documentID);
      print(doc.exists);
    });
}

  getUserById() async {
    final String id = 'RzT9FJ0SIO6GdeHOp5sO';
    final DocumentSnapshot doc = await usersRef.document(id).get();
      print(doc.data);
      print(doc.documentID);
      print(doc.exists);
   
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: linearProgress(),
    );
  }
}
