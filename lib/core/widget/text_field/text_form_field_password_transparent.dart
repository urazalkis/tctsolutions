import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_standard.dart';

class TextFormFieldPasswordTransparent extends StatefulWidget {
  final TextEditingController? tfController;
  final String? hintText;
  late bool showPassword;
  final VoidCallback showPasswordState;
  final double? height;
  final double? width;
  final double?  hintFontSize;
  final String? initialValue;
  final StringFunction? validator;
  TextFormFieldPasswordTransparent({Key? key,this.initialValue,this.height,this.width,this.tfController,this.hintText,this.hintFontSize,
    required this.showPassword,required this.showPasswordState ,this.validator}) : super(key: key);

  @override
  _TextFormFieldPasswordTransparentState createState() => _TextFormFieldPasswordTransparentState();
}

class _TextFormFieldPasswordTransparentState extends State<TextFormFieldPasswordTransparent> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:widget.height,
      width: widget.width,
      child: TextFormField(
        initialValue:widget.initialValue,
        controller:widget.tfController,
        autocorrect: false,
        keyboardType: TextInputType.visiblePassword,
        obscureText: !widget.showPassword,
        decoration: buildInputDecoration() ,
        validator: (tfInput){
          if(widget.validator==null) {
            if (tfInput!.isEmpty) {
              return "${LocaleKeys.emptyFieldError.locale}";
            }
            return null;
          }
          else{
            widget.validator!(tfInput);
          }
        },
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      prefixIcon: Icon(Icons.lock,color: ColorConstants.instance.customBlueColor),
      hintText: widget.hintText,
      hintStyle:TextStyle(fontFamily: 'Bozon',fontSize:widget.hintFontSize ?? 18),
      filled: true,
      fillColor: Colors.white.withOpacity(0.6),
      border:OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMedium),
      suffixIcon: GestureDetector(
        onTap: (){
          widget.showPasswordState();
        },
        child: Icon(
          widget.showPassword ? Icons.visibility_off : Icons.visibility ,
          color: ColorConstants.instance.customBlueColor,
        ),
      ),
    );
  }
}


