import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute
        .of(context)
        .settings
        .arguments;

    String bgImage = data['isDayTime']
        ? 'assets/day2.png'
        : 'assets/night2.png';
    Color bgColor = data['isDayTime'] ? Colors.lightBlueAccent[100] : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      color: Colors.red,
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(
                            context, '/location');
                        print(result);
                        if (result != null) {
                          setState(() {
                            data = result;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                        'edit location',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 66,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
