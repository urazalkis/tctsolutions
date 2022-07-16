import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_standard.dart';

class TextFormFieldTransparent extends StatelessWidget {
  final TextEditingController? tfController;
  final String? hintText;
  final double? height;
  final double? width;
  final StringFunction? validator;
  const TextFormFieldTransparent({Key? key,this.height,this.width,this.tfController,this.hintText
  ,this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller:tfController,
        autocorrect: false,
        keyboardType: TextInputType.text,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box,color: ColorConstants.instance.customBlueColor),
          hintText: hintText,
          hintStyle:TextStyle(fontFamily: 'Bozon',fontSize:18),
          filled: true,
          fillColor: Colors.white.withOpacity(0.6),
          border:OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMedium),
        ) ,

        validator: (tfInput){
          if(validator==null) {
            if (tfInput!.isEmpty) {
              return "${LocaleKeys.emptyFieldError.locale}";
            }
            return null;
          }
          else{
            validator!(tfInput);
          }
        },
      ),
    );
  }
}
