import 'package:flutter/material.dart';
import 'package:custom_feedback/src/custom_dialog.dart';
import 'package:custom_feedback/src/custom_snackbar.dart';
import 'package:custom_feedback/src/models/dialog_model.dart';
import 'package:custom_feedback/src/models/snackbar_model.dart';

class CustomFeedback {
  static Future<T?> dialog<T>({
    required BuildContext context,
    Widget title = const Text("Dialog"),
    Widget content = const Text("Dialog Content"),
    bool closeIcon = false,
    bool barrierDismissible = true,
    Color iconColor = Colors.black,
    Color backgroundColor = Colors.white,
    Color shadowColor = Colors.white,
    ShapeBorder shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    Duration? closeTime,
    MainAxisAlignment? actionsAlignment,
    EdgeInsetsGeometry? actionsPadding,
    List<Widget>? actions,
    Future<T?> Function()? onOpen,
  }) {

    final DialogModel<T> dialogModel = DialogModel(
      title: title,
      content: content,
      closeIcon: closeIcon,
      barrierDismissible: barrierDismissible,
      iconColor: iconColor,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      shape: shape,
      closeTime: closeTime,
      actionsAlignment: actionsAlignment,
      actionsPadding: actionsPadding,
      actions: actions,
      onOpen: onOpen
    );

    return CustomDialog.dialog(context: context, dialogModel: dialogModel);
  }

  static void snackBar({
    required BuildContext context,
    Widget content = const Text("SnackBar Content"),
    Color backgroundColor = Colors.black,
    ShapeBorder shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    bool showCloseIcon = false,
    Color closeIconColor = Colors.white,
    Duration duration = const Duration(seconds: 1),
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    SnackBarAction? action,
  }) {
    
    final SnackbarModel snackbarModel = SnackbarModel(
      content: content,
      backgroundColor: backgroundColor,
      shape: shape,
      showCloseIcon: showCloseIcon,
      closeIconColor: closeIconColor,
      duration: duration,
      behavior: behavior,
      margin: margin,
      padding: padding,
      action: action,
    );

    CustomSnackbar.snackbar(context: context, snackbarModel: snackbarModel);
  }
}
