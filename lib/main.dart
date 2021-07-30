import 'package:flutter/material.dart';
import 'package:maze/maze.dart';

var x;
void main() => runApp(MazeApp());

class MazeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Maze Demo',
        theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: Colors.blueGrey),
        home: difficulity());
  }
}

class difficulity extends StatelessWidget {
  const difficulity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    x = 6;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MazeScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Easy".toUpperCase(),
                        style: TextStyle(fontSize: 25)),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.white))))),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    x = 12;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MazeScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Hard".toUpperCase(),
                        style: TextStyle(fontSize: 25)),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.white)))))
            ],
          ),
        ),
      )),
    );
  }
}

class MazeScreen extends StatefulWidget {
  @override
  _MazeScreenState createState() => _MazeScreenState();
}

class _MazeScreenState extends State<MazeScreen> {
  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
        backgroundColor: Colors.blue[50],
        title: const Text('finish line'),
        content: const Text(
          'congratulations you have ended this level',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          )
        ]);
    return Scaffold(
        body: SafeArea(
            child: Maze(
                player: MazeItem(
                    'https://image.flaticon.com/icons/png/512/808/808433.png',
                    ImageType.network),
                columns: x,
                rows: x * 2,
                wallThickness: 4.0,
                wallColor: Theme.of(context).primaryColor,
                finish: MazeItem(
                    'https://image.flaticon.com/icons/png/512/1506/1506339.png',
                    ImageType.network),
                onFinish: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    ))));
  }
}
