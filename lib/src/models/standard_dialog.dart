import 'package:flutter/material.dart';

class StandardDialog {
  final Widget title;
  final Widget content;
  final Color backgroundColor;

  const StandardDialog({
    required this.title,
    required this.content,
    required this.backgroundColor,
  });

  factory StandardDialog.transform(Map<String, dynamic> map) {
    return StandardDialog(
      title: Text(map["title"], style: TextStyle(color: map["font_color"])), 
      content: Column(
        mainAxisSize: .min,
        children: <Widget>[
          Text(map["content"], style: TextStyle(color: map["font_color"])),
        ],
      ), 
      backgroundColor: map["backgroundColor"] 
    );
  }
}