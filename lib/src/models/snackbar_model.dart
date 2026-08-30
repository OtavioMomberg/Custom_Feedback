import 'package:material_ui/material_ui.dart';

class SnackbarModel {
  final Widget content;
  final Color backgroundColor;
  final ShapeBorder shape;
  final bool showCloseIcon;
  final Color closeIconColor;
  final Duration duration;
  final SnackBarBehavior behavior;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final SnackBarAction? action;

  const SnackbarModel({
    required this.content,
    required this.backgroundColor,
    required this.shape,
    required this.showCloseIcon,
    required this.closeIconColor,
    required this.duration,
    required this.behavior,
    this.margin,
    this.padding,
    this.action
  });
}