import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

 User? user =FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children:  [
           const  Padding(
              padding:  EdgeInsets.only(left:30.0,top: 20),
              child: CircleAvatar(
                maxRadius: 150,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80'),
              ),

            ),
            const SizedBox(height: 20,),
           const Align(
              alignment: Alignment.center,
                child: Text('Profile Info',style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold), )),
            Text(user!.email.toString(),style: const  TextStyle(fontSize: 20),),
          ],
        ),
      )
    );
  }
  }

