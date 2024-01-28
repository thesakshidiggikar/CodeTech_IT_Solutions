import 'package:attendance_app/verfied/forgot_pwd.dart';
import 'package:attendance_app/verfied/login.dart';
import 'package:attendance_app/views/homeScreen.dart';
import 'package:attendance_app/wrapper.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController Username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Course = TextEditingController();
  TextEditingController Sem = TextEditingController();

  // Add these variables for course and semester
  String selectedCourse = '';
  String selectedSemester = '';
  List<String> courses = ['BCA', 'BTECH', 'BBA', "BIO.Eng"]; // No duplicates
  List<String> semesters = [
    'SEM 1',
    'SEM 2',
    'SEM 3',
    "SEM 4",
    "SEM 5",
    "SEM 6"
  ]; // No duplicates

  Admin() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      // Store user data in Firestore
      await FirebaseFirestore.instance.collection('users').add({
        'username': Username.text,
        'password':password.text,
        'email': email.text,
        'course': Course.text,
        'semester': Sem.text,
      });

      Get.offAll(Wrapper());
    } catch (error) {
      // Handle registration errors, e.g., display an error message
      print("Error during registration: $error");
    }
  }
  // TextEditingController password = TextEditingController();

  // signIn() async {
  //   await FirebaseAuth.instance
  //       .signInWithPopup(
  //     Username:Username.text,
  //     email: email.text,
  //     password: password.text,);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Login"),),
        // body: Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: Column(
        //     children: [
        //       TextField(
        //         controller: email,
        //         decoration: InputDecoration(hintText: 'Enter email',),
        //       ),
        //       TextField(
        //         controller: password,
        //         decoration: InputDecoration(
        //           hintText: 'Enter password',
        //         ),
        //       ),
        //       ElevatedButton(onPressed: (()=>signIn()), child: Text("Login")),
        //     ],
        //   ),
        // ),
        // appBar: AppBar(
        //   leading: GestureDetector(
        //     onTap: () {
        //       // Navigate to SignUp page
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(builder: (context) => LoginPage()),
        //       );
        //     },
        //     child: const Icon(
        //       Icons.arrow_back_ios_new_outlined,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 56.0,
          left: 24.0,
          bottom: 24.0,
          right: 24.0,
        ),
        child: Column(children: [
          //logo,title,& subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: 150,
                image: AssetImage("images/wel1.png"),
              ),
              Text(
                "Sign Up ! ",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Discover limitless learning platform !",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          //form
          Form(
            child: Column(
              //email
              children: [
                TextFormField(
                  controller: Username,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      labelText: "Username"),
                ),
                const SizedBox(
                  height: 9.0,
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: "enter email"),
                ),
                const SizedBox(
                  height: 9.0,
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_rounded),
                    labelText: " enter password",
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
                const SizedBox(height: 16.0 / 2),
                Row(
                  children: [
                    //remember me
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        const Text("remember me!"),
                      ],
                    ),
                    //forgot password
                    TextButton(
                      onPressed: () {},
                      child: const Text("forgot password ? "),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                //remember me & forgot password
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonFormField<String>(
                          value:
                              selectedCourse.isNotEmpty ? selectedCourse : null,
                          items: courses.map((course) {
                            return DropdownMenuItem<String>(
                              value: course,
                              child: Text(course),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCourse = value!;
                              Course.text = value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Course',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0), // Add spacing between dropdowns
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedSemester.isNotEmpty
                              ? selectedSemester
                              : null,
                          items: semesters.map((semester) {
                            return DropdownMenuItem<String>(
                              value: semester,
                              child: Text(semester),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedSemester = value!;
                              Sem.text = value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Sem',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20.0),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (() async {
                        
                        await Admin();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }),
                      child: Text("Sign up"),
                    )),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
