import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';
import 'package:task_app/routs/login_screen.dart';

import '../utalities/button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var fullNameController = TextEditingController();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var conformPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.grey,
          child: ListView(
            children: [
              Column(
                children: [
                  Image.asset(
                    'images/blogo.png',
                    height: 200,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Full Name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                          hintText: 'Your Name',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: 'Full Name',
                          fillColor: Colors.black.withOpacity(0.3),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                            20,
                          ))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Email Address',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Your Email',
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: 'Your Email',
                          fillColor: Colors.black.withOpacity(0.3),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Your Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: 'Your Password',
                          fillColor: Colors.black.withOpacity(0.3),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Conform Password',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: conformPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Conform Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: 'Conform Password',
                          fillColor: Colors.black.withOpacity(0.3),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),

                  GestureDetector(
                    onTap: () async {
                      var fullName = fullNameController.text.trim();
                      var email = emailController.text.trim();
                      var password = passwordController.text.trim();
                      var conformpassword = conformPasswordController.text
                        ..trim();

                      if (fullName.isEmpty ||
                          email.isEmpty ||
                          password.isEmpty ||
                          conformpassword.isEmpty) {
                        //Flutter tose
                        Fluttertoast.showToast(msg: 'Fill all fields ');
                        return;
                      }
                      if (password != conformpassword) {
                        //Show Flutter Tose
                        Fluttertoast.showToast(msg: 'Password is not match');
                        return;
                      }
                      if (password.length < 6) {
                        Fluttertoast.showToast(
                            msg: 'Password is week at least 6 character ');

                        return;
                      }
                      ProgressDialog progressDialog = ProgressDialog(
                        context,
                        title: const Text('Sign Up'),
                        message: const Text('Please wait'),
                      );
                      progressDialog.show();

                      try {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        UserCredential userCredential =
                            await auth.createUserWithEmailAndPassword(
                                email: email, password: password);

                        if (userCredential.user != null) {


                          DatabaseReference userRef =
                          FirebaseDatabase.instance.ref().child('user');
                          String uid = userCredential.user!.uid;
                          int dt = DateTime.now().millisecondsSinceEpoch;

                          await userRef.child(uid).set({
                            'fullName': fullName,
                            'email': email,
                            'uid': uid,
                            'dt': dt,
                            'profilePic' : ""
                          });
                          Fluttertoast.showToast(msg: 'Success');


                          Navigator.of(context).pop();
                          progressDialog.dismiss();
                        } else {
                          Fluttertoast.showToast(msg: 'Failed');
                        }
                        progressDialog.dismiss();
                      } on FirebaseAuthException catch (e) {
                        progressDialog.dismiss();
                        if (e.code == 'email-already-in-use') {
                          Fluttertoast.showToast(msg: 'Email already in use ');
                        } else if (e.code == 'weakPassword') {
                          progressDialog.dismiss();
                          Fluttertoast.showToast(msg: 'Password is weak');
                        }
                      } catch (e) {
                        progressDialog.dismiss();
                        Fluttertoast.showToast(msg: 'Something wanna wrong ');
                      }
                    },
                    child: const Button(
                      text: 'SignUp',
                    ),
                  ),

                  Divider(color: Colors.black,thickness: 2,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already  have account ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          'Login!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
