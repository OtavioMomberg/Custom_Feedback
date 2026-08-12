## custom_feedback

Custom feedback package for Flutter, where you can customize easily some feedback tools such as: 
- Customizable dialogs
- Automatically closing dialogs
- Optional dialog close button
- Dialog actions
- Generic dialog return values
- Customizable Snackbars
- Floating or fixed Snackbars
- SnackBar actions
- Custom SnackBar close icon

## Getting started

To get started, you need to add custom_feedback to your project. Follow the steps below:
1. Open the terminal in your project root. You can do this by pressing ```Alt+F12``` in Android Studio or ```Ctrl+'``` in VS Code.
2. Run the following command:
```dart
flutter pub add custom_feedback
```

## Usage

Import ```custom_feedback.dart```

```dart
import 'package:custom_feedback/custom_feedback.dart';
```

### Dialog Example

The dialog uses the Flutter mechanism ```showDialog``` to display the dialog on the screen. In ```CustomFeedback.customDialog``` you can focus only on the design of the dialog.

```dart
CustomFeedback.customDialog(context: context);
```

Here are all the parameters supported by ```CustomFeedback.customDialog``` method:

```dart
required BuildContext context,
Widget title,
Widget content,
bool closeIcon,
bool barrierDismissible,
Color iconColor,
Color backgroundColor,
Color shadowColor,
ShapeBorder shape,
Duration? closeTime,
MainAxisAlignment? actionsAlignment,
EdgeInsetsGeometry? actionsPadding,
List<Widget>? actions,
```

**context -** the context necessary to build the dialog

**title -** content on the top of the dialog (usually a ```Text("")```)

**content -** defines the main content of the dialog

**closeIcon -** controls if an ```IconButton()``` will be displayed on the right of **title** to work as a close button

**barrierDismissible -** controls whether is possible to close or not the dialog through click on the screen

**iconColor -** defines a color to the icon used with the **closeIcon** property

**backgroundColor -** defines the background color of the dialog

**shadowColor -** applies the dialog shadow color

**shape -** builds the shape of the dialog

**closeTime -** sets a time to the dialog close automatically

**actionsAlignment -** provides alignment properties for the action content

**actionsPadding -** applies padding in the actions area

**actions -** include a ```List<Widget>``` on the bottom of the dialog

### SnackBar Example

The SnackBar uses the Flutter mechanism ```ScaffoldMessenger``` to display the SnackBar on the screen. In ```CustomFeedback.customSnackBar``` you can focus only on the design of the SnackBar.

```dart
CustomFeedback.customSnackBar(context: context);
```

Here are all the parameters supported by ```CustomFeedback.customSnackBar``` method:

```dart
required BuildContext context,
Widget content,
Color backgroundColor,
ShapeBorder shape,
bool showCloseIcon,
Color closeIconColor,
Duration duration,
SnackBarBehavior behavior,
EdgeInsetsGeometry? margin,
EdgeInsetsGeometry? padding,
SnackBarAction? action,
```

**context -** the context necessary to display the SnackBar

**content -** defines the main content of the SnackBar

**backgroundColor -** defines the background color of the SnackBar

**shape -** builds the shape of the SnackBar

**showCloseIcon -** controls if a close icon will be displayed on the right side of the SnackBar

**closeIconColor -** defines a color to the close icon used with the **showCloseIcon** property

**duration -** defines how long the SnackBar will remain visible

**behavior -** defines how the SnackBar is displayed. It can be either ```SnackBarBehavior.fixed``` or ```SnackBarBehavior.floating```

**margin -** applies a margin around the SnackBar. This property is especially useful when using ```SnackBarBehavior.floating```

**padding -** applies padding to the content area of the SnackBar

**action -** adds a ```SnackBarAction``` to the SnackBar, allowing the user to perform an action while the SnackBar is visible


## License

This package is licensed under the MIT License.