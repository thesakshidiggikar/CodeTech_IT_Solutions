import 'package:attendance_app/verfied/signup.dart';
import 'package:attendance_app/views/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 56.0,
            left: 24.0,
            bottom: 24.0,
            right: 24.0,
          ),
          child: Column(
            children: [
              //logo,title,& subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage("images/wel1.png"),
                  ),
                  Text(
                    "Login ",
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

                    //remember me & forgot password
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
                    const SizedBox(height: 16.0),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (() async {
                              await signIn();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            }),
                            child: Text("Login"))),
                    const SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),

              //divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: const Color.fromARGB(255, 92, 90, 90),
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(
                    "or Sign in! ",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Flexible(
                    child: Divider(
                      color: Color.fromARGB(255, 92, 90, 90),
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),
              //footter
              const SizedBox(height: 16.0),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (() async {
                        // await signIn();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUp()));
                      }),
                      child: Text("Sign up!!!"))),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
