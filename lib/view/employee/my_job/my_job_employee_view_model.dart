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
import 'my_job_employee_model.dart';
import 'my_job_employee_model_response.dart';
import 'my_job_employee_service.dart';
import 'my_job_state.dart';


class MyJobEmployeeViewModel extends Cubit<IMyJobEmployeeState> implements IBaseViewModel{


  TextEditingController? employeeCountController = TextEditingController();
  TextEditingController? dayCountController  = TextEditingController();
  TextEditingController? explanationController = TextEditingController();
  @override
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;

  String? selectedJobEntranceSystemNo;
  String? selectedStatus;
  String? selectedAcceptStatus;
  String? selectedApprovalStatus;
  String? selectedJobId;
  String? selectedJob;
  String? selectedCompany;
  String? selectedDayCount;
  String? selectedDateMin;
  String? selectedDateMax;
  String? selectedTimeMin;
  String? selectedTimeMax;
  bool isLoading = false;
  bool showPassword = false;
  late String qrCode;

  String? selectedFilterValue="${LocaleKeys.jobBusiness_activeJobs.locale}";
  @override
  BuildContext? context;

 IMyJobEmployeeService? service;
  MyJobEmployeeViewModel({this.service}) : super(MyJobEmployeeInit());
  @override
  void init() {
  clear();
  }
  @override
  void setContext(BuildContext context) => this.context = context;


  void changeFilterValue(String selectedValue){
    selectedFilterValue  = selectedValue;
  }

  Future<List<dynamic>?> fetchJobActiveList() async{
    try {

      emit(MyJobEmployeeLoading(changeLoading()));

        final response = await service!.fetchActiveJobResponse(
            MyJobEmployeeModel(
              registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
              userId:LocaleManager.instance.getStringValue(PreferencesKeys.userId),status: '1',acceptStatus: '1',jobId:'',reservedJobId: ''
            ),
            MyJobEmployeeResponseModel());
      emit(MyJobEmployeeLoading(changeLoading()));
      emit(MyJobEmployeeLoaded(response));

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
  Future<List<dynamic>?> fetchJobReservedList(String reservedJobId) async{
    try {

      emit(MyJobEmployeeLoading(changeLoading()));

      final response = await service!.fetchReservedJobResponse(
          MyJobEmployeeModel(
              registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
              userId:LocaleManager.instance.getStringValue(PreferencesKeys.userId),status: '1',acceptStatus: '0',jobId:'',reservedJobId: reservedJobId,
          ),
          MyJobEmployeeResponseModel());
      emit(MyJobEmployeeLoading(changeLoading()));
      emit(MyJobEmployeeLoaded(response));

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
  Future<void> fetchJobPendingApprovalList() async{
    try {

      emit(MyJobEmployeeLoading(changeLoading()));

      final response = await service!.fetchPendingApprovalJobResponse(
          MyJobEmployeeModel(
            registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
            userId:LocaleManager.instance.getStringValue(PreferencesKeys.userId),status: '1',acceptStatus: '0',jobId: '',reservedJobId: ''
          ),
          MyJobEmployeeResponseModel());
      emit(MyJobEmployeeLoading(changeLoading()));

      emit(MyJobEmployeeLoaded(response));

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
  Future<void> fetchJobPastList() async{
    try {

      emit(MyJobEmployeeLoading(changeLoading()));

      final response = await service!.fetchPastJobResponse(
          MyJobEmployeeModel(
            registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
            userId:LocaleManager.instance.getStringValue(PreferencesKeys.userId),status: '0',acceptStatus: '1',jobId: '',reservedJobId: ''
          ),
          MyJobEmployeeResponseModel());
      emit(MyJobEmployeeLoading(changeLoading()));

      emit(MyJobEmployeeLoaded(response));

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
    selectedStatus = null;
    selectedAcceptStatus = null;
    selectedApprovalStatus = null;
    selectedJobId=null;
    selectedJob=null;
    selectedCompany=null;
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
  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;
  }
  void changeSelectedJobValues(String? status,String? acceptStatus,String? approvalStatus,String? entranceSystemNo,String? jobId,String? jobName,String? company,dayCount,
      String? dateMin,String? dateMax,String? timeMin,timeMax){
    selectedStatus = status;
    selectedAcceptStatus = acceptStatus;
    selectedApprovalStatus = approvalStatus;
    selectedJobEntranceSystemNo = entranceSystemNo;
    selectedJobId = jobId;
    selectedJob=jobName;
    selectedCompany=company;
    selectedDayCount=dayCount;
    selectedDateMin=dateMin;
    selectedDateMax=dateMax;
    selectedTimeMin=timeMin;
    selectedTimeMax=timeMax;
  }


}