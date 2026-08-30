import 'package:material_ui/material_ui.dart';
import 'package:custom_feedback/src/models/dialog_model.dart';

class CustomDialog {
  static Future<T?> dialog<T>({
    required BuildContext context,
    required DialogModel dialogModel,
  }) async {

    final response = await showDialog<T>(
      context: context,
      barrierDismissible: dialogModel.barrierDismissible,
      builder: (dialogContext) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (dialogModel.onOpen != null) {
            final response = await dialogModel.onOpen!();
            if (dialogContext.mounted) {
              Navigator.pop(dialogContext, response);
            }
            return;
          }

          if (dialogModel.closeTime != null) {
            await Future.delayed(dialogModel.closeTime!);
            if (dialogContext.mounted) {
              Navigator.pop(dialogContext);
            }
          }
        });

        return AlertDialog(
          shape: dialogModel.shape,
          backgroundColor: dialogModel.backgroundColor,
          shadowColor: dialogModel.shadowColor.withValues(alpha: 0.5),
          title: dialogModel.closeIcon
            ? _getRow(
                dialogContext: dialogContext, 
                title: dialogModel.title, 
                iconColor: dialogModel.iconColor
              )
            : dialogModel.title,
          content: dialogModel.content,
          actions: dialogModel.actions,
          actionsAlignment: dialogModel.actionsAlignment,
          actionsPadding: dialogModel.actionsPadding
        );
      }
    );
    return response;
  }

  static Row _getRow({
    required BuildContext dialogContext, 
    required Widget title, 
    required Color iconColor
  }) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: <Widget>[
        title,
        IconButton(
          onPressed: () => Navigator.pop(dialogContext),
          icon: Icon(Icons.close, color: iconColor)
        )
      ]
    );
  }
}
