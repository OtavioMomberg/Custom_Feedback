import 'package:flutter/material.dart';
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
              ? Row(
                  mainAxisAlignment: .spaceBetween,
                  children: <Widget>[
                    dialogModel.title,
                    IconButton(
                      onPressed: () => Navigator.pop(dialogContext),
                      icon: Icon(Icons.close, color: dialogModel.iconColor),
                    ),
                  ],
                )
              : dialogModel.title,
          content: dialogModel.content,
          actions: dialogModel.actions,
          actionsAlignment: dialogModel.actionsAlignment,
          actionsPadding: dialogModel.actionsPadding,
        );
      },
    );
    return response;
  }
}
