import 'package:custom_feedback/src/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:custom_feedback/src/custom_dialog.dart';
import 'package:custom_feedback/src/custom_snackbar.dart';
import 'package:custom_feedback/src/models/dialog_model.dart';
import 'package:custom_feedback/src/models/snackbar_model.dart';

/// The [CustomFeedback] is the main class where
/// its possible to call [rawDialog], [standardDialog],
/// [errorDialog], [confirmDialog], [loadingDialog] 
/// and [snackBar] methods
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
  static Future<T?> rawDialog<T>({
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
    final dialogModel = DialogModel<T>(
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
      onOpen: onOpen,
    );

    return CustomDialog.dialog(context: context, dialogModel: dialogModel);
  }


  /// Displays a customizable standard [AlertDialog].
  ///
  /// It contains a [title], the content is a simple [Text]
  /// inside a [Column] and is also possible to change
  /// colors properties [fontColor] and [backgroundColor]
  static Future<void> standardDialog({
    required BuildContext context,
    String title = "Dialog",
    String content = "Dialog Content",
    Color fontColor = Colors.black,
    Color backgroundColor = Colors.white,
  }) {
    final dialogModel = DialogModel.standard(
      title: title, 
      content: content, 
      fontColor: fontColor, 
      backgroundColor: backgroundColor
    );

    return CustomDialog.dialog(context: context, dialogModel: dialogModel);
  }


  /// Displays a customizable error [AlertDialog].
  ///
  /// It contains a [title], the content is a simple [Text]
  /// inside a [Column] and is also possible to change
  /// colors properties [fontColor] and [backgroundColor]
  /// also contains [closeTime] property with default `3 sec`
  static Future<void> errorDialog({
    required BuildContext context,
    String title = "⚠️ Erro ⚠️",
    String content = "Erro ao concluir a ação",
    Color fontColor = Colors.black,
    Color backgroundColor = Colors.white,
    Duration closeTime = const Duration(seconds: 3)
  }) {
    final dialogModel = DialogModel.error( 
      title: title, 
      content: content, 
      fontColor: fontColor, 
      backgroundColor: backgroundColor, 
      duration: closeTime
    );

    return CustomDialog.dialog(context: context, dialogModel: dialogModel);
  }


  /// Displays a customizable confirm [AlertDialog].
  ///
  /// It contains a [title], the content is a confirmation text [Text]
  /// inside a [Column] and is also possible to change
  /// colors properties [fontColor] and [backgroundColor],
  /// [buttonColor] and [buttonFontColor]
  /// 
  /// The action contains 2 [Button]
  /// 
  /// The right button returns `true`
  /// The left button returns `false`
  static Future<bool?> confirmDialog({
    required BuildContext context,
    String title = "Confirmação",
    String content = "\nTem certeza que deseja prosseguir ?\n",
    Color fontColor = Colors.black,
    Color backgroundColor = Colors.white,
    Color buttonColor = Colors.blue,
    Color buttonFontColor = Colors.white
  }) {
    final dialogModel = DialogModel.confirm(
      title: title, 
      content: content, 
      fontColor: fontColor, 
      backgroundColor: backgroundColor, 
      actions: <Widget>[
        Row(
          spacing: 5,
          children: <Widget>[
            Expanded(
              child: Button(
                label: "Não", 
                color: buttonColor,
                textColor: buttonFontColor,
                function: () => Navigator.pop(context, false)
              )
            ),
            Expanded(
              child: Button(
                label: "Sim", 
                color: buttonColor,
                textColor: buttonFontColor,
                function: () => Navigator.pop(context, true)
              )
            ),
          ],
        )
      ]
    );
    
    return CustomDialog.dialog<bool>(context: context, dialogModel: dialogModel);
  }


  /// Displays a customizable loading [AlertDialog].
  ///
  /// It contains a [title], the content is a [CircularProgressIndicator]
  /// inside a [Column] and is also possible to change
  /// colors properties [fontColor] and [backgroundColor],
  /// 
  /// The duration default is `3 sec`
  /// 
  /// The generic type [T] represents the value returned
  /// when the dialog is closed.
  /// 
  /// /// The [onOpen] callback is executed after the dialog is rendered.
  /// When [onOpen] is provided, [closeTime] is ignored.
  static Future<T?> loadingDialog<T>({
    required BuildContext context,
    String title = "Carregando...",
    Color fontColor = Colors.black,
    Color backgroundColor = Colors.white,
    Duration closeTime = const Duration(seconds: 3),
    Future<T?> Function()? onOpen,
  }) {
    final dialogModel = DialogModel.loading(
      context: context, 
      title: title, 
      fontColor: fontColor, 
      backgroundColor: backgroundColor,
      duration: closeTime,
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
