import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_standard.dart';

class TextFormFieldEmail extends StatelessWidget {
  final TextEditingController? tfController;
  final String? hintText;
  final bool? validator;
  const TextFormFieldEmail({Key? key,this.tfController,this.hintText,this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldStandard(
      height: 60,
      maxLines:1,
      hintText: hintText,
      tfController:tfController,
      keyboardType: TextInputType.emailAddress,
      validator:(tfInput){
        if(tfInput!.isEmpty){
          if(validator==true) {
            return "${LocaleKeys.emptyFieldError.locale}";
          }
          else{return null;}
        }
        else if(EmailValidator.validate(tfInput)==false){
          return "${LocaleKeys.emailRegex.locale}";
        }
        return null;
      },
    );
  }
}
