import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String>? futureString;
  String? text = 'first';
  Future<String>? getDataFromFuture() {
    return Future.delayed(Duration(seconds: 3), () => 'its done');
  }

  @override
  void initState() {
    super.initState();
    futureString = getDataFromFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<String?>(
            future: futureString,
            builder: (context, snapshot) {
//            if (snapshot.connectionState == ConnectionState.waiting){
//              return Text('waiting');
//            }
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(snapshot.data ?? 'is null');
              }
              return CircularProgressIndicator();
            },
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            child: Text(text ?? ''),
          ),
          ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  text = 'second';
                });
              },
              icon: Icon(Icons.access_alarm),
              label: Text('press'))
        ],
      ),
    );
  }
}
