import 'package:flutter/material.dart';

var pageList = [
  PageModel(
      imageUrl: "assets/images/illustration.png",
      title: "人工智能",
      body: "21世纪的音乐教育体系",
      titleGradient: gradients[0]),
  PageModel(
      imageUrl: "assets/images/illustration2.png",
      title: "趣味互动",
      body: "联网游戏练习，和好友一起玩音乐",
      titleGradient: gradients[1]),
  PageModel(
      imageUrl: "assets/images/illustration3.png",
      title: "创作",
      body: "AI辅助作曲，唤醒你心中的作曲家",
      titleGradient: gradients[2]),
];

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}
