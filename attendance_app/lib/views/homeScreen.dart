import 'package:attendance_app/verfied/login.dart';
import 'package:attendance_app/verfied/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:attendance_app/views/navigation_drawer.dart';
import 'package:attendance_app/views/drawer_items.dart';
import 'package:attendance_app/views/people.dart';

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
      drawer: Drawer(
        child: Material(
          color: Color.fromARGB(255, 242, 239, 239),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
            child: Column(
              children: [
                headerWidget(),
                DrawerItems(
                    name: "People",
                    icon: Icons.people,
                    onPressed: () => onItemPressed(context, index: 0),
                    ),
                const SizedBox(
                  height: 30.0,
                ),
                DrawerItems(
                    name: "About",
                    icon: Icons.report,
                    onPressed: () => onItemPressed(context, index: 0)),
                const SizedBox(
                  height: 30.0,
                ),
                DrawerItems(
                    name: "profile",
                    icon: Icons.people,
                    onPressed: () => onItemPressed(context, index: 0)),
                const SizedBox(
                  height: 30.0,
                ),
                DrawerItems(
                    name: "feedback",
                    icon: Icons.people,
                    onPressed: () => onItemPressed(context, index: 0)),
                const SizedBox(
                  height: 30.0,
                ),
                DrawerItems(
                    name: "help",
                    icon: Icons.people,
                    onPressed: () => onItemPressed(context, index: 0)),
                const SizedBox(
                  height: 30.0,
                ),
                DrawerItems(
                    name: "Coming...",
                    icon: Icons.people,
                    onPressed: () => onItemPressed(context, index: 0)),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
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

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const People()));
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          //backgroundImage:NetworkImage(url)
        ),
        const SizedBox(
          width: 20,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          Text("People name",
              style: TextStyle(fontSize: 14, color: Colors.red)),
          SizedBox(
            height: 10,
          ),
          Text("person@gmail.com",
              style: TextStyle(fontSize: 14, color: Colors.red))
        ])
      ],
    );
  }

}
