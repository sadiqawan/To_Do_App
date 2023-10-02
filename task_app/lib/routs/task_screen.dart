


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);


  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  User? user;
  DatabaseReference? taskRef;

  get tasks => null;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user! == null) {
      taskRef = FirebaseDatabase.instance.ref().child('task').child(user!.uid);
    }


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          appBar: AppBar(title:const Center(child: const Text('Task')),
          backgroundColor: Colors.grey,),
          body: Center(
            child: Text(' NO Task is added Yet'),
          )
      ),
    )

    ;
  }
}
