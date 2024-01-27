import 'package:attendance_app/verfied/login.dart';
import 'package:attendance_app/verfied/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage ${user!.email}"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              color: Colors.red,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          await signout();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }),
        child: Icon(Icons.login_rounded),
      ),
    );
  }
}
