import 'package:flutter/material.dart';

class DialogModel {
  final Widget title;
  final Widget content;
  final bool closeIcon;
  final bool barrierDismissible;
  final Color iconColor;
  final Color backgroundColor;
  final Color shadowColor;
  final ShapeBorder shape;
  final Duration? closeTime;
  final MainAxisAlignment? actionsAlignment;
  final EdgeInsetsGeometry? actionsPadding;
  final List<Widget>? actions;

  const DialogModel({
    required this.title,
    required this.content,
    required this.closeIcon,
    required this.barrierDismissible,
    required this.iconColor,
    required this.backgroundColor,
    required this.shadowColor,
    required this.shape,
    this.closeTime,
    this.actionsAlignment,
    this.actionsPadding,
    this.actions
  });
}
