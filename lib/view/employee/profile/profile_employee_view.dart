import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/language_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/alertDialog/alert_dialog_error.dart';
import 'package:motaperp_tctsolutions/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_tctsolutions/core/widget/popup_menu_button/language_popup_menu.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_profile.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_profile_authenticate.dart';
import 'package:motaperp_tctsolutions/view/authentication/login/login_view_model.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_state.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_view_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/src/provider.dart';

import '../../../core/constant/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../product/widget/app_bar/app_bar_custom.dart';

class ProfileEmployeeView extends StatelessWidget {
  const ProfileEmployeeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileEmployeeViewModel>(
      viewModel: ProfileEmployeeViewModel(),
      init: (viewModel) {
        context.read<ProfileEmployeeViewModel>().setContext(context);
        context.read<ProfileEmployeeViewModel>().init();

      },
      onPageBuilder: (BuildContext context, ProfileEmployeeViewModel viewModel) => Scaffold(
        appBar: AppBarCustom(title:LocaleKeys.profile.locale,),
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
    builder: (BuildContext context,BoxConstraints constraints){
      return SafeArea(
        child: WillPopScope(
          onWillPop:() async {NavigationService.instance.navigateToPageClear(path:NavigationConstants.LOGIN); return true;},
          child: BlocBuilder<ProfileEmployeeViewModel,IProfileEmployeeState>(
              builder: (context,state){
                if(state is ProfileInformationLoading)
                {
                  return CustomCircularProgressIndicator();
                }
                else if(state is ProfileEmployeeError){
                  return AlertDialogError(
                    fontFamily: 'Bozon',
                    text: LocaleKeys.errorMessage.locale,
                    buttonText: LocaleKeys.okey.locale,
                  );
                }
                else{
                  return SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity
                      ),
                      height:constraints.maxHeight<411 ? context.screenHeight*1.4 : constraints.maxHeight<470 ? context.screenHeight*1.3 :
                      constraints.maxHeight<596 ? context.screenHeight*1.15 : context.screenHeight,
                      width: context.screenWidth,
                      decoration: ColorConstants.instance.registerBackgroundColor,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: context.screenWidth / 8,
                              right: context.screenWidth / 8),
                          child: BlocBuilder<
                              ProfileEmployeeViewModel,
                              IProfileEmployeeState>(
                            builder: (context, state) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: FittedBox(
                                      child: CircularPercentIndicator(
                                        radius: 60.0,
                                        lineWidth: 15,
                                        animation: true,
                                        animationDuration: 600,
                                        percent: ((context
                                            .read<ProfileEmployeeViewModel>()
                                            .completedJobHour ?? 0 * 100) /
                                            (context
                                                .read<ProfileEmployeeViewModel>()
                                                .totalJobHour ?? 0)),
                                        animateFromLastPercent: true,
                                        center: (context.read<ProfileEmployeeViewModel>().totalJobHour ?? 0) <=(context.read<ProfileEmployeeViewModel>().completedJobHour??0) ? Text('${LocaleKeys.profileEmployee_completed.locale}',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,),) :
                                        Text("${context.read<ProfileEmployeeViewModel>().completedJobHour} ${LocaleKeys.profileEmployee_hours.locale} ${LocaleKeys.profileEmployee_completed.locale}",
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,),
                                        ),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: ColorConstants.instance
                                            .customBlueColor,
                                        header: Text('${context
                                            .read<ProfileEmployeeViewModel>()
                                            .totalJobHour} ${LocaleKeys
                                            .profileEmployee_hours.locale}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0),),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: LanguagePopupMenu(
                                        selectedValue: context
                                            .watch<LoginViewModel>()
                                            .selectedLanguage,
                                        color: ColorConstants.instance
                                            .customBlueColor,
                                        onChanged: (selectedValue) async {
                                          await selectedValue == 1
                                              ? context.setLocale(
                                              LanguageManager.instance.enLocale)
                                              : selectedValue == 3 ? context
                                              .setLocale(
                                              LanguageManager.instance.trLocale)
                                              : selectedValue == 2
                                              ? context.setLocale(
                                              LanguageManager.instance.gerLocale)
                                              : context.setLocale(
                                              LanguageManager.instance.trLocale);
                                          context.read<LoginViewModel>()
                                              .changeSelectedLanguage(
                                              selectedValue!);
                                          //
                                        }, initialValue: context
                                          .read<LoginViewModel>()
                                          .selectedLanguageValue,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 12,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        TextFormFieldProfile(enabled: false,
                                          labelText: LocaleKeys
                                              .register_employee_name
                                              .locale,
                                          hintText: "${LocaleManager.instance
                                              .getStringValue(
                                              PreferencesKeys.title)}",),
                                        TextFormFieldProfile(enabled: false,
                                          labelText: LocaleKeys
                                              .register_employee_tel
                                              .locale,
                                          hintText: "${LocaleManager.instance
                                              .getStringValue(
                                              PreferencesKeys.phoneEmployee)}",),
                                        TextFormFieldProfile(enabled: false,
                                          labelText: LocaleKeys
                                              .register_employee_profession.locale,
                                          hintText: "${LocaleManager.instance
                                              .getStringValue(
                                              PreferencesKeys.profession)}",),
                                        TextFormFieldProfileAuthenticate(
                                          tfController: context
                                              .read<ProfileEmployeeViewModel>()
                                              .userNameController,
                                          tf1Controller: context
                                              .read<ProfileEmployeeViewModel>()
                                              .tf1Controller,
                                          tf2Controller: context
                                              .read<ProfileEmployeeViewModel>()
                                              .tf2Controller,
                                          tf3Controller: context
                                              .read<ProfileEmployeeViewModel>()
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
                                                ProfileEmployeeViewModel>()
                                                .isEditingPassword != true
                                                ?
                                            context.read<
                                                ProfileEmployeeViewModel>()
                                                .changeUserNameEditState()
                                                : null;
                                          },
                                          changeObscureState: () {
                                            context.read<
                                                ProfileEmployeeViewModel>()
                                                .changeObscureState();
                                          },
                                          isEditing: context
                                              .read<ProfileEmployeeViewModel>()
                                              .isEditingUserName,
                                          isAuthenticateTextObscure: context
                                              .read<ProfileEmployeeViewModel>()
                                              .isObscure,
                                          isLoading: context
                                              .read<ProfileEmployeeViewModel>()
                                              .isUpdateLoading,
                                          onPressedChange: () {
                                            context.read<
                                                ProfileEmployeeViewModel>()
                                                .fetchUpdateResult(
                                                'userName');
                                          },
                                        ),
                                        TextFormFieldProfileAuthenticate(
                                          tfController: context
                                              .read<ProfileEmployeeViewModel>()
                                              .passwordController,
                                          tf1Controller: context
                                              .read<ProfileEmployeeViewModel>()
                                              .tf1Controller,
                                          tf2Controller: context
                                              .read<ProfileEmployeeViewModel>()
                                              .tf2Controller,
                                          tf3Controller: context
                                              .read<ProfileEmployeeViewModel>()
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
                                                .read<ProfileEmployeeViewModel>()
                                                .isEditingUserName != true ?
                                            context.read<
                                                ProfileEmployeeViewModel>()
                                                .changePasswordEditState() : null;
                                          },
                                          changeObscureState: () {
                                            context.read<
                                                ProfileEmployeeViewModel>()
                                                .changeObscureState();
                                          },
                                          isEditing: context
                                              .read<ProfileEmployeeViewModel>()
                                              .isEditingPassword,
                                          isAuthenticateTextObscure: context
                                              .read<ProfileEmployeeViewModel>()
                                              .isObscure,
                                          isLoading: context
                                              .watch<ProfileEmployeeViewModel>()
                                              .isUpdateLoading,
                                          onPressedChange: () {
                                            context.read<
                                                ProfileEmployeeViewModel>()
                                                .fetchUpdateResult(
                                                'password');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              );

                            },
                          ),


                        ),
                      ),
                    ),
                  );
                }
              }
          ),
        ),
      );
    }
        ),
      ),
    );
  }
}

