import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void onIconPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Color getIconColor(int index) {
    return selectedIndex == index ? Colors.blue : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Alarm Clock App'),
        bottom: PreferredSize(
          child: Container(
            color: const Color.fromARGB(255, 66, 66, 66),
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'feedback') {
                print('Feedback selected');
              } else if (value == 'report') {
                print('Report selected');
              } else if (value == 'help') {
                print('Help selected');
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'feedback',
                child: Row(
                  children: [
                    Icon(Icons.feedback),
                    SizedBox(width: 8),
                    Text('Feedback'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'report',
                child: Row(
                  children: [
                    Icon(Icons.report),
                    SizedBox(width: 8),
                    Text('Report'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'help',
                child: Row(
                  children: [
                    Icon(Icons.help),
                    SizedBox(width: 8),
                    Text('Help'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body:
      DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Material(
              child: Container(
                height: 60,
                color: Colors.white,
                // elevation
                child: TabBar(
                  physics: const ClampingScrollPhysics(),
                  padding:
                      EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        width: 35,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //border: Border.all(color: Colors.pinkAccent,width: 1),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.alarm),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 35,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.timer),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 35,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.hourglass_empty),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 35,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.access_time),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Center(
                  //alarm
                  child: Container(

                  ),
                ),
                Center(
                  //stopwatch
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 40,),,
                ),
                SizedBox(height: 20.0,),

                Center(
                  //timmer
                  child: Container(),
                ),
                Center(
                  //world clock
                  child: Container(),
                ),
              ],)),
            // SizedBox(height: 30),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     buildIconButtonWithCard(Icons.alarm, 0),
            //     buildIconButtonWithCard(Icons.timer, 1),
            //     buildIconButtonWithCard(Icons.access_time, 2),
            //     buildIconButtonWithCard(Icons.hourglass_empty, 3),
            //   ],
            // ),
            // SizedBox(height: 30),
            // Expanded(
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         bottom: 16,
            //         right: 16,
            //         child: GestureDetector(
            //           onTap: () {
            //             // Handle the "+" button tap
            //             print('Add Alarm tapped');
            //           },
            //           child: Container(
            //             width: 40,
            //             height: 40,
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Colors.blue,
            //             ),
            //             child: Center(
            //               child: Text(
            //                 '+',
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
          ],
        ),
      ),
      //],
    );
    //),
    //);
  }

  Widget buildIconButtonWithCard(IconData icon, int index) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () => onIconPressed(index),
          color: getIconColor(index),
        ),
        SizedBox(height: 4),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
