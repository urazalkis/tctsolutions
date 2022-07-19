import 'dart:async';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_tctsolutions/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/language_manager.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/widget/message/toast_message.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';
import 'package:motaperp_tctsolutions/view/authentication/login/login_model_response.dart';
import 'package:motaperp_tctsolutions/view/authentication/login/login_service.dart';
import '../../../core/init/language/locale_keys.g.dart';
import 'login_model.dart';
class LoginViewModel extends ChangeNotifier implements IBaseViewModel{
  late GlobalKey<FormState> loginKey;
  TextEditingController? userNameController;
  TextEditingController? passwordController;
  @override
  BuildContext? context;
  @override
   LocaleManager localeManager = LocaleManager.instance;
  @override
   NavigationService navigation = NavigationService.instance;
   LoginService loginService = LoginService.instance;
  bool isLoading = false;
  bool showPassword = false;
  String? selectedLanguage;
  int? selectedLanguageValue;
  List<Image> imageSliderList = [Image(image:AssetImage(UrlIcon.instance.iconUrl),),Image(image:AssetImage(UrlIcon.instance.icon2Url),),Image(image:AssetImage(UrlIcon.instance.icon3Url),),];


  int? changeSelectedLanguage(int selectedValue){
    selectedValue==1 ? selectedLanguage='EN' : selectedValue==2 ? selectedLanguage='DE' : selectedValue==3 ? selectedLanguage='TR' : selectedLanguage='EN';
    selectedLanguageValue = selectedValue;
    notifyListeners();
    return selectedValue;
  }
  @override
  Future<void> init() async {
    localeManager.clearAll();
    loginKey =GlobalKey<FormState>();
    if(context!.locale.languageCode.isEmpty){context!.setLocale(LanguageManager.instance.enLocale);}
   await context!.locale.languageCode=="en" ? selectedLanguage = LanguageManager.instance.languageList[0] :  context!.locale.languageCode=="tr" ?
    selectedLanguage = LanguageManager.instance.languageList[1]
        :  context!.locale.languageCode=="de" ? selectedLanguage = LanguageManager.instance.languageList[2] :  selectedLanguage = '';

    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }
  Future<void> fetchLoginService() async{
   try {

     if (loginKey.currentState!.validate()) {
        changeLoading();
      String dbname =  ApplicationConstants.dbName;
          String dbUserName =   ApplicationConstants.dbUsername;
    String dbPassword =   ApplicationConstants.dbPassword;
        final response = await LoginService.instance.fetchUserControl(LoginModel(registerModel:RegisterModel(dbName:dbname,dbUserName:dbUserName,
            dbPassword:dbPassword),userName:userNameController!.text,password:passwordController!.text),
            LoginModelResponse());
        if (response!.success == 1) {
          localeManager.setStringValue(PreferencesKeys.loginId, response.id ?? '');
          localeManager.setStringValue(PreferencesKeys.userName, response.userName ?? '');
          localeManager.setStringValue(PreferencesKeys.password, response.password ?? '');
          localeManager.setStringValue(PreferencesKeys.departmentId, response.departmentId ?? '');
          localeManager.setStringValue(PreferencesKeys.admin,response.admin ?? '');
          localeManager.setStringValue(PreferencesKeys.title, response.title ?? '');
          localeManager.setStringValue(PreferencesKeys.authorizedName, response.authorizedName ?? '');
          localeManager.setStringValue(PreferencesKeys.phoneCompany, response.phoneCompany ?? '');
          localeManager.setStringValue(PreferencesKeys.phoneEmployee, response.phoneEmployee ?? '');
          localeManager.setStringValue(PreferencesKeys.profession, response.profession ?? '');
          localeManager.setStringValue(PreferencesKeys.city, response.city ?? '');
          localeManager.setStringValue(PreferencesKeys.authorizedName, response.authorizedName ?? '');
          localeManager.setStringValue(PreferencesKeys.type, response.type ?? '');
          localeManager.setStringValue(PreferencesKeys.userId, response.userId ?? '');
          localeManager.setStringValue(PreferencesKeys.jobAcceptStatus, response.jobAcceptStatus ?? '');
          localeManager.setStringValue(PreferencesKeys.employeeJobId, response.jobId ?? '');
          localeManager.setStringValue(PreferencesKeys.reserveJobId, response.reserveJobId ?? '');



          //formKey.currentState!.reset();
          userNameController!.clear();
          passwordController!.clear();

          notifyListeners();
          print("başarılı");

          if(response.type=="ISCI"){
            NavigationService.instance.navigateToPage(path:NavigationConstants.NAVIGATION_BAR_EMPLOYEE);
          }
          else if(response.type=="MUSTERI"){
            NavigationService.instance.navigateToPage(path:NavigationConstants.NAVIGATION_BAR_BUSINESS);
          }

          changeLoading();
        }
        else if (response.success == 0) {
          ToastMessage.instance.errorMessage(errorMessage:"${LocaleKeys.login_invalidUser.locale}!");

          notifyListeners();
          changeLoading();
          print("response 0");
        }

        else if (response.success == -1) {
          ToastMessage.instance.errorMessage(errorMessage: response.error!.message);

          notifyListeners();
          changeLoading();
          print("response -1");
        }
        else {
          ToastMessage.instance.dbConnectionErrorMessage();
          notifyListeners();
          changeLoading();
        }
      }

    }
    catch(e){
     print(e.toString());
      ToastMessage.instance.errorMessage(errorMessage:"An error occured!");
     changeLoading();
    }
  }


  void changeShowPassword(){

    showPassword = !showPassword;
    notifyListeners();


  }
  void changeLoading(){

    isLoading = !isLoading;
    notifyListeners();

  }

  @override
  void setContext(BuildContext context) => this.context = context;

}