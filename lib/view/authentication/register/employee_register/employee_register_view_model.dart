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
import 'package:motaperp_tctsolutions/product/cubit/potential_jobs/potential_jobs_response_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';
import 'package:motaperp_tctsolutions/view/authentication/register/employee_register/employee_model.dart';
import 'package:motaperp_tctsolutions/view/authentication/register/employee_register/employee_model_response.dart';

import 'employee_service.dart';

class RegisterEmployeeViewModel extends ChangeNotifier implements IBaseViewModel{
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController  = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? professionController  = TextEditingController();
  TextEditingController? explanationController  = TextEditingController();
  @override
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;
  String? phoneNumber;
  bool isLoading = false;
  bool showPassword = false;

  String? selectedAvailableJob;
  String? selectedAvailableJobId;
  String? selectedAvailableJobName;
  String? selectedAvailableJobWage;
  String? selectedAvailableJobCriterion;

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
  void changeShowPassword(){

      showPassword = !showPassword;
      notifyListeners();


  }

    void changeDropdownValue(String selectedValueName,List<String> itemList,List<String> itemIdList,List<String> itemNameList,List<String> itemWageList,List<String> itemCriterionList){

    int currentIndex =itemList.indexOf(selectedValueName);
    selectedAvailableJobId = itemIdList[currentIndex];
    selectedAvailableJobName = itemNameList[currentIndex];
    selectedAvailableJobWage = itemWageList[currentIndex];
    selectedAvailableJobCriterion = itemCriterionList[currentIndex];
    selectedAvailableJob = selectedValueName;

    print("selectedAvailableJobName ${selectedAvailableJobName}");
    print("selectedAvailableJobWage ${selectedAvailableJobWage}");
    print("selectedAvailableJobCriterion ${selectedAvailableJobCriterion}");
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

      final response = await RegisterEmployeeService.instance.fetchUserControl(
          EmployeeModel(
            registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername, dbPassword:ApplicationConstants.dbPassword),
            name:nameController!.text,
            email: emailController!.text,
            phone: phoneNumber,
            profession: professionController!.text,
            explanation: explanationController!.text,
            availableJobId: selectedAvailableJobId,

          ),
          EmployeeResponseModel());
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
       });
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
    nameController!.clear();
    emailController!.clear();
    phoneController!.clear();
    professionController!.clear();
    explanationController!.clear();
    showPassword = false;
    selectedAvailableJob=null;
    selectedAvailableJobId=null;
    selectedAvailableJobName=null;
    selectedAvailableJobWage=null;
    selectedAvailableJobCriterion=null;
  }




}