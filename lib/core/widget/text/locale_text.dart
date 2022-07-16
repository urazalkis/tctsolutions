import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';

class TextLocale extends StatelessWidget {
  final String text;
  final TextStyle? style;
  TextLocale({Key? key,required this.text,this.style,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text.locale,
        style:style,
    );
  }
}
