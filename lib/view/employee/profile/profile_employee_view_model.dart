import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/widget/alertDialog/alert_dialog_success.dart';
import 'package:motaperp_tctsolutions/core/widget/message/toast_message.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';
import 'package:motaperp_tctsolutions/view/authentication/login/login_model.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_model.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_model_response.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_service.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_state.dart';

class ProfileEmployeeViewModel extends Cubit<IProfileEmployeeState> implements IBaseViewModel{

  TextEditingController? userNameController;
  TextEditingController? passwordController;
  TextEditingController? tf1Controller;
  TextEditingController? tf2Controller;
  TextEditingController? tf3Controller;
  @override
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;


  bool isLoading = false;
  bool isUpdateLoading = false;
  bool isEditingUserName = false;
  bool isEditingPassword = false;
  bool isLoadingChange = false;
  bool isObscure = false;
  bool showPassword = false;
  int? completedJobHour;
  int? totalJobHour;


  @override
  BuildContext? context;

  IProfileEmployeeService? service;
  ProfileEmployeeViewModel({this.service}) : super(ProfileEmployeeInit());

  @override
  void init() {
    userNameController = TextEditingController();
    passwordController  = TextEditingController();
    tf1Controller = TextEditingController();
    tf2Controller  = TextEditingController();
    tf3Controller = TextEditingController();
    clear();
    setTfAuthenticateValue();
    fetchProfileInformation();
  }
  @override
  void setContext(BuildContext context) => this.context = context;



  Future<void> fetchUpdateResult(String type) async{
    try {

      emit(UpdateProfileLoading(changeUpdateLoading()));
      if (validate(type)) {
        String dbname = ApplicationConstants.dbName;
        String dbUserName = ApplicationConstants.dbUsername;
        String dbPassword = ApplicationConstants.dbPassword;
        if(type=='userName'){
          final response = await service!.fetchUpdateUserName(
              ProfileEmployeeModel(
                userId: LocaleManager.instance.getStringValue(
                    PreferencesKeys.userId),
                loginModel: LoginModel(registerModel: RegisterModel(
                    dbName: dbname, dbUserName: dbUserName,
                    dbPassword: dbPassword),
                    userName: tf2Controller!.text,
                    password: ''),),
              ProfileEmployeeResponseModel());
          if(response!=null) {
            if (response.success == 1) {
              LocaleManager.instance.setStringValue(
                  PreferencesKeys.userName, tf2Controller!.text);
              emit(ProfileUpdated(userNameController!, passwordController!));
              setTfAuthenticateValue();
              emit(UpdateProfileLoading(changeUpdateLoading()));
              showDialog(context: NavigationService.instance.navigatorKey
                  .currentContext!, builder: (context) {
                return AlertDialogSuccess(
                  fontFamily: 'Bozon',
                  text: LocaleKeys.successMessage.locale,
                  buttonText: LocaleKeys.okey.locale,
                );
              }
              );
              clear();
            }
            else if (response.success == 0) {
              emit(UpdateProfileLoading(changeUpdateLoading()));
              ToastMessage.instance.errorMessage(
                  errorMessage: '${LocaleKeys.profileBusiness_existuser.locale}!');
            }
            else if (response.error!.message != null) {
              emit(UpdateProfileLoading(changeUpdateLoading()));
              ToastMessage.instance.errorMessage(
                  errorMessage: response.error!.message);
            }
            else {
              emit(UpdateProfileLoading(changeUpdateLoading()));
              ToastMessage.instance.dbConnectionErrorMessage();
            }
          }
        }
        else if(type=='password'){
          final response = await service!.fetchUpdatePassword(
              ProfileEmployeeModel(
                userId: LocaleManager.instance.getStringValue(
                    PreferencesKeys.userId),
                loginModel: LoginModel(registerModel: RegisterModel(
                    dbName: dbname, dbUserName: dbUserName,
                    dbPassword: dbPassword),
                  userName: '',
                  password: tf3Controller!.text,),),
              ProfileEmployeeResponseModel());
          if(response!=null) {
            if (response.success == 1) {
              LocaleManager.instance.setStringValue(
                  PreferencesKeys.password, tf3Controller!.text);
              emit(ProfileUpdated(userNameController!, passwordController!));
              setTfAuthenticateValue();
              emit(UpdateProfileLoading(changeUpdateLoading()));
              showDialog(context: NavigationService.instance.navigatorKey
                  .currentContext!, builder: (context) {
                return AlertDialogSuccess(
                  fontFamily: 'Bozon',
                  text: LocaleKeys.successMessage.locale,
                  buttonText: LocaleKeys.okey.locale,
                );
              }
              );
              clear();
            }
            else if (response.success == 0) {
              emit(UpdateProfileLoading(changeUpdateLoading()));
              ToastMessage.instance.errorMessage(
                  errorMessage:'${LocaleKeys.profileBusiness_existuser.locale}!');
            }
            else if (response.error!.message != null) {
              emit(UpdateProfileLoading(changeUpdateLoading()));
              ToastMessage.instance.errorMessage(
                  errorMessage: response.error!.message);
            }
            else {
              emit(UpdateProfileLoading(changeUpdateLoading()));
              ToastMessage.instance.dbConnectionErrorMessage();
            }
          }
        }

      }
      else {
        emit(UpdateProfileLoading(changeUpdateLoading()));
      }

    }
    catch(e){
      print(e);
      emit(ProfileEmployeeError("An error occured! ${e.toString()}"));
    }
  }

  Future<void> fetchProfileInformation() async{

    try {
      emit(ProfileInformationLoading(changeLoading()));
        String dbname =  ApplicationConstants.dbName;
        String dbUserName =   ApplicationConstants.dbUsername;
        String dbPassword =   ApplicationConstants.dbPassword;
       final response = await service!.profileInformation(
            ProfileEmployeeModel(
              userId: LocaleManager.instance.getStringValue(
                  PreferencesKeys.userId),
              loginModel: LoginModel(registerModel: RegisterModel(
                  dbName: dbname, dbUserName: dbUserName,
                  dbPassword: dbPassword),
                  userName: '',
                  password: ''),),
            ProfileEmployeeResponseModel());


        if (response!.success == 1) {
          totalJobHour = response.totalJobHour;
          completedJobHour = response.completedJobHour;
          print("totalJobHour ${ response.totalJobHour}");
          print("completedJobHour  ${ response.completedJobHour}");
          emit(ProfileInformationLoading(changeLoading()));
          emit(ProfileInformationLoaded(completedJobHour,totalJobHour));
        }
        else {
          ToastMessage.instance.dbConnectionErrorMessage();
          emit(ProfileInformationLoading(changeLoading()));
        }

    }
    catch(e){
      print(e.toString());
      ToastMessage.instance.errorMessage(errorMessage:"An error occured!");
      emit(UpdateProfileLoading(changeLoading()));
    }
  }
  bool validate(String type){

    if(!tf1Controller!.text.isEmpty && !tf2Controller!.text.isEmpty && !tf3Controller!.text.isEmpty ) {
      late String text;
      if(type=='userName'){text  = LocaleManager.instance.getStringValue(PreferencesKeys.userName);}
      else if(type=='password'){text  = LocaleManager.instance.getStringValue(PreferencesKeys.password);}

      if (text == tf1Controller!.text) {

        if(tf2Controller!.text == tf3Controller!.text){

          return true;
        }
        else{
          ToastMessage.instance.errorMessage(
              errorMessage:'${LocaleKeys.profileBusiness_dontMatchUserName.locale}');
          return false;
        }
      }

      else {
        ToastMessage.instance.errorMessage(
            errorMessage:'${LocaleKeys.profileBusiness_dontMatchBeforeUserName.locale}');
        return false;
      }
    }
    else{

      ToastMessage.instance.errorMessage(
          errorMessage:'${LocaleKeys.emptyFieldError.locale}');
      return false;
    }
  }
  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;
  }
  bool changeUpdateLoading(){

    isUpdateLoading = !isUpdateLoading;
    return isLoading;
  }
  void changeObscureState(){

    isObscure = !isObscure;
    emit(EditingUserName(isEditingUserName));
  }
  void changeUserNameEditState(){

    isEditingUserName = !isEditingUserName;
    emit(EditingUserName(isEditingUserName));
  }
  void changePasswordEditState(){

    isEditingPassword = !isEditingPassword;
    emit(EditingPassword(isEditingPassword));
  }


  void setTfAuthenticateValue(){
    userNameController!.text=LocaleManager.instance.getStringValue(PreferencesKeys.userName);
    passwordController!.text=LocaleManager.instance.getStringValue(PreferencesKeys.password);
  }
  Future<bool> clear() async {
    tf1Controller!.clear();
    tf2Controller!.clear();
    tf3Controller!.clear();
    isLoading = false;
    isUpdateLoading = false;
    isEditingUserName = false;
    isEditingPassword = false;
    isLoadingChange = false;
    isObscure = false;
    showPassword = false;

    return true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }




}