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

import 'request_model.dart';
import 'request_model_response.dart';
import 'request_service.dart';


class RequestViewModel extends ChangeNotifier implements IBaseViewModel{
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  TextEditingController? companyNameController = TextEditingController();
  TextEditingController? authorizedNameController  = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? employeeCountController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? explanationController = TextEditingController();
  @override
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;

 String? selectedDateMin;
 String? selectedDateMax;
 String? selectedTimeMin;
 String? selectedTimeMax;
 String? phoneNumber;
  bool isLoading = false;

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
  void changeSelectedDateMin(String selectedDate){
    selectedDateMin = selectedDate;
    notifyListeners();
  }
  void changeSelectedDateMax(String selectedDate){
    selectedDateMax = selectedDate;
    notifyListeners();
  }
  void changeSelectedTimeMin(String selectedTime){
    selectedTimeMin = selectedTime;
    notifyListeners();
  }
  void changeSelectedTimeMax(String selectedTime){
    selectedTimeMax = selectedTime;
    notifyListeners();
  }
  void changeLoading(){

    isLoading = !isLoading;
    notifyListeners();

  }
  Future<void> fetchRequestService() async{
    try {
      if (formKey.currentState!.validate()) {
        changeLoading();
        final response = await RequestService.instance.fetchRequestResponse(
            RequestModel(
              registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
              companyName:companyNameController!.text,
              authorizedName: authorizedNameController!.text,
              phone: phoneNumber,
              email: emailController!.text,
              employeeCount:employeeCountController!.text,
              startingDate: selectedDateMin,
              completionDate: selectedDateMax,
              startingTime: selectedTimeMin,
              completionTime: selectedTimeMax,
              explanation: explanationController!.text,
            ),
            RequestResponseModel());

        if (response!.success == 1) {


          formKey.currentState!.reset();
          clear();
          showDialog(context: NavigationService.instance.navigatorKey.currentContext!, builder: (context){
            return AlertDialogSuccess(
              fontFamily: 'Bozon',
              text: LocaleKeys.requestBusiness_successRequest.locale,
              buttonText: LocaleKeys.okey.locale,
            );
          }
          );

          // Navigator.pop(NavigationService.instance.navigatorKey.currentContext!);
          notifyListeners();

        }
        else if (response.success == 0) {
          ToastMessage.instance.errorMessage(errorMessage: response.error!.message);
          notifyListeners();
          changeLoading();
        }
        else if (response.success == -1) {
          ToastMessage.instance.errorMessage(errorMessage: response.error!.message);
          notifyListeners();
          changeLoading();

        }
        else {
          ToastMessage.instance.dbConnectionErrorMessage();
          notifyListeners();
          changeLoading();
        }

      }

    }
    catch(e){
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
      changeLoading();
    }
  }
  void clear(){
    companyNameController!.clear();
    authorizedNameController!.clear();
    phoneController!.clear();
    employeeCountController!.clear();
    selectedDateMin=null;
    selectedDateMax=null;
    selectedTimeMin=null;
    selectedTimeMax=null;
    explanationController!.clear();
    emailController!.clear();
    isLoading = false;
  }




}