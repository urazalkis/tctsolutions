import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/SizedBox/sized_box_height_low.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_login_button.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_password_transparent.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_standard.dart';

class TextFormFieldProfileAuthenticate extends StatelessWidget {
  final TextEditingController? tfController;
  final TextEditingController? tf1Controller;
  final TextEditingController? tf2Controller;
  final TextEditingController? tf3Controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;
  final bool? upLabel;
  final bool? enabled;
  final int? maxLines;
  late bool isEditing;
  final VoidCallback changeEditingState;
  final Color? fillColor;
  final String? textField1Hint;
  final String? textField2Hint;
  final String? textField3Hint;
  final String? initialValue;
  bool? isAuthenticateTextObscure;
  final VoidCallback changeObscureState;
  VoidCallback onPressedChange;
  late bool isLoading;

  TextFormFieldProfileAuthenticate({Key? key,required this.isEditing,required this.changeEditingState,this.enabled,this.tfController,this.tf1Controller,this.tf2Controller,this.tf3Controller,
    this.hintText, this.labelText,this.keyboardType,this.height,this.width,this.upLabel,this.textField1Hint,this.textField2Hint,this.textField3Hint
    ,this.maxLines,this.fillColor,this.initialValue,required this.changeObscureState,this.isAuthenticateTextObscure,required this.onPressedChange,required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormFieldStandard(
                  obscureText: true,
                  enabled: false,
                  height: height ?? 60,
                  width: width,
                  maxLines:1,
                  tfController:tfController,
                  hintText: hintText,
                  labelText: labelText,
                  upLabel: true,
                  keyboardType: keyboardType,
                  filled: true,
                  filledColor: enabled==false ? Color(0xFFF9D494) : Colors.white,
                  validator: (String? value) {  return null;},
                ),
              ),
              GestureDetector(
                onTap: (){
                  changeEditingState();
                },
                child: SizedBox(
                  height: context.screenHeight/15,
                  width: context.screenWidth/10,
                  child: Icon(
                    isEditing ? Icons.close : Icons.mode_edit ,

                    color: ColorConstants.instance.customBlueColor,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Visibility(
                  visible:isEditing,
                  child: TextFormFieldPasswordTransparent(
                    tfController: tf1Controller,
                    width: context.screenWidth/1.5,
                    hintText: textField1Hint,
                    hintFontSize: 14,
                    showPassword: isAuthenticateTextObscure ?? false, showPasswordState:() {changeObscureState();},
                    validator: (tfInput){
                      if (tfInput!.isEmpty) {
                        return "${LocaleKeys.emptyFieldError.locale}";
                      }
                      else if(tfInput!=LocaleManager.instance.getStringValue(PreferencesKeys.userName)){
                        {
                          return "Kullanıcı adınız yanlış!";
                        }
                      }

                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Visibility(
                  visible:isEditing,
                  child: TextFormFieldPasswordTransparent(
                    tfController: tf2Controller,
                    width: context.screenWidth/1.5,
                    hintText: textField2Hint,
                    hintFontSize: 14,
                    showPassword: isAuthenticateTextObscure ?? false, showPasswordState:() {changeObscureState();},
                    validator: (tfInput){
                      if (tfInput!.isEmpty) {
                        return "${LocaleKeys.emptyFieldError.locale}";
                      }
                      else if(tfInput!=tf3Controller!.text) {
                        {
                          return "Kullanıcı adları eşleşmiyor!";
                        }
                      }

                    },
                  ),

                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Visibility(
                  visible:isEditing,
                  child: TextFormFieldPasswordTransparent(
                    tfController: tf3Controller,
                    width: context.screenWidth/1.5,
                    hintText: textField3Hint,
                    hintFontSize: 12,
                    showPassword: isAuthenticateTextObscure ?? false, showPasswordState:() {changeObscureState();},
                    validator: (tfInput){
                      if (tfInput!.isEmpty) {
                        print("BOŞ");
                        return "${LocaleKeys.emptyFieldError.locale}";
                      }
                      else if(tfInput!=tf2Controller!.text) {
                        {
                        print("BOŞ DEĞİL");
                          return "Kullanıcı adları eşleşmiyor!";
                        }
                      }
                      else{ print("else");}
                      }

                  ),
                ),
              ),
            ],
          ),

          SizedBoxHeightLow(),
          Visibility(
              visible:isEditing,
              child: Padding(
                padding: EdgeInsets.only(bottom:isEditing==true ? 10 : 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedCircularLoginButton(
                      width:context.screenWidth/3,
                      //primaryColor:ColorConstants.instance.customBlueColor,
                      primaryColor:Colors.green,
                      title: "Change",
                    onPressed:  isLoading ? null : onPressedChange,
                      isLoading: isLoading,
                  ),
                ),
              ))

        ],

      ),
    );
  }
}
