import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    static const TextStyle optionstyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,

  );
  static const List<Widget> _widgetoptions = <Widget>[
    Text(
      'Home',
      style: optionstyle,
    ),
    Text(
      'Trending',
      style: optionstyle,
    ),
    Text(
      'Subscriptions',
      style: optionstyle,
    ),
    Text(
      'Notifications',
      style: optionstyle,
    ),
    Text(
      'Library',
      style: optionstyle,
    ),
  ];

  int _selectedindex=0;

  void _onTapped(int index){
    setState((){
      _selectedindex= index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Icon(
          Icons.play_circle_outline,
          color: Colors.red[700],
        ),
        title: Text("YouTube",
        style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.videocam,
              color: Colors.grey[700],
            ),
            onPressed: (){},
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.search,
              color: Colors.grey[700],
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.account_circle_sharp,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
      body: Center(
        child: _widgetoptions.elementAt(_selectedindex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up,),
            label: 'Trending'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.grey,),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library, color: Colors.grey,),
            label: 'Library',
          ),*/
        ],
        currentIndex: _selectedindex,
        selectedItemColor: Colors.red,
        onTap: _onTapped,
      ),
    );
  }
}