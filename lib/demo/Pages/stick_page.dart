import 'package:sticky_infinite_list/sticky_infinite_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TargetPage extends StatefulWidget {
  TargetPage({Key key}) : super(key: key);

  @override
  _TargetPageState createState() => _TargetPageState();
}

class _TargetPageState extends State<TargetPage> {
  List<String> pageTitle = [
    "John Wick","Batman","Avengers",
    "X-Men II","Thor","Spider Man",
    "Harry Potter","Ant Man","Aladin",
    "X Men","Batman Vs Superman","Monster University"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar:AppBar(
           title: Text(
             "UI Design"
           ),
           centerTitle: true,
         ),
         body: InfiniteList(
           controller: ScrollController(),
           direction: InfiniteListDirection.single,
           minChildCount: 0,
           maxChildCount: 12,
           builder: (context,index){
             final date = DateTime.now().add(
               Duration(days: index)
               );
             return InfiniteListItem(
               headerStateBuilder: (context,state){
                 return Container(
                   decoration: BoxDecoration(
                     shape:BoxShape.circle,
                     color:Colors.orange.withOpacity(1-state.position),
                   ),
                   height:70,
                   width: 70,
                   margin: EdgeInsets.symmetric(horizontal:10,vertical:5),
                   child: Column(
                     mainAxisAlignment:MainAxisAlignment.center,
                     children:<Widget>[
                       Text(
                         date.day.toString(),
                         style: TextStyle(
                           fontSize:21,
                           color:Colors.black87,
                           fontWeight: FontWeight.w600
                         ),
                       ),
                       Text(
                         DateFormat.MMM().format(date),
                         style: TextStyle(
                           height: .7,
                           fontSize: 17,
                           fontWeight: FontWeight.w400,                
                         ),
                       )
                     ]
                   ),
                 );
               },
               contentBuilder: (context)=>Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                 ),
                 margin: EdgeInsets.only(
                   left:90,
                   top:5,
                   bottom:5,
                   right:10,
                 ),
                 padding: EdgeInsets.all(8),
                 height: 300,
                 width: 300,
                 child: createLayout(
                                    title:pageTitle[index],
                                    icon:"assets/images/icon.png"
                                  ),
                                )
                              );
                            },
                          ),
                        )
                 
                     );
                   }
                 
    Widget createLayout({String title, String icon}) {
      TextStyle titleStyle = 
                TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0);
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
            image: AssetImage(icon),
            fit:BoxFit.fill,
            colorFilter:
              ColorFilter.mode(Colors.black38,BlendMode.multiply)
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              spreadRadius: 5.0,
              offset: Offset(5.0,5.0),
              color: Colors.black26
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: titleStyle.copyWith(color:Colors.white),
            ),
            SizedBox(height: 30,)
          ],
          ),
        );
    }
}