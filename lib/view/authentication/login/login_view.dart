import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/language_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_icon_button.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_login_button.dart';
import 'package:motaperp_tctsolutions/core/widget/date_time_picker/date_picker.dart';
import 'package:motaperp_tctsolutions/core/widget/date_time_picker/time_picker.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';
import 'package:motaperp_tctsolutions/core/widget/popup_menu_button/language_popup_menu.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/intl_phone_number.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_email.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_explanation.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_password_transparent.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_register.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_transparent.dart';
import 'package:motaperp_tctsolutions/product/widget/alert_dialog/alert_dialog_register.dart';
import 'package:motaperp_tctsolutions/product/widget/slider/carousel_slider.dart';
import 'package:motaperp_tctsolutions/view/create_request/request_view_model.dart';
import 'package:provider/src/provider.dart';
import '../../../core/widget/alertDialog/alert_dialog_no_connection.dart';
import 'login_view_model.dart';
import 'dart:ui' as UI;

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
      init: (viewModel) {
        context.read<LoginViewModel>().setContext(context);
        context.read<LoginViewModel>().init();
      },
        onPageBuilder: (BuildContext context, LoginViewModel viewModel) => Scaffold(
          resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () => NavigationService.instance.quitApp(),
        child:Stack(
          children: [
            Positioned.fill(
              child: CarouselSliderCustom(
                items: viewModel.imageSliderList,
              ),
            ),
            Center(
        child: Padding(
        padding: EdgeInsets.only(left:context.screenWidth/8,right: context.screenWidth/8,bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Expanded(
            flex:15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 10,
                  child: Form(
                    key: context.watch<LoginViewModel>().loginKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex:1,
                          child:LanguagePopupMenu(
                            color: Colors.white70,
                            selectedValue:context.watch<LoginViewModel>().selectedLanguage,
                            onChanged: (selectedValue) async {
                              await selectedValue==1 ? context.setLocale(LanguageManager.instance.enLocale) : selectedValue==3 ? context.setLocale(LanguageManager.instance.trLocale)
                                  : selectedValue==2 ? context.setLocale(LanguageManager.instance.gerLocale) :  context.setLocale(LanguageManager.instance.trLocale);
                              context.read<LoginViewModel>().changeSelectedLanguage(selectedValue!);
                            },
                            initialValue: context.watch<LoginViewModel>().selectedLanguageValue,
                          ),
                        ),
                        Flexible(flex:3,child: ImageWidget(iconUrl: UrlIcon.instance.appLogoUrl, height: context.screenWidth/5,)),
                        Flexible(flex:3,child: TextFormFieldTransparent(tfController:context.watch<LoginViewModel>().userNameController,hintText: "${LocaleKeys.login_userName.locale}",)),
                        Flexible(flex:3,child: TextFormFieldPasswordTransparent(tfController: context.watch<LoginViewModel>().passwordController,
                          hintText: "${LocaleKeys.login_password.locale}", showPasswordState: () {context.read<LoginViewModel>().changeShowPassword();}, showPassword: context.watch<LoginViewModel>().showPassword,)),
                        Flexible(
                          flex:3,
                          child: FittedBox(
                            child: ElevatedCircularLoginButton(width:context.screenWidth/2.5, onPressed:(){context.read<LoginViewModel>().fetchLoginService();},
                              title: "${LocaleKeys.login_logIn.locale}",primaryColor:ColorConstants.instance.customBlueColor,isLoading: context.watch<LoginViewModel>().isLoading,),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            "${LocaleKeys.or.locale}",style: TextStyle(fontSize: 14,fontFamily: 'Bozon',color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500,decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Flexible(
            flex:4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: FittedBox(
                    child: Directionality(
                      textDirection: UI.TextDirection.rtl,
                      child: ElevatedCircularIconButton(
                        width:context.screenWidth/2.5,
                        label: Text('${LocaleKeys.createRequest.locale}'),
                        //color: Color(0xFF234d9b),
                        color: ColorConstants.instance.customBlueColor,
                        icon: Icon(Icons.create_new_folder,color: Colors.white,),
                        onPressed: () {
                          showDialog(context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  scrollable: true,
                                  title:Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${LocaleKeys.createRequest.locale}',
                                        style: TextStyle(color: ColorConstants.instance.customBlueColor),),
                                      Icon(Icons.create,color:ColorConstants.instance.customBlueColor,),
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius:BorderConstant.instance.radiusAllCircularMedium),
                                  backgroundColor:ColorConstants.instance.customGrey2Color,
                                  actions: [
                                    Align(
                                      alignment:Alignment.center,
                                      child: ElevatedCircularLoginButton(width:context.screenWidth/3, onPressed:(){
                                        context.read<RequestViewModel>().fetchRequestService();
                                      },
                                        title: "${LocaleKeys.requestBusiness_send.locale}",primaryColor:ColorConstants.instance.customBlue2Color,
                                        isLoading: context.watch<RequestViewModel>().isLoading,),
                                    ),
                                  ],
                                  content: SizedBox(
                                    height: context.screenHeight*1.2,
                                    width: context.screenWidth*1.2,
                                    child: Center(
                                      child: Form(
                                        key: context.read<RequestViewModel>().formKey,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextFormFieldRegister(
                                              validator: true,
                                              hintText:'${LocaleKeys.register_business_companyName.locale}',tfController:context.watch<RequestViewModel>().companyNameController,
                                              keyboardType: TextInputType.text,
                                            ),
                                            TextFormFieldRegister(
                                              validator: true,
                                              hintText:'${LocaleKeys.register_business_authorizedName.locale}',tfController:context.watch<RequestViewModel>().authorizedNameController,
                                              keyboardType: TextInputType.text,
                                            ),
                                            IntlPhoneNumber(
                                              hintText:LocaleKeys.register_employee_tel.locale,
                                              validator: true,
                                              tfController:context.watch<RequestViewModel>().phoneController,
                                              filled: true,
                                              onInputChanged: (String value){
                                                context.read<RequestViewModel>().changeNumber(value);
                                              },
                                            ),
                                            TextFormFieldEmail(hintText:LocaleKeys.register_employee_email.locale,tfController:context.watch<RequestViewModel>().emailController,validator: true,),
                                            TextFormFieldRegister(
                                              validator: true,
                                              width:250,hintText:'${LocaleKeys.requestBusiness_employeeCount.locale}',tfController:context.watch<RequestViewModel>().employeeCountController,
                                              keyboardType: TextInputType.number,
                                            ),


                                            DatePickerCustom(
                                              locale: context.locale.languageCode=='tr' ? LocaleType.tr : context.locale.languageCode=='en' ? LocaleType.en : context.locale.languageCode=='de' ? LocaleType.de : LocaleType.en,
                                              labelText:LocaleKeys.requestBusiness_pickMinDate.locale,
                                              selectedDate:context.watch<RequestViewModel>().selectedDateMin,
                                              onConfirm: (selectedDate){
                                                context.read<RequestViewModel>().changeSelectedDateMin(selectedDate);
                                              },
                                            ),
                                            DatePickerCustom(
                                              locale: context.locale.languageCode=='tr' ? LocaleType.tr : context.locale.languageCode=='en' ? LocaleType.en : context.locale.languageCode=='de' ? LocaleType.de : LocaleType.en,
                                              labelText:LocaleKeys.requestBusiness_pickMaxDate.locale,
                                              selectedDate:context.watch<RequestViewModel>().selectedDateMax,
                                              onConfirm: (selectedDate){
                                                context.read<RequestViewModel>().changeSelectedDateMax(selectedDate);
                                                print("max date ${context.read<RequestViewModel>().selectedDateMax}");
                                              },
                                            ),
                                            TimePickerCustom(
                                              locale: context.locale.languageCode=='tr' ? LocaleType.tr : context.locale.languageCode=='en' ? LocaleType.en : context.locale.languageCode=='de' ? LocaleType.de : LocaleType.en,
                                              labelText:LocaleKeys.requestBusiness_pickMinTime.locale,
                                              selectedDate:context.watch<RequestViewModel>().selectedTimeMin,
                                              onConfirm: (selectedTime){
                                                context.read<RequestViewModel>().changeSelectedTimeMin(selectedTime);
                                              },
                                            ),
                                            TimePickerCustom(
                                              locale: context.locale.languageCode=='tr' ? LocaleType.tr : context.locale.languageCode=='en' ? LocaleType.en : context.locale.languageCode=='de' ? LocaleType.de : LocaleType.en,
                                              labelText:LocaleKeys.requestBusiness_pickMaxTime.locale,
                                              selectedDate:context.watch<RequestViewModel>().selectedTimeMax,
                                              onConfirm: (selectedTime){
                                                context.read<RequestViewModel>().changeSelectedTimeMax(selectedTime);
                                              },
                                            ),


                                            TextFormFieldExplanation(
                                                hintText:LocaleKeys.register_employee_explanation.locale,
                                                tfController:context.watch<RequestViewModel>().explanationController),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                          );

                        },
                      ),
                    ),
                  ),
                ),
                Flexible(flex:1,
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () async {
                        showDialog(context: context, builder: (BuildContext context){return AlertDialogRegister();});
                      },
                      child:SizedBox(height:70,child: Text('${LocaleKeys.login_joinUs.locale}',style: TextStyle(fontFamily: 'Bozon',fontSize:18,decoration: TextDecoration.underline),textAlign: TextAlign.center,)),
                      // child: BoldText(text:'${LocaleKeys.welcome.locale}',underLine: true,color: Colors.black,fontSize: 20,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Powered By  ',style: TextStyle(fontFamily: 'Bozon',fontSize:12),),
                ImageWidget(iconUrl:  UrlIcon.instance.motapIconUrl, height: context.screenWidth/55),
              ],
            ),
          ),
        ],
      ),
    ),
    ),


          ],
        ),


      ),
    ),

    );

  }
}


