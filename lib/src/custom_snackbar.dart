import 'package:material_ui/material_ui.dart';
import 'package:custom_feedback/src/models/snackbar_model.dart';

class CustomSnackbar {
  static void snackbar({
    required BuildContext context, 
    required SnackbarModel snackbarModel
  }) {
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: snackbarModel.content,
        backgroundColor: snackbarModel.backgroundColor,
        behavior: snackbarModel.behavior,
        margin: snackbarModel.margin,
        padding: snackbarModel.padding,
        shape: snackbarModel.shape,
        duration: snackbarModel.duration,
        showCloseIcon: snackbarModel.showCloseIcon,
        closeIconColor: snackbarModel.closeIconColor,
        action: snackbarModel.action,
      )
    );
  }
}