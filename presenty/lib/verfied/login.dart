import 'package:presenty/verfied/signup.dart';
import 'package:presenty/views/homeScreen.dart';
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

  String emailError = '';
  String passwordError = '';

  signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }
  void validateInputs() {
    String emailPattern = r'^[a-zA-Z0-9.]+@(gmail|GMAIL)\.(com|COM)$';
    RegExp emailRegex = RegExp(emailPattern);

    String passwordPattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$';
    RegExp passwordRegex = RegExp(passwordPattern);

    if (!emailRegex.hasMatch(email.text)) {
      setState(() {
        emailError = 'Email should be a valid Gmail address.';
      });
    } else {
      setState(() {
        emailError = '';
      });
    }

    if (!passwordRegex.hasMatch(password.text)) {
      setState(() {
        passwordError =
            'Password should be at least 6 characters, contain 1 capital letter, and no special characters.';
      });
    } else {
      setState(() {
        passwordError = '';
      });
    }
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
                        labelText: "Enter email",
                      ),
                    ),
                    const SizedBox(
                      height: 9.0,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email should be a valid Gmail address.',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password_rounded),
                        labelText: "Enter password",
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        errorText:
                            passwordError.isNotEmpty ? passwordError : null,
                      ),
                    ),
                    const SizedBox(height: 16.0 / 2),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password should be at least 6 characters, contain 1 capital letter, and no special characters.',
                        style: TextStyle(color: Colors.red),
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
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
