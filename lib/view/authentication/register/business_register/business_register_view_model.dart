import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/widget/alertDialog/alert_dialog_success.dart';
import 'package:motaperp_tctsolutions/core/widget/message/toast_message.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

import 'business_model.dart';
import 'business_model_response.dart';
import 'business_service.dart';


class RegisterBusinessViewModel extends ChangeNotifier implements IBaseViewModel{
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  TextEditingController? companyNameController = TextEditingController();
  TextEditingController? authorizedNameController  = TextEditingController();
  TextEditingController? cityController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  @override
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;
  String? phoneNumber;
  bool isLoading = false;
  bool showPassword = false;



  Map<String, String?> selectedDropdownValueId = {
    'currentType': null,
    'city': null,
  };
  Map<String, String?> selectedDropdownValueName = {
    'currentType': null,
    'city': null,
  };

  @override
  BuildContext? context;
  @override
  void init() {
  clear();
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  void changeNumber(String number){
    phoneNumber = number;
    notifyListeners();
  }
  void changeDropdownValue(String valueKey,String selectedValueName,List<String> itemList,List<String> itemIdList){
    int currentIndex =itemList.indexOf(selectedValueName);
    selectedDropdownValueId[valueKey] = itemIdList[currentIndex];
    selectedDropdownValueName[valueKey] = selectedValueName;
    print("selected item key:$valueKey");
    print("selected value id ${selectedDropdownValueId[valueKey]}");
    print("selected value ${selectedDropdownValueName[valueKey]}");
    notifyListeners();
  }
  void changeShowPassword(){

      showPassword = !showPassword;
      notifyListeners();


  }
  void changeLoading(){

    isLoading = !isLoading;
    notifyListeners();

  }
  Future<void> fetchRegisterService() async{
try {
  if (formKey.currentState!.validate()) {
    changeLoading();
    final response = await RegisterBusinessService.instance.fetchUserControl(
        BusinessModel(
          registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
          companyName:companyNameController!.text,
          authorizedName:authorizedNameController!.text,
          city: cityController!.text,
          phone: phoneNumber,
          email: emailController!.text,
        ),
        BusinessResponseModel());

    if (response!.success == 1) {


    formKey.currentState!.reset();
    changeLoading();
    clear();
    notifyListeners();
    showDialog(context: NavigationService.instance.navigatorKey.currentContext!, builder: (context){
      return AlertDialogSuccess(
        fontFamily: 'Bozon',
        text: LocaleKeys.register_registerSuccess.locale,
        buttonText: LocaleKeys.okey.locale,
      );
    }
    );

    }
    else if (response.success == 0) {
     ToastMessage.instance.errorMessage(errorMessage: response.error!.message);
     changeLoading();
     notifyListeners();

    }
    else if (response.success == -1) {
      ToastMessage.instance.errorMessage(errorMessage: response.error!.message);
      changeLoading();
      notifyListeners();

    }
    else {
      ToastMessage.instance.dbConnectionErrorMessage();
      changeLoading();
     notifyListeners();
    }
  }

  }
catch(e){
  changeLoading();
  ToastMessage.instance.errorMessage(errorMessage: e.toString());
}
  }
  void clear(){
    companyNameController!.clear();
    authorizedNameController!.clear();
    cityController!.clear();
    phoneController!.clear();
    emailController!.clear();
    showPassword = false;
  }

}