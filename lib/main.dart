import 'package:flutter/material.dart';
import 'package:flutter_learn/demo/music_demo.dart';
import 'package:flutter_learn/demo/music_keyboard.dart';
import 'package:flutter_learn/demo/pitch_game.dart';
// import 'demo/listview_demo.dart';
import 'package:flutter_midi/flutter_midi.dart';

import 'package:flutter_learn/demo/AutoOrientationDemo.dart';

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
        body: TabBarView(
          children: <Widget>[
            RaisedButton(
              child: Text("Game Screen"),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>PitchGame()),
                );
              }
            ),
            // Icon(Icons.change_history,size:128.0,color:Colors.black12),
            // Icon(Icons.directions_bike,size:128.0,color:Colors.black12),
            Column(
              children: <Widget>[
                Expanded(
                  child:Container(
                    padding: const EdgeInsets.only(top:300),
                    child:MusicKeyboard(),
                  ), 
                ),
              ],
            ),
            
            MusicSheet()
          ],
          ),
      ),
    );
  }
}



