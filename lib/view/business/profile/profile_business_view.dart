import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/language_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/alertDialog/alert_dialog_error.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';
import 'package:motaperp_tctsolutions/core/widget/popup_menu_button/language_popup_menu.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_profile.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_profile_authenticate.dart';
import 'package:motaperp_tctsolutions/view/authentication/login/login_view_model.dart';
import 'package:motaperp_tctsolutions/view/business/profile/profile_business_state.dart';
import 'package:motaperp_tctsolutions/view/business/profile/profile_business_view_model.dart';
import 'package:provider/src/provider.dart';

import '../../../core/constant/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';

class ProfileBusinessView extends StatelessWidget {
  const ProfileBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileBusinessViewModel>(
      viewModel: ProfileBusinessViewModel(),
      init: (viewModel) {
        context.read<ProfileBusinessViewModel>().setContext(context);
        context.read<ProfileBusinessViewModel>().init();

      },
      onPageBuilder: (BuildContext context, ProfileBusinessViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop:() async {NavigationService.instance.navigateToPageClear(path:NavigationConstants.LOGIN); return true;},
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: double.infinity
              ),
              height: context.screenHeight*1.3,
              width:  context.screenWidth*1.3,
              decoration: ColorConstants.instance.registerBackgroundColor,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left:context.screenWidth/8,right: context.screenWidth/8),
                  child:BlocBuilder<ProfileBusinessViewModel,IProfileBusinessState>(
                    builder: (context,state){
                      if(state is ProfileBusinessError)
                        {
                            return AlertDialogError(
                              fontFamily: 'Bozon',
                              text:LocaleKeys.errorMessage.locale,
                              buttonText: LocaleKeys.okey.locale,
                            );

                        }
                      else {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${LocaleKeys.profile.locale}', style: TextStyle(
                                      fontFamily: 'Bozon',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),),
                                  ImageWidget(
                                      iconUrl: UrlIcon.instance.appLogo2Url,
                                      height: context.screenHeight / 15),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  /*  Flexible(
                               flex:1,
                               child: SizedBox(
                                 height: context.screenHeight/10,
                                 width:  context.screenWidth/5,
                                 child: CircleAvatar(
                                   radius: 120,
                                   backgroundImage: AssetImage(UrlIcon.instance.appLogoUrl),
                                 ),
                               ),
                             ),*/
                                  Flexible(
                                    flex: 8,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        LanguagePopupMenu(
                                          selectedValue:context.watch<LoginViewModel>().selectedLanguage,
                                          color:ColorConstants.instance.customBlueColor,
                                          onChanged: (selectedValue) async {
                                            await selectedValue==1 ? context.setLocale(LanguageManager.instance.enLocale) : selectedValue==3 ? context.setLocale(LanguageManager.instance.trLocale)
                                                : selectedValue==2 ? context.setLocale(LanguageManager.instance.gerLocale) :  context.setLocale(LanguageManager.instance.trLocale);
                                            context.read<LoginViewModel>().changeSelectedLanguage(selectedValue!);
                                            //
                                          }, initialValue: context.read<LoginViewModel>().selectedLanguageValue,
                                        ),
                                        TextFormFieldProfile(enabled: false,
                                          labelText: LocaleKeys
                                              .register_business_companyName
                                              .locale,
                                          hintText: "${LocaleManager.instance
                                              .getStringValue(
                                              PreferencesKeys.title)}",),
                                        TextFormFieldProfile(enabled: false,
                                          labelText: LocaleKeys
                                              .register_business_authorizedName
                                              .locale,
                                          hintText: "${LocaleManager.instance
                                              .getStringValue(
                                              PreferencesKeys.authorizedName)}",),
                                        TextFormFieldProfile(enabled: false,
                                          labelText: LocaleKeys.register_employee_tel
                                              .locale,
                                          hintText: "${LocaleManager.instance
                                              .getStringValue(
                                              PreferencesKeys.phoneCompany)}",),
                                        TextFormFieldProfile(enabled: false,
                                          labelText: LocaleKeys.register_business_city
                                              .locale,
                                          hintText: "${LocaleManager.instance
                                              .getStringValue(
                                              PreferencesKeys.city)}",),

                                        /*TextFormFieldProfile(enabled: false,labelText:LocaleKeys.register_employee_tel.locale,),
                               TextFormFieldProfile(enabled: false,labelText:LocaleKeys.register_business_fixedNo.locale,),
                               TextFormFieldProfile(enabled: false,labelText:LocaleKeys.register_employee_email.locale,),
                               TextFormFieldProfile(enabled: false,height: 100,maxLines: 5,labelText:LocaleKeys.register_employee_address.locale,),*/
                                        TextFormFieldProfileAuthenticate(
                                          tfController: context
                                              .read<ProfileBusinessViewModel>()
                                              .userNameController,
                                          tf1Controller: context
                                              .read<ProfileBusinessViewModel>()
                                              .tf1Controller,
                                          tf2Controller: context
                                              .read<ProfileBusinessViewModel>()
                                              .tf2Controller,
                                          tf3Controller: context
                                              .read<ProfileBusinessViewModel>()
                                              .tf3Controller,
                                          textField1Hint: LocaleKeys
                                              .login_userName.locale,
                                          textField2Hint: LocaleKeys
                                              .profileBusiness_newUserName
                                              .locale,
                                          textField3Hint: LocaleKeys
                                              .profileBusiness_newUserNameAgain
                                              .locale,
                                          labelText: LocaleKeys.login_userName
                                              .locale,
                                          changeEditingState: () {
                                            context
                                                .read<
                                                ProfileBusinessViewModel>()
                                                .isEditingPassword != true
                                                ?
                                            context.read<
                                                ProfileBusinessViewModel>()
                                                .changeUserNameEditState()
                                                : null;
                                          },
                                          changeObscureState: () {
                                            context.read<
                                                ProfileBusinessViewModel>()
                                                .changeObscureState();
                                          },
                                          isEditing: context
                                              .read<ProfileBusinessViewModel>()
                                              .isEditingUserName,
                                          isAuthenticateTextObscure: context
                                              .read<ProfileBusinessViewModel>()
                                              .isObscure,
                                          isLoading: context
                                              .read<ProfileBusinessViewModel>()
                                              .isUpdateLoading,
                                          onPressedChange: () {
                                            context.read<
                                                ProfileBusinessViewModel>()
                                                .fetchUpdateResult(
                                                'userName');
                                          },
                                        ),
                                        TextFormFieldProfileAuthenticate(
                                          tfController: context
                                              .read<ProfileBusinessViewModel>()
                                              .passwordController,
                                          tf1Controller: context
                                              .read<ProfileBusinessViewModel>()
                                              .tf1Controller,
                                          tf2Controller: context
                                              .read<ProfileBusinessViewModel>()
                                              .tf2Controller,
                                          tf3Controller: context
                                              .read<ProfileBusinessViewModel>()
                                              .tf3Controller,
                                          textField1Hint: LocaleKeys
                                              .login_password.locale,
                                          textField2Hint: LocaleKeys
                                              .profileBusiness_newPassword.locale,
                                          textField3Hint: LocaleKeys
                                              .profileBusiness_newPasswordAgain
                                              .locale,
                                          labelText: LocaleKeys.login_password
                                              .locale,
                                          changeEditingState: () {
                                            context
                                                .read<ProfileBusinessViewModel>()
                                                .isEditingUserName != true ?
                                            context.read<
                                                ProfileBusinessViewModel>()
                                                .changePasswordEditState() : null;
                                          },
                                          changeObscureState: () {
                                            context.read<
                                                ProfileBusinessViewModel>()
                                                .changeObscureState();
                                          },
                                          isEditing: context
                                              .read<ProfileBusinessViewModel>()
                                              .isEditingPassword,
                                          isAuthenticateTextObscure: context
                                              .read<ProfileBusinessViewModel>()
                                              .isObscure,
                                          isLoading: context
                                              .watch<ProfileBusinessViewModel>()
                                              .isUpdateLoading,
                                          onPressedChange: () {
                                            context.read<
                                                ProfileBusinessViewModel>()
                                                .fetchUpdateResult(
                                                'password');

                                          },
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),

                          ],
                        );
                      }
                  },
                  ),




                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

