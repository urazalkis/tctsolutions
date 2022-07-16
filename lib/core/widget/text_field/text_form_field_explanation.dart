import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_standard.dart';

class TextFormFieldExplanation extends StatelessWidget {
  final TextEditingController? tfController;
  final String? hintText;
  final String? labelText;
  final bool? upLabel;
  const TextFormFieldExplanation({Key? key,this.tfController,this.hintText,this.labelText,this.upLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldStandard(
      height: 100,
      maxLines:5,
      tfController:tfController,
      hintText: hintText,
      labelText: labelText,
      upLabel: upLabel,
      validator:
        (String? value) {

        },
    );
  }
}
