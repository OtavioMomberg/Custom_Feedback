# custom_feedback

A Flutter package for easily displaying and customizing dialogs and SnackBars.

The package provides both **fully customizable feedback components** and **ready-to-use dialogs** for common situations.

## Features

- Fully customizable dialogs
- Ready-to-use standard dialogs
- Ready-to-use error dialogs
- Ready-to-use confirmation dialogs
- Ready-to-use loading dialogs
- Automatically closing dialogs
- Optional dialog close button
- Dialog actions
- Generic dialog return values
- `onOpen` callbacks for dialogs
- Customizable SnackBars
- Floating or fixed SnackBars
- SnackBar actions
- Custom SnackBar close icon

## Getting started

To get started, add `custom_feedback` to your Flutter project.

### Installation

1. Open the terminal in your project root.

2. Run:

```bash
flutter pub add custom_feedback
```

### Import

Import the package in the file where you want to use it:

```dart
import 'package:custom_feedback/custom_feedback.dart';
```

# Usage

The `CustomFeedback` class provides methods for displaying dialogs and SnackBars.

## Raw Dialog

The `rawDialog` method provides full control over the dialog appearance and behavior.

It uses Flutter's `showDialog` mechanism internally, allowing you to customize the dialog according to your needs.

### Basic example

```dart
CustomFeedback.rawDialog(
  context: context,
);
```

### Example with customization

```dart
CustomFeedback.rawDialog(
  context: context,
  title: const Text("Hello"),
  content: const Text("This is a custom dialog."),
  closeIcon: true,
  backgroundColor: Colors.white,
  iconColor: Colors.black,
);
```

### Parameters

| Parameter | Description |
|---|---|
| `context` | The `BuildContext` required to display the dialog. |
| `title` | Widget displayed at the top of the dialog. |
| `content` | Main content of the dialog. |
| `closeIcon` | Defines whether a close button is displayed next to the title. |
| `barrierDismissible` | Defines whether the dialog can be dismissed by tapping outside it. |
| `iconColor` | Defines the color of the close icon. |
| `backgroundColor` | Defines the dialog background color. |
| `shadowColor` | Defines the dialog shadow color. |
| `shape` | Defines the dialog shape. |
| `closeTime` | Defines how long the dialog remains open before closing automatically. |
| `actionsAlignment` | Defines the alignment of the dialog actions. |
| `actionsPadding` | Defines the padding around the dialog actions. |
| `actions` | Defines the widgets displayed in the dialog actions area. |
| `onOpen` | Asynchronous callback executed after the dialog is displayed. |

### Generic return value

`rawDialog` supports generic return values.

```dart
final result = await CustomFeedback.rawDialog<bool>(
  context: context,
  title: const Text("Question"),
  content: const Text("Do you want to continue?"),
  actions: [
    TextButton(
      onPressed: () => Navigator.pop(context, true),
      child: const Text("Yes"),
    ),
  ],
);
```

The returned value is the value passed to `Navigator.pop()`.

### `closeTime` and `onOpen`

The `closeTime` parameter can be used to automatically close the dialog:

```dart
CustomFeedback.rawDialog(
  context: context,
  closeTime: const Duration(seconds: 3),
);
```

The `onOpen` callback can be used when an asynchronous operation should be executed while the dialog remains open:

```dart
await CustomFeedback.loadingDialog(
  context: context,
  onOpen: () async {
    await Future.delayed(const Duration(seconds: 5));
  },
);
```

When `onOpen` is provided, `closeTime` is ignored.

> If `closeTime` is used, it is recommended to set `barrierDismissible` to `false` to prevent the user from closing the dialog manually.

---

# Standard Dialog

The `standardDialog` method provides a simple, ready-to-use dialog for common situations.

```dart
CustomFeedback.standardDialog(
  context: context,
  title: "Information",
  content: "This is a standard dialog.",
);
```

### Customization

The text and colors can be customized:

```dart
CustomFeedback.standardDialog(
  context: context,
  title: "Information",
  content: "Your operation was completed.",
  fontColor: Colors.black,
  backgroundColor: Colors.white,
);
```

The standard dialog includes:

- A title
- A text content
- A close button
- Customizable font color
- Customizable background color

---

# Error Dialog

The `errorDialog` method provides a ready-to-use dialog for displaying errors.

```dart
CustomFeedback.errorDialog(
  context: context,
);
```

By default, it displays an error title and automatically closes after 3 seconds.

### Customization

```dart
CustomFeedback.errorDialog(
  context: context,
  title: "⚠️ Error ⚠️",
  content: "Unable to complete the operation.",
  fontColor: Colors.red,
  backgroundColor: Colors.white,
  closeTime: const Duration(seconds: 5),
);
```

The `closeTime` parameter controls how long the error dialog remains visible.

---

# Confirm Dialog

The `confirmDialog` method provides a ready-to-use confirmation dialog with two buttons.

```dart
final result = await CustomFeedback.confirmDialog(
  context: context,
  title: "Confirmation",
  content: "Are you sure you want to continue?",
);
```

The dialog provides two options:

- **No** → returns `false`
- **Yes** → returns `true`

If the dialog is dismissed without selecting an option, the result can be `null`.

### Example

```dart
final result = await CustomFeedback.confirmDialog(
  context: context,
  title: "Delete item",
  content: "Are you sure you want to delete this item?",
);

if (result == true) {
  // Delete item
}
```

### Customization

The buttons and dialog colors can be customized:

```dart
CustomFeedback.confirmDialog(
  context: context,
  title: "Delete item",
  content: "This action cannot be undone.",
  fontColor: Colors.black,
  backgroundColor: Colors.white,
  buttonColor: Colors.red,
  buttonFontColor: Colors.white,
);
```

---

# Loading Dialog

The `loadingDialog` method provides a ready-to-use loading dialog containing a `CircularProgressIndicator`.

```dart
CustomFeedback.loadingDialog(
  context: context,
);
```

By default, the dialog closes after 3 seconds.

### Custom duration

```dart
CustomFeedback.loadingDialog(
  context: context,
  title: "Loading data...",
  closeTime: const Duration(seconds: 5),
);
```

### Using `onOpen`

For operations where the dialog should remain open until an asynchronous task is completed, use `onOpen`.

```dart
await CustomFeedback.loadingDialog(
  context: context,
  title: "Loading data...",
  onOpen: () async {
    await Future.delayed(const Duration(seconds: 5));
  },
);
```

When `onOpen` is provided, the dialog remains open until the returned `Future` is completed.

The `closeTime` parameter is ignored when `onOpen` is provided.

### Generic return value

`loadingDialog` also supports generic return values when using `onOpen`.

```dart
final result = await CustomFeedback.loadingDialog<String>(
  context: context,
  onOpen: () async {
    await Future.delayed(const Duration(seconds: 2));
    return "Finished";
  },
);
```

---

# SnackBar

The `snackBar` method provides a customizable SnackBar using Flutter's `ScaffoldMessenger`.

### Basic example

```dart
CustomFeedback.snackBar(
  context: context,
);
```

### Customization

```dart
CustomFeedback.snackBar(
  context: context,
  content: const Text("Operation completed!"),
  backgroundColor: Colors.green,
  duration: const Duration(seconds: 3),
);
```

### Parameters

| Parameter | Description |
|---|---|
| `context` | The `BuildContext` required to display the SnackBar. |
| `content` | Main content displayed inside the SnackBar. |
| `backgroundColor` | Defines the SnackBar background color. |
| `shape` | Defines the SnackBar shape. |
| `showCloseIcon` | Defines whether a close icon is displayed. |
| `closeIconColor` | Defines the close icon color. |
| `duration` | Defines how long the SnackBar remains visible. |
| `behavior` | Defines how the SnackBar is displayed: `fixed` or `floating`. |
| `margin` | Defines the margin around the SnackBar. |
| `padding` | Defines the padding inside the SnackBar. |
| `action` | Adds a `SnackBarAction` to the SnackBar. |

### Floating SnackBar

```dart
CustomFeedback.snackBar(
  context: context,
  content: const Text("Hello!"),
  behavior: SnackBarBehavior.floating,
  margin: const EdgeInsets.all(10),
);
```

### SnackBar action

```dart
CustomFeedback.snackBar(
  context: context,
  content: const Text("Item deleted"),
  action: SnackBarAction(
    label: "UNDO",
    onPressed: () {
      // Restore item
    },
  ),
);
```

---

# License

This package is licensed under the MIT License.