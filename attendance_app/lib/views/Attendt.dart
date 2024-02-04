import 'package:attendance_app/views/attendace.dart';
import 'package:attendance_app/views/homeScreen.dart';
import 'package:attendance_app/views/homescreen2.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

void main() {
  runApp(const Attendent());
}

class Attendent extends StatelessWidget {
  const Attendent({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}




class Attend extends StatefulWidget {
  const Attend({super.key});

  @override
  State<Attend> createState() => _AttendState();
}

class _AttendState extends State<Attend> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Swipeable button example"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Image.asset(
          //   "asset/home_image.jpg",
          //   fit: BoxFit.cover,
          //   height: double.infinity,
          //   width: double.infinity,
          // ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: SwipeableButtonView(
                  buttonText: "Mark or Attendance",
                  buttonWidget: Container(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                  ),
                  activeColor: Colors.green,
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        isFinished = true;
                      });
                    });
                  },
onFinish: () async {
                    DateTime currentDate = DateTime.now();
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: AttendanceScreen(),
                      ),
                    );
                    setState(() {
                      isFinished = false;
                    });
                  }
                  )
                  ),

        ],
      ),
    );
  }
}
