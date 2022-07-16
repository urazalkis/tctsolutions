import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'request_business_model.dart';
import 'request_business_model_response.dart';
import 'request_business_service.dart';


class RequestBusinessViewModel extends ChangeNotifier implements IBaseViewModel{
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  TextEditingController? employeeCountController = TextEditingController();
  TextEditingController? dayCountController  = TextEditingController();
  TextEditingController? explanationController = TextEditingController();
  @override
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;

 String? selectedDateMin;
 String? selectedDateMax;
 String? selectedTimeMin;
 String? selectedTimeMax;

  bool isLoading = false;
  bool showPassword = false;

  @override
  BuildContext? context;
  @override
  void init() {
  clear();
  }
  @override
  void setContext(BuildContext context) => this.context = context;

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
        final response = await RequestBusinessService.instance.fetchProfileResponse(
            RequestBusinessModel(
              registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
              businessId:LocaleManager.instance.getStringValue(PreferencesKeys.userId),
              employeeCount:employeeCountController!.text,
              startingDate: selectedDateMin,
              completionDate: selectedDateMax,
              startingTime: selectedTimeMin,
              completionTime: selectedTimeMax,
              explanation: explanationController!.text,
            ),
            RequestBusinessResponseModel());

        if (response!.success == 1) {


          formKey.currentState!.reset();

          showDialog(context: NavigationService.instance.navigatorKey.currentContext!, builder: (context){
            return AlertDialogSuccess(
              fontFamily: 'Bozon',
              text: LocaleKeys.requestBusiness_successRequest.locale,
              buttonText: LocaleKeys.okey.locale,
            );
          }
          );
           clear();
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
    employeeCountController!.clear();
    dayCountController!.clear();
    selectedDateMin=null;
    selectedDateMax=null;
    selectedTimeMin=null;
    selectedTimeMax=null;
    explanationController!.clear();
    isLoading = false;
    showPassword = false;
  }




}