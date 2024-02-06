import 'package:attendance_app/views/homeScreen.dart';
import 'package:attendance_app/views/homescreen2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "package:cloud_firestore/cloud_firestore.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttendanceScreen(),
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late List<bool> attendanceList;
  late DateTime currentDate;

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    attendanceList = List.generate(
      DateTime(currentDate.year, currentDate.month + 1, 0).day,
      (index) => false,
    );

    // Call the function to load attendance data
    loadAttendanceData();
  }

  @override
  Widget build(BuildContext context) {
    String month = DateFormat('MMMM yyyy').format(currentDate);

    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance Sheet: $month"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: ((context) => HomeScreen2())),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "For Month ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "$month",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: List.generate(
                attendanceList.length,
                (index) => Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(14),
                    color: attendanceList[index]
                        ? Colors.green
                        : currentDate.day == index + 1
                            ? Colors.blue
                            : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(
                        color:
                            attendanceList[index] ? Colors.grey : Colors.black,
                        fontWeight: currentDate.day == index + 1
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to load updated attendance data from Firestore
  void loadAttendanceData() async {
    // Implement your Firestore logic here to retrieve updated attendance data
    // For example, assuming you have a Firestore collection named 'attendance'
    // and each document has a 'status' field indicating the attendance status.

    try {
      // Fetch data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('attendance').get();

      // Process the retrieved data and update attendanceList
      querySnapshot.docs.forEach((doc) {
        print('Date: ${doc['date'].toDate()}, Status: ${doc['status']}');
        int day = doc['date'].toDate().day;

        setState(() {
          attendanceList[day - 1] = (doc['status'] == 'p');
        });
      });
    } catch (e) {
      print('Error loading attendance data: $e');
    }
  }
}
