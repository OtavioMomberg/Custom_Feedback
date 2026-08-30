import 'package:material_ui/material_ui.dart';

class DialogModel<T> {
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
  final Future<T?> Function()? onOpen;

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
    this.actions,
    this.onOpen,
  });

  static const shapeModel = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10))
  );

  factory DialogModel.standard({
    required String title,
    required String content,
    required Color fontColor,
    required Color backgroundColor
  }) {
    return DialogModel(
      title: Text(title, style: TextStyle(color: fontColor)),
      content: Column(
        mainAxisSize: .min,
        children: <Widget>[
          Text(content, style: TextStyle(color: fontColor)),
        ],
      ),
      closeIcon: true,
      barrierDismissible: true,
      iconColor: fontColor,
      backgroundColor: backgroundColor,
      shadowColor: backgroundColor,
      shape: shapeModel,
    );
  }

  factory DialogModel.error({
    required String title,
    required String content,
    required Color fontColor,
    required Color backgroundColor,
    required Duration duration
  }) {
    return DialogModel(
      title: Center(
        child: Text(
          title, 
          style: TextStyle(color: fontColor)
        )
      ),
      content: Column(
        mainAxisSize: .min,
        children: <Widget>[
          const SizedBox(height: 15),
          Text(
            content, 
            style: TextStyle(
              color: fontColor, 
              fontWeight: FontWeight.bold
            )
          ),
          const SizedBox(height: 15),
        ],
      ),
      closeIcon: false,
      barrierDismissible: true,
      iconColor: fontColor,
      backgroundColor: backgroundColor,
      shadowColor: backgroundColor,
      shape: shapeModel,
      closeTime: duration
    );
  }

  factory DialogModel.confirm({
    required String title,
    required String content,
    required Color fontColor,
    required Color backgroundColor,
    required List<Widget> actions
  }) {
    return DialogModel(
      title: Center(child: Text(title, style: TextStyle(color: fontColor))),
      content: Column(
        mainAxisSize: .min,
        children: <Widget>[
          Text(content, style: TextStyle(color: fontColor)),
        ],
      ),
      closeIcon: false, 
      barrierDismissible: false, 
      iconColor: Colors.transparent, 
      backgroundColor: backgroundColor, 
      shadowColor: backgroundColor, 
      shape: shapeModel,
      actions: actions
    );
  }

  factory DialogModel.loading({
    required BuildContext context,
    required String title,
    required Color fontColor,
    required Color backgroundColor,
    required Duration duration,
    Future<T?> Function()? onOpen,
    
  }) {
    return DialogModel(
      title: Center(child: Text(title, style: TextStyle(color: fontColor))),
      content: Column(
        mainAxisSize: .min,
        children: <Widget>[
          const SizedBox(height: 25),
          CircularProgressIndicator.adaptive(
            backgroundColor: fontColor,
          ),
          const SizedBox(height: 25),
        ],
      ),
      closeIcon: false, 
      barrierDismissible: false, 
      iconColor: Colors.transparent, 
      backgroundColor: backgroundColor, 
      shadowColor: backgroundColor, 
      shape: shapeModel,
      closeTime: onOpen == null ? duration : null,
      onOpen: onOpen
    );
  }
}
