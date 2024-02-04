import 'package:attendance_app/main.dart';
import 'package:attendance_app/verfied/login.dart';
import 'package:attendance_app/verfied/signup.dart';
import 'package:attendance_app/views/Attendt.dart';
import 'package:attendance_app/views/attendace.dart';
import 'package:attendance_app/views/homescreen2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:attendance_app/views/navigation_drawer.dart';
import 'package:attendance_app/views/drawer_items.dart';
import 'package:attendance_app/views/people.dart';
//import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFinished = false;
  bool alertShown = false;
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (user != null) {
        showLoginAlertDialog(context);
      }
    });
  }

void showLoginAlertDialog(BuildContext context) async {
    if (alertShown) {
      return; // Do nothing if the alert is already shown
    }

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Mark Your Attendance!"),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the AlertDialog
                alertShown = true; // Set the flag to true

                // Navigate to Attendance screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Attend()),
                )..then((value) {
                  // This block will be executed when returning from the AttendanceScreen
                  // If you need to navigate to HomeScreen, do it here
                  if (value == true) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Attend()),
                    );
                  }
                });
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
    // After the alert is dismissed, navigate to the desired screen

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //--------------sideBar-------------
      drawer: Drawer(
        child: Material(
          color: Color.fromARGB(255, 242, 239, 239),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
            child: Column(
              children: [
                headerWidget(),
                const SizedBox(
                  height: 10.0,
                ),
                Divider(
                  thickness: 1,
                  //indent: 3,
                  //endIndent: 10,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                DrawerItems(
                  name: "People",
                  icon: Icons.people,
                  onPressed: () => onItemPressed(context, index: 0),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Divider(
                  thickness: 1,
                  //indent: 3,
                  //endIndent: 10,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                DrawerItems(
                    name: "About",
                    icon: Icons.report,
                    onPressed: () => onItemPressed(context, index: 0)),
                const SizedBox(
                  height: 4.0,
                ),
                Divider(
                  thickness: 1,
                  //indent: 3,
                  //endIndent: 10,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                DrawerItems(
                  name: "Attendace...",
                  icon: Icons.login_rounded,
                  onPressed: (() async {
                    await signout();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttendanceScreen()));
                  }),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                
                Divider(
                  thickness: 1,
                  //indent: 3,
                  //endIndent: 10,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                DrawerItems(
                    name: "feedback",
                    icon: Icons.people,
                    onPressed: () => onItemPressed(context, index: 0)),
                const SizedBox(
                  height: 4.0,
                ),
                Divider(
                  thickness: 1,
                  //indent: 3,
                  //endIndent: 10,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                DrawerItems(
                    name: "help",
                    icon: Icons.people,
                    onPressed: () => onItemPressed(context, index: 0)),
                const SizedBox(
                  height: 4.0,
                ),
                Divider(
                  thickness: 1,
                  //indent: 3,
                  //endIndent: 10,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                DrawerItems(
                  name: "Logout...",
                  icon: Icons.login_rounded,
                  onPressed: (() async {
                    await signout();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
      //----------------------HomeScreen----------------------
      appBar: AppBar(
        title: Text("HomePage ${user!.email}"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              color: Colors.white,
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
              margin: EdgeInsets.only(right: 10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/intro2.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        children: [
                          Container(
                              //adjusting the title
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Mediterranem Chickpea Salad",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              )),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Hone Goot Cheese",
                              //style: AppWidget.LightTextFeildStyle(),
                            ),
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "\$40",
                              //style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              margin: EdgeInsets.only(right: 10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/intro2.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        children: [
                          Container(
                              //adjusting the title
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Mediterranem Chickpea Salad",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              )),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Hone Goot Cheese",
                              //style: AppWidget.LightTextFeildStyle(),
                            ),
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "\$40",
                              //style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              margin: EdgeInsets.only(right: 10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/intro2.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        children: [
                          Container(
                              //adjusting the title
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "OS Assignment Submission",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              )),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Hone Goot Cheese",
                              //style: AppWidget.LightTextFeildStyle(),
                            ),
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "\$40",
                              //style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              margin: EdgeInsets.only(right: 10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/intro2.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        children: [
                          Container(
                              //adjusting the title
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Mediterranem Chickpea Salad",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              )),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Hone Goot Cheese",
                              //style: AppWidget.LightTextFeildStyle(),
                            ),
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "\$40",
                              //style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              margin: EdgeInsets.only(right: 10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/intro2.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        children: [
                          Container(
                              //adjusting the title
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Mediterranem Chickpea Salad",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              )),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Hone Goot Cheese",
                              //style: AppWidget.LightTextFeildStyle(),
                            ),
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "\$40",
                              //style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4),
            child: Container(
              height: 160,
              margin: EdgeInsets.only(right: 10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/intro2.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        children: [
                          Container(
                              //adjusting the title
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Mediterranem Chickpea Salad",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              )),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Hone Goot Cheese",
                              //style: AppWidget.LightTextFeildStyle(),
                            ),
                          ),
                          Container(
                            //adjusting the title
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "\$40",
                              //style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: (() async {
      //     await signout();
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => LoginPage()));
      //   }),
      //   child: Icon(Icons.login_rounded),
      // ),
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
          // backgroundImage: NetworkImage(url)
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user?.displayName ?? "Anonymous",
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  user?.email ?? "No email",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
