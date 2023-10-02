import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_app/routs/add_task_screen.dart';
import 'package:task_app/routs/login_screen.dart';
import 'package:task_app/routs/profile_screen.dart';
import 'package:task_app/routs/task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TASK'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        // drawer: Drawer(
        //   child: ListView(
        //     children: [
        //       const UserAccountsDrawerHeader(
        //         accountName: Text('Sadiq Awan'),
        //         accountEmail: Text('awansadiq@gamil.com'),
        //         decoration: BoxDecoration(
        //           color: Colors.grey,
        //         ),
        //         currentAccountPictureSize: Size.square(80),
        //         currentAccountPicture: CircleAvatar(
        //           backgroundImage: AssetImage('images/blogo.png'),
        //         ),
        //       ),
        //       ListTile(
        //         leading: const Icon(Icons.home),
        //         title: const Text('Home'),
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => const HomeScreen()));
        //         },
        //       )
        //     ],
        //   ),
        // ),
        body: Stack(
          children: [
            const Positioned(
              right: 60,
              top: 0,
              child: Image(width: 300, image: AssetImage('images/blogo.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0, left: 20, right: 20),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TaskScreen()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(3, 5),
                                blurRadius: 3,
                                spreadRadius: 2)
                          ],
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.event_note,
                            size: 45,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Task',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddTaskScreen()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(3, 5),
                                blurRadius: 3,
                                spreadRadius: 2)
                          ],
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.edit_calendar_outlined,
                            size: 45,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'New Task',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(3, 5),
                                blurRadius: 3,
                                spreadRadius: 2)
                          ],
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.person_3_outlined,
                            size: 45,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: const Text('Conformation !!!'),
                          content: const  Text('Are you sure to Log OUT  ?'),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();
                            }, child:const  Text('NO')),
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();

                              FirebaseAuth.instance.signOut();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()));

                            }, child:const  Text('YES')),
                          ],
                        );
                      });



                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(3, 7),
                                blurRadius: 3,
                                spreadRadius: 2)
                          ],
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.output_outlined,
                            size: 45,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'LogOut',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
