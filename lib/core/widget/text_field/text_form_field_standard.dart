import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';

typedef StringFunction = String? Function(String? value);
class TextFormFieldStandard extends StatelessWidget {
  final TextEditingController? tfController;
  final String? hintText;
  final String? labelText;
  final double? height;
  final double? width;
  final int? maxLines;
  final bool? upLabel;
  final bool? filled;
  final bool? enabled;
  final Color? filledColor;
  final TextInputType? keyboardType;
  final StringFunction? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  bool? obscureText;
  TextFormFieldStandard({Key? key,this.height,this.width,this.tfController,this.hintText,this.labelText,this.maxLines,this.keyboardType,required this.validator,
    this.upLabel,this.filled,this.filledColor,this.enabled,this.prefixIcon,this.suffixIcon,this.initialValue,this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        initialValue:initialValue ?? null,
        maxLines:maxLines,
        controller:tfController,
        autocorrect: false,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabled: enabled ?? true,
          hintText: hintText,
          floatingLabelBehavior: upLabel==false ? FloatingLabelBehavior.auto : FloatingLabelBehavior.always ,
          //floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(labelText ?? '',style: TextStyle(fontFamily: 'bozon',color: ColorConstants.instance.customBlueColor,fontWeight: FontWeight.w500),),
          labelStyle: TextStyle(fontFamily: 'bozon',),
          filled: filled ?? true,
          fillColor: filledColor ?? Colors.white,
          hintStyle: TextStyle(fontFamily: 'bozon',),
          border:OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMin),
          disabledBorder:OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMin,borderSide: BorderSide(width: 0.5)),
        ) ,
        validator:(tfInput){
          print("standard $tfInput");
          return validator!(tfInput);
        },
      ),
    );
  }
}
