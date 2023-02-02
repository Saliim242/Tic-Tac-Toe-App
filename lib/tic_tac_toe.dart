import 'package:flutter/material.dart';
import 'Screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool WinerO = true;
  int wonO = 0;
  int wonX = 0;
  int draw = 0;
  List<String> PlayerO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[800],
      backgroundColor: Color(0xff000619),

      body: Column(
        children: [
          Spacer(),
          Text(
            'Play Game',
            style: TextStyle(color: Colors.grey[300], fontSize: 25),
          ),
          Expanded(
            child: Container(
              //padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player O ',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        wonO.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player X ',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        wonX.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.builder(
                padding: EdgeInsets.all(6),
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext cotext, int index) {
                  return InkWell(
                    onTap: () {
                      _Clicked(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff000619),
                        ),
                        color: Color(0xff001456),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          //index.toString(),

                          PlayerO[index],
                          style: TextStyle(
                            color: Color(0xff4169e8),
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(
                        () {
                          wonO = 0;
                          wonX = 0;
                        },
                      );
                    },
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 2.2, color: Colors.white),
                        minimumSize: Size(200, 50),
                        padding: EdgeInsets.all(6)),
                    child: Text(
                      'Rest Score',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Version 1.0.0',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[400],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // This Fucntion Displaying X And O
  void _Clicked(int index) {
    setState(
      () {
        if (WinerO && PlayerO[index] == '') {
          PlayerO[index] = 'O';
          draw += 1;
        } else if (!WinerO && PlayerO[index] == '') {
          PlayerO[index] = 'X';
          draw += 1;
        }

        WinerO = !WinerO;
        GetWinerPlayer();
      },
    );
  }

  // In An Hubino Player-ka Guulestay

  void GetWinerPlayer() {
    // First Row Check Index 0  - 1
    if (PlayerO[0] == PlayerO[1] &&
        PlayerO[0] == PlayerO[2] &&
        PlayerO[0] != '') {
      _ShowDilog(PlayerO[0]);
    }
    // Secend Row Check Index 3 - 2
    if (PlayerO[3] == PlayerO[4] &&
        PlayerO[3] == PlayerO[5] &&
        PlayerO[3] != '') {
      _ShowDilog(PlayerO[3]);
    }
    // Third Row Check Index 6 - 3
    if (PlayerO[6] == PlayerO[7] &&
        PlayerO[6] == PlayerO[8] &&
        PlayerO[6] != '') {
      _ShowDilog(PlayerO[6]);
    }

    // ===== End Row Check Winner =====

    // First Column Check Index 0 -4
    if (PlayerO[0] == PlayerO[3] &&
        PlayerO[0] == PlayerO[6] &&
        PlayerO[0] != '') {
      _ShowDilog(PlayerO[0]);
    }
    // Secend Column Check Index 1 -5
    if (PlayerO[1] == PlayerO[4] &&
        PlayerO[1] == PlayerO[7] &&
        PlayerO[1] != '') {
      _ShowDilog(PlayerO[1]);
    }
    // third Column Check Index 2 -6
    if (PlayerO[2] == PlayerO[5] &&
        PlayerO[2] == PlayerO[8] &&
        PlayerO[2] != '') {
      _ShowDilog(PlayerO[2]);
    }

    // Internal Column Check Index 0 -7
    if (PlayerO[0] == PlayerO[4] &&
        PlayerO[0] == PlayerO[8] &&
        PlayerO[0] != '') {
      _ShowDilog(PlayerO[0]);
    }
// Internal Column Check Index 2 - 8
    if (PlayerO[6] == PlayerO[4] &&
        PlayerO[6] == PlayerO[2] &&
        PlayerO[6] != '') {
      _ShowDilog(PlayerO[6]);
    } else if (draw == PlayerO.length) {
      _ShowDraw();
    }
  }

  void _ShowDraw() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'The mach ends Draw',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Play again',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Give Us Box Dialog
  void _ShowDilog(String WinerName) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'The Winer Is : ' + WinerName,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Play again',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
    if (WinerName == 'O') {
      wonO++;
    } else if (WinerName == 'X') {
      wonX++;
    }
  }

  // Clear All Boxes
  void clear() {
    setState(() {
      for (int i = 0; i < PlayerO.length; i++) {
        PlayerO[i] = '';
      }
    });
    draw = 0;
  }
}
