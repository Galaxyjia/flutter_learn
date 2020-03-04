import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../demo/home_demo.dart';
import '../demo/open_screen_demo.dart';

Handler splashHandler =  Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OpenScreen();
});

Handler homeHandler =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return Home();

  }
);

