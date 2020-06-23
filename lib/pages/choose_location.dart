import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {
    String name = await Future.delayed(Duration(seconds: 3), () {
      return 'Tilek';
    });

    String bio = await Future.delayed(Duration(seconds: 3), () {
      return 'bio';
    });
    
    print('$name - $bio');
  }

  int counter = 0;

  @override
  void initState() {
    super.initState();
    getData();
    print('statement');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Text('$counter'),
      )
    );
  }
}
