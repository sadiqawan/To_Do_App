import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_app/routs/home_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(


          appBar: AppBar(title:const Center(child:  Text('Task')),
            backgroundColor: Colors.grey,),
          body: Column(
            children: [
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(hintText: 'New Task'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    String taskNew = textController.toString().trim();
                    if (taskNew.isEmpty) {
                      Fluttertoast.showToast(msg: 'Please enter the Task !');
                    }
                    User? user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      String uid = user.uid;
                      int dt = DateTime.now().millisecondsSinceEpoch;
                      DatabaseReference taskRef = FirebaseDatabase.instance
                          .ref()
                          .child('Task')
                          .child('uid');
                      String? taskId = taskRef.push().key;

                      await taskRef.child(taskId!).set({
                        'dt': dt,
                        'userId': uid,
                        'taskId': taskId,
                        
                      }
                      
                      );
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const  HomeScreen()));
                      Fluttertoast.showToast(msg: 'Task is Successfully Added');
                    }
                  },
                  child: const Text('Save'))
            ],
          )),
    );
  }
}
