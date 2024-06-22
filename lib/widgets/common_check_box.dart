import 'package:flutter/material.dart';

class CommonCheckBox extends StatefulWidget {
  final bool initValue;
  final Function(bool) onChanged;

  const CommonCheckBox(
      {super.key, required this.initValue, required this.onChanged});

  @override
  _CommonCheckBoxState createState() => _CommonCheckBoxState();
}

class _CommonCheckBoxState extends State<CommonCheckBox> {
  late bool isChecked = widget.initValue;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (enable) {
        setState(() {
          isChecked = enable ?? false;
          widget.onChanged(isChecked);
        });
      },
    );
  }
}
