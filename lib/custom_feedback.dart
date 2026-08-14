import 'package:flutter/material.dart';
import 'package:custom_feedback/src/custom_dialog.dart';
import 'package:custom_feedback/src/custom_snackbar.dart';
import 'package:custom_feedback/src/models/dialog_model.dart';
import 'package:custom_feedback/src/models/snackbar_model.dart';

/// The [CustomFeedback] is the main class where 
/// its possible to call [dialog] and [snackBar] methods
class CustomFeedback {

  /// Displays a customizable [AlertDialog].
  ///
  /// The generic type [T] represents the value returned 
  /// when the dialog is closed.
  /// 
  /// The [onOpen] callback is executed after the dialog is rendered.
  /// When [onOpen] is provided, [closeTime] is ignored.
  ///
  /// If [closeTime] is provided, [barrierDismissible] 'should' be set to
  /// `false` to prevent the dialog from being dismissed manually.
  ///
  /// When [closeIcon] is `true`, a close button is displayed next
  /// to the [title].
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
    /// A callback executed after the dialog is rendered.
    ///
    /// The dialog remains open while the returned [Future] is being completed.
    /// Once the callback completes, its return value is used as the dialog
    /// result and the dialog is closed.
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

  /// Displays a customizable [SnackBar].
  ///
  /// The appearance and behavior of the [SnackBar] can be customized
  /// through the provided parameters.
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
