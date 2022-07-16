import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/widget/message/toast_message.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';
import '../../../core/init/language/locale_keys.g.dart';
import 'job_business_model.dart';
import 'job_business_model_response.dart';
import 'job_business_service.dart';
import 'job_state.dart';


class JobBusinessViewModel extends Cubit<IJobBusinessState> implements IBaseViewModel{


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
  bool showPassword = false;

  String? selectedFilterValue="${LocaleKeys.jobBusiness_activeJobs.locale}";

  @override
  BuildContext? context;

 IJobBusinessService? service;
  JobBusinessViewModel({this.service}) : super(JobBusinessInit());
  @override
  void init() {
   clear();
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
  void changeFilterValue(String selectedValue){
    selectedFilterValue  = selectedValue;
  }
  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;
  }
  Future<List<dynamic>?> fetchJobActiveList() async{
    try {

      emit(JobBusinessLoading(changeLoading()));

        final response = await service!.fetchJobResponse(
            JobBusinessModel(
              registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
              userId:LocaleManager.instance.getStringValue(PreferencesKeys.userId),status: '1',acceptStatus: '1'
            ),
            JobBusinessResponseModel());
      emit(JobBusinessLoading(changeLoading()));
      emit(JobBusinessLoaded(response));

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
        changeLoading();


    }
    catch(e){
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }
  }
  Future<void> fetchJobPastList() async{
    try {

      emit(JobBusinessLoading(changeLoading()));

      final response = await service!.fetchJobResponse(
          JobBusinessModel(
            registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
            userId:LocaleManager.instance.getStringValue(PreferencesKeys.userId),status: '0',acceptStatus: '1',
          ),
          JobBusinessResponseModel());
      emit(JobBusinessLoading(changeLoading()));

      emit(JobBusinessLoaded(response));

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
  Future<void> fetchJobPendingApprovalList() async{
    try {

      emit(JobBusinessLoading(changeLoading()));

      final response = await service!.fetchJobResponse(
          JobBusinessModel(
            registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
            userId:LocaleManager.instance.getStringValue(PreferencesKeys.userId),status: '1',acceptStatus: '0',
          ),
          JobBusinessResponseModel());
      emit(JobBusinessLoading(changeLoading()));

      emit(JobBusinessLoaded(response));

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
    employeeCountController!.clear();
    dayCountController!.clear();
    explanationController!.clear();
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
    selectedFilterValue="${LocaleKeys.jobBusiness_activeJobs.locale}";
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }




}