import 'package:flutter/material.dart';

import '../../constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key,
    required this.textEditingController,
    this.maxLines = 1,
    this.height = 40, this.textInputType = TextInputType.text,});

  final TextEditingController textEditingController;
  final int? maxLines;
  final double? height;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        maxLines: maxLines,
        keyboardType:textInputType,
        controller: textEditingController,
        style: fTextStyle,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
