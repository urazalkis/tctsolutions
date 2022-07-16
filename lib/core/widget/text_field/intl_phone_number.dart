import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';

import '../../init/language/locale_keys.g.dart';


class IntlPhoneNumber extends StatefulWidget {
  final TextEditingController? tfController;
  final bool? filled;
  final bool? validator;
  final String? hintText;
  final ValueChanged<String> onInputChanged;
   IntlPhoneNumber({Key? key,this.tfController,this.filled,this.validator,this.hintText,required this.onInputChanged}) : super(key: key);

  @override
  _IntlPhoneNumberState createState() => _IntlPhoneNumberState();
}

class _IntlPhoneNumberState extends State<IntlPhoneNumber> {
  String? isoCode= 'DE';
  bool onInputValidated=false;
  @override
  Widget build(BuildContext context) {
    return  InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        widget.onInputChanged(number.phoneNumber!);
        setState(() {
          isoCode=number.isoCode;
           print(isoCode);
        });
      },
      onInputValidated: (bool value) {
        setState(() {
          onInputValidated=value;
        });
        print(onInputValidated);
      },
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: true,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: TextStyle(color: Colors.black),
      // initialValue: number,
      textFieldController:widget.tfController,
      formatInput: true,
      keyboardType: TextInputType.number,
      inputDecoration: InputDecoration(
          hintText:widget.hintText,
          border:OutlineInputBorder(
              borderRadius:BorderConstant.instance.radiusAllCircularMin),
          filled:widget.filled,fillColor: Colors.white),
     //inputBorder: OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMin),
      initialValue: PhoneNumber(isoCode:isoCode),
      validator:(tfInput){
        if(widget.validator==true) {
          if (tfInput!.isEmpty) {
            return "${LocaleKeys.emptyFieldError.locale}";
          }
          else if(onInputValidated==false){
            return "Invalid phone number";
          }
        }
        else {
          return null;
        }
        return null;
      },


    );
  }
}
