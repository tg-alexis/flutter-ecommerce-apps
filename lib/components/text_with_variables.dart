import 'package:flutter/material.dart';

class TextComportWithVariable extends StatelessWidget {
  const TextComportWithVariable({
    super.key,
    required this.label,
    required this.name,
    this.style,
  });
  final String label;
  final String name;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(label), Text(name, style: style)]);
  }
}
