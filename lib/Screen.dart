import 'package:flutter/material.dart';
import 'tic_tac_toe.dart';

class WelcomeScren extends StatelessWidget {
  const WelcomeScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000619),
      body: Container(
        // constraints: BoxConstraints.expand(),

        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Welcome To ',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Tic Tac Toe Game',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Image(
                  image: AssetImage('images/tac.png'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 50),
                    padding: EdgeInsets.all(12),
                  ),
                  child: Text(
                    'Play Game',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
