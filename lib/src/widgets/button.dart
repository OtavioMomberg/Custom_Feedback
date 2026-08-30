import 'package:material_ui/material_ui.dart';

class Button extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final VoidCallback function;
  final double? height;

  const Button({
    required this.label,
    required this.color,
    required this.textColor,
    required this.function,
    this.height = 50,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: color,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: color),
          ),
          height: height,
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: textColor)
            )
          )
        )
      )
    );
  }
}
