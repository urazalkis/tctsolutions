import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_standard.dart';

class TextFormFieldProfile extends StatelessWidget {
  final TextEditingController? tfController;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;
  final bool? validator;
  final bool? upLabel;
  final bool? enabled;
  final int? maxLines;
  final Color? fillColor;
  const TextFormFieldProfile({Key? key,this.enabled,this.tfController,this.hintText,this.labelText,this.keyboardType,this.height,
    this.width,this.validator,this.upLabel
    ,this.maxLines,this.fillColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldStandard(
      enabled: enabled,
      height: height ?? 60,
      width: width,
      maxLines:maxLines,
      tfController:tfController,
      hintText: hintText,
      labelText: labelText,
      upLabel: true,
      keyboardType: keyboardType,
      filled: true,
      //filledColor: enabled==false ? Color(0xFFF9D494) : Colors.white,
      filledColor:Colors.transparent,
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
