import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';
import 'package:task_app/routs/home_screen.dart';
import 'package:task_app/routs/signup_screen.dart';
import 'package:task_app/utalities/button.dart';
import 'package:task_app/utalities/text_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                  Image.asset('images/blogo.png'),
                  TextForm(
                    controller: emailController,
                    icon: Icons.email_outlined,
                    hintText: 'Email',
                    lableText: 'Your Email',
                  ),
                  TextForm(
                    controller: passwordController,
                    hintText: 'Password',
                    icon: Icons.lock,
                    lableText: 'Your Password',
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Forget password?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var email = emailController.text.trim();
                      var password = passwordController.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        //Flutter tose
                        return;
                      }
                      ProgressDialog progressDialog =
                      ProgressDialog(context, title: const Text('Login'), message: const Text('Please wait'),);
                      progressDialog.show();
                      try {
                        FirebaseAuth auth = FirebaseAuth.instance;
                      UserCredential userCredential = await  auth.signInWithEmailAndPassword(email: email, password: password);

                        if (userCredential.user != null) {
                          Fluttertoast.showToast(msg: 'Success');
                          progressDialog.dismiss();

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));

                        } else {
                          Fluttertoast.showToast(msg: 'Failed');
                        }
                        progressDialog.dismiss();

                      }
                      on FirebaseAuthException catch (e){
                        progressDialog.dismiss();
                        if (e.code == 'user-not-found') {
                          Fluttertoast.showToast(msg:  'User not found ');
                        } else if (e.code == 'wrong-password') {
                          progressDialog.dismiss();
                          Fluttertoast.showToast(msg: 'wrong Password ');
                        }



                      }

                      catch (e) {
                        progressDialog.dismiss();
                        Fluttertoast.showToast(msg: 'Something wanna wrong ');
                      }


                    },

                    child: const Button(
                      text: 'Login',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'If you do not have account ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        child: const Text(
                          'SignUp?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
