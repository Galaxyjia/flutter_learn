import 'package:flutter/material.dart';
import 'package:flutter_learn/demo/music_demo.dart';
// import 'package:flutter_learn/demo/music_keyboard.dart';
import 'package:flutter_learn/demo/pitch_game.dart';
import 'package:flutter_learn/demo/fight_game.dart';
// import 'demo/listview_demo.dart';
// import 'package:flutter_midi/flutter_midi.dart';
// import 'package:flutter_learn/demo/AutoOrientationDemo.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:flutter_learn/demo/Pages/stick_page.dart';

void main()=>runApp(App());
// void main()=>runApp(AutoOrientationDemo());

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),   
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(
            icon:Icon(Icons.menu),
            tooltip: "Navigation",
            onPressed: ()=>debugPrint('Navigation button is pressed'),
          ),
          title: Text("Musicook"),
          actions: <Widget>[
            IconButton(
            icon:Icon(Icons.search),
            tooltip: "Search",
            onPressed: ()=>debugPrint('Search button is pressed'),
          ) ,
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon:Icon(Icons.local_florist)),
              Tab(icon:Icon(Icons.change_history)),
              Tab(icon:Icon(Icons.directions_bike)),
            ]
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        body: TabBarView(
          children: <Widget>[
            RaisedButton(
              child: Text("Game Screen"),
              onPressed: (){
                 Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=>FightGame())
                 );
              }
            ),
             RaisedButton(
              child: Text("Stick Screen"),
              onPressed: (){
                 Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=>TargetPage())
                 );
              }
            ),
            MusicSheet()
          ],
          ),
          floatingActionButton: SpeedDial(
            child: Icon(Icons.add),
            children:[
                SpeedDialChild(
                    child: Icon(Icons.accessibility),
                    backgroundColor: Colors.red,
                    label: '第一个按钮',
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap:(){
                        Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=>PitchGame()),
                      );
                    }
                ),
                SpeedDialChild(
                    child: Icon(Icons.brush),
                    backgroundColor: Colors.orange,
                    label: '第二个按钮',
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () => print('SECOND CHILD'),
                ),
                SpeedDialChild(
                    child: Icon(Icons.keyboard_voice),
                    backgroundColor: Colors.green,
                    label: '第三个按钮',
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () => print('THIRD CHILD'),
                ),
            ]
        ),
      ),
    );
  }
}



