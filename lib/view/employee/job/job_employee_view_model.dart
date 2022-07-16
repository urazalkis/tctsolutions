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
import 'package:motaperp_tctsolutions/core/widget/message/toast_message.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

import 'job_employee_model.dart';
import 'job_employee_model_response.dart';
import 'job_employee_service.dart';
import 'job_state.dart';


class JobEmployeeViewModel extends Cubit<IJobEmployeeState> implements IBaseViewModel{


  TextEditingController? employeeCountController = TextEditingController();
  TextEditingController? dayCountController  = TextEditingController();
  TextEditingController? explanationController = TextEditingController();
  @override
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;

  String? selectedJobEntranceSystemNo;
  String? selectedJobId;
  String? selectedJob;
  String? selectedEmployeeCount;
  String? selectedDayCount;
  String? selectedDateMin;
  String? selectedDateMax;
  String? selectedTimeMin;
  String? selectedTimeMax;
  bool isLoading = false;
  bool isReserveLoading = false;
  bool showPassword = false;



  @override
  BuildContext? context;

 IJobEmployeeService? service;
  JobEmployeeViewModel({this.service}) : super(JobEmployeeInit());
  @override
  void init() {
    clear();
   fetchJobActivePoolList();
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  void changeSelectedJobValues(String? entranceSystemNo,String? jobId,String? jobName,String? employeeCount,String? dayCount,
      String? dateMin,String? dateMax,String? timeMin,timeMax){
    selectedJobEntranceSystemNo = entranceSystemNo;
    selectedJobId = jobId;
    selectedJob=jobName;
    selectedEmployeeCount=employeeCount;
    selectedDayCount=dayCount;
    selectedDateMin=dateMin;
    selectedDateMax=dateMax;
    selectedTimeMin=timeMin;
    selectedTimeMax=timeMax;
  }

  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;
  }
  bool changeReserveLoading(){

    isReserveLoading = !isReserveLoading;
    return isReserveLoading;
  }
  Future<List<dynamic>?> fetchJobActivePoolList() async{
    try {

      emit(JobEmployeeLoading(changeLoading()));

        final response = await service!.fetchJobResponse(
            JobEmployeeModel(
              registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
              userId: LocaleManager.instance.getStringValue(PreferencesKeys.userId),jobId: ''
            ),
            JobEmployeeResponseModel());
      emit(JobEmployeeLoading(changeLoading()));
      emit(JobEmployeeLoaded(response));

      if (response! != null) {
        return response;
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
    }
    catch(e){
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }
  }
  Future<dynamic> fetchCanBeReservedJob(String jobId) async{
    try {
      final response = await service!.fetchCanBeReserveJobResponse(
          JobEmployeeModel(
            registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
            userId: LocaleManager.instance.getStringValue(PreferencesKeys.userId),jobId: jobId
          ),
          JobEmployeeResponseModel());

      if(response!.success==2){

       await LocaleManager.instance.setStringValue(PreferencesKeys.employeeJobId, jobId);
       await fetchJobActivePoolList();
       ToastMessage.instance.success(message:'${LocaleKeys.successMessage.locale}');

      }
      else if(response.success==1){

        await LocaleManager.instance.setStringValue(PreferencesKeys.reserveJobId, jobId);
        await fetchJobActivePoolList();
        ToastMessage.instance.success(message:'${LocaleKeys.successMessage.locale}');


      }
      else if(response.success==0){
        ToastMessage.instance.errorMessage(errorMessage: '${LocaleKeys.jobEmployee_reserveError.locale}');
      }
      else if(response.success==-1){
        ToastMessage.instance.errorMessage(errorMessage: '${LocaleKeys.jobEmployee_reserveError2.locale}');
      }

    }
    catch(e){
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }
  }
  Future<dynamic> fetchCancelReservedJob(String jobId) async{
    try {
      final response = await service!.fetchCancelReserveJobResponse(
          JobEmployeeModel(
              registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
              userId: LocaleManager.instance.getStringValue(PreferencesKeys.userId),jobId: jobId
          ),
          JobEmployeeResponseModel());

      print("responsee ${response!.success}");
      if(response.success==2){

        await LocaleManager.instance.setStringValue(PreferencesKeys.employeeJobId,
            LocaleManager.instance.getStringValue(PreferencesKeys.reserveJobId));
        await LocaleManager.instance.setStringValue(PreferencesKeys.reserveJobId, '0');
        ToastMessage.instance.success(message:'${LocaleKeys.successMessage.locale}');
       await fetchJobActivePoolList();

      }
      else if(response.success==1){
        await LocaleManager.instance.setStringValue(PreferencesKeys.reserveJobId, '0');

        ToastMessage.instance.success(message:'${LocaleKeys.successMessage.locale}');
        await fetchJobActivePoolList();
      }
      else{
        print("zortladı ${response.success}");
      }

    }
    catch(e){
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }
  }

  void clear(){
    isLoading = false;
    showPassword = false;
    selectedJobId=null;
    selectedJob=null;
    selectedEmployeeCount=null;
    selectedDayCount=null;
    selectedDateMin=null;
    selectedDateMax=null;
    selectedTimeMin=null;
    selectedTimeMax=null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }




}