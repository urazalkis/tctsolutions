import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/widget/message/toast_message.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';
import 'employee__detail_model.dart';
import 'employee_detail_model_response.dart';
import 'employee_detail_business_service.dart';
import 'employee_detail_state.dart';


class EmployeeBusinessDetailViewModel extends Cubit<IEmployeeBusinessDetailState> implements IBaseViewModel{


  @override
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;

  String? date;
 String? startingTime;
 String? completionTime;


  bool isLoading = false;
  bool showPassword = false;

  @override
  BuildContext? context;

 IEmployeeBusinessDetailService? service;
  EmployeeBusinessDetailViewModel({this.service}) : super(JEmployeeBusinessDetailInit());
  @override
  void init() {
clear();
  }
  @override
  void setContext(BuildContext context) => this.context = context;


  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;
  }
  Future<void> fetchEmployeeDetailList(String jobId,String employeeId) async{
    try {

      emit(EmployeeBusinessDetailLoading(changeLoading()));
        final response = await service!.fetchEmployeeDetailResponse(
            EmployeeBusinessDetailModel(
              registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
              jobId:jobId,employeeId: employeeId,
            ),
            EmployeeBusinessDetailResponseModel());

      emit(EmployeeBusinessDetailLoading(changeLoading()));
      emit(EmployeeBusinessDetailLoaded(response));

        if (response! != null) {

        }
        else if (response.success == 0) {
          ToastMessage.instance.errorMessage(errorMessage: response.error!.message);


        }
        else if (response.success == -1) {
          ToastMessage.instance.errorMessage(errorMessage: response.error!.message);


        }
        else {
          ToastMessage.instance.dbConnectionErrorMessage();

        }
        changeLoading();


    }
    catch(e){
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }
  }
  void clear(){
    startingTime=null;
    completionTime=null;
    date=null;
    isLoading = false;
    showPassword = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }




}