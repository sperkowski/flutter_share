import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/search.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

//final usersRef = Firestore.instance.collection('users');
final usersRef = FirebaseFirestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    // getUserById();
    // createUser();
    //updateUser();
    deleteUser();
    super.initState();
  }

  createUser() {
    usersRef
        //.document("abcde")
        .doc("abcde")
        //.setData({"username": "Danielle", "postsCount": 6, "isAdmin": false});
        .set({"username": "Danielle", "postsCount": 6, "isAdmin": false});
  }

  updateUser() async {
    //final doc = await usersRef.document("abcde").get();
    final doc = await usersRef.doc("abcde").get();

    if (doc.exists) {
      //doc.reference.updateData(
      doc.reference.update(
          {"username": "Danielle C.", "postsCount": 0, "isAdmin": false});
    }
  }

  deleteUser() async {
    //final DocumentSnapshot doc = await usersRef.document("abcde").get();
    final DocumentSnapshot doc = await usersRef.doc("abcde").get();
    if (doc.exists) {
      doc.reference.delete();
    }
  }

  // getUserById() async {
  //   final String id = 'RzT9FJ0SIO6GdeHOp5sO';
  //   final DocumentSnapshot doc = await usersRef.document(id).get();
  //     print(doc.data);
  //     print(doc.documentID);
  //     print(doc.exists);

  // }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          //final List<Text> children = snapshot.data.documents
          final List<Text> children =
              snapshot.data.docs.map((doc) => Text(doc['username'])).toList();
          return Container(
            child: ListView(
              children: children,
            ),
          );
        },
      ),
    );
  }
}
