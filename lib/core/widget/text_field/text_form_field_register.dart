import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_standard.dart';

class TextFormFieldRegister extends StatelessWidget {
  final TextEditingController? tfController;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final double? width;
  final bool? validator;
  final bool? upLabel;
  const TextFormFieldRegister({Key? key,this.tfController,this.hintText,this.labelText,this.keyboardType,this.width,this.validator,this.upLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldStandard(
      height: 60,
      width: width,
      maxLines:1,
      tfController:tfController,
      hintText: hintText,
      labelText: labelText,
      upLabel: upLabel,
      keyboardType: keyboardType,
        validator:(tfInput){
        if(validator==true) {
          if (tfInput!.isEmpty) {
            return "${LocaleKeys.emptyFieldError.locale}";
          }
        }
        else {
          return null;
        }
        },
    );
  }
}
