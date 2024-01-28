import 'package:attendance_app/views/floatingNotification.dart';
import 'package:attendance_app/views/google_sheets_api.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import "package:swipeable_button_view/swipeable_button_view.dart";
import 'package:attendance_app/views/homescreen2.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool isFinished = false;
  final user = FirebaseAuth.instance.currentUser;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showOverlay() {
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50.0,
        left: MediaQuery.of(context).size.width * 0.2,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Attendance marked successfully!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(Duration(seconds: 1), () {
      overlayEntry.remove();
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Swipeable button example"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            child: SwipeableButtonView(
              buttonText: "SLIDE TO ATTENDANCE!!! ",
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
                    showOverlay();
                  });
                });
              },
              onFinish: () async {
                // Navigate to HomeScreen
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const HomeScreen2(),
                  ),
                );

                // Set a flag to show the notification only once
                if (!isFinished) {
                  isFinished = true;

                  // Show the notification after 2 seconds
                  Future.delayed(Duration(seconds: 2), () {
                    NotificationManager().simpleNotification();
                  });

                  // Write to Google Sheets
                  final userEmail = user?.email ?? "No email";
                  print("Writing to Google Sheets for user: $userEmail");

                  try {
                    print("Writing to Google Sheets for user: $userEmail");
                    await GoogleSheetsApi.writeToSheet(userEmail, 'P');
                    print("Successfully wrote to Google Sheets.");
                  } catch (e) {
                    print("Error writing to Google Sheets: $e");
                  }
                }

                setState(() {
                  isFinished = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
