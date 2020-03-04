import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_learn/demo/Pages/planning_page.dart';
import '../demo/home_demo.dart';
import '../demo/open_screen_demo.dart';
import '../demo/Pages/login_page.dart';

Handler splashHandler =  Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OpenScreen();
});

Handler loginHandler =  Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginVideo();
});

Handler homeHandler =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return Home();
  }
);

Handler planningHandler =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return Planning();
  }
);
