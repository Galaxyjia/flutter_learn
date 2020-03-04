import 'package:flutter/material.dart';
import 'package:flutter_learn/demo/open_screen_demo.dart';
import 'package:fluro/fluro.dart';
import 'config/routes.dart';
import 'config/application.dart';


void main(){
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(MyApp());
}
// void main()=>runApp(AutoOrientationDemo());
// class App extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: OpenScreen(),
//       theme: ThemeData(
//         primarySwatch: Colors.purple
//       ),   
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musicook App',
      /// 生成路由
      onGenerateRoute: Application.router.generator,
    );
  }
}






