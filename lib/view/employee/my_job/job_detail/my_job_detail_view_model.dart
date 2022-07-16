import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/widget/message/toast_message.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';
import 'my_job_detail_model_response.dart';
import 'my_job_detail_service.dart';
import 'my_job_detail_state.dart';
import 'my_jobs_detail_model.dart';


class MyJobDetailViewModel extends Cubit<IMyJobDetailState> implements IBaseViewModel{


  @override
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;

  String? date;
  String? startingTime;
  String? completionTime;


  bool isLoading = false;
  bool showPassword = false;
  late String qrCode;
  @override
  BuildContext? context;

  IMyJobDetailService? service;
  MyJobDetailViewModel({this.service}) : super(MyJobDetailInit());
  @override
  void init() {

  }
  @override
  void setContext(BuildContext context) => this.context = context;


  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;
  }
  void scan(String employeeId,myList,jobId) async {
    try {
      BarcodeScanner.scan().then((value) {
        if(!value.rawContent.isEmpty) {
          qrCode = value.rawContent;
          isQRValid(employeeId, value.rawContent).then((response) =>
          {
            if(response == 1){
              fetchEmployeeDetailList(jobId, employeeId),
              emit(MyJobDetailLoaded(myList)),
              ToastMessage.instance.success(message: "başarıyla çıkış yapıldı")
            }
            else if(response == 2){
                fetchEmployeeDetailList(jobId, employeeId),
                emit(MyJobDetailLoaded(myList)),
                ToastMessage.instance.success(
                    message: "başarıyla giriş yapıldı")
              }
            else if(response == -2){
                ToastMessage.instance.errorMessage(
                    errorMessage: "Aktif işinizle bu iş eşleşmiyor!")
              }
              else if(response == -1){
                  ToastMessage.instance.errorMessage(
                      errorMessage: "zaten çıkış işlemi yapılmış")
                }
                else if(response == 0){
                    ToastMessage.instance.errorMessage(
                        errorMessage: "bu qr kod zaten kullanılmış")
                  }
                else
                    {
                      ToastMessage.instance.errorMessage(
                          errorMessage: 'An error occured!')
                    }
          });
        }
      });
    }
    catch(e){
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }
  }
  Future<int?> isQRValid(String employeeId,String qrNo) async{
    final response = await service!.fetchQrValidation(
        MyJobDetailModel(
          registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
          employeeId: employeeId,qrNo:qrNo,jobId: ''
        ),
        MyJobDetailResponseModel());
    return response!.success;
  }
  Future<void> fetchEmployeeDetailList(String jobId,String employeeId) async{
    try {

      emit(MyJobDetailLoading(changeLoading()));
      final response = await service!.fetchEmployeeDetailResponse(
          MyJobDetailModel(
            registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
            jobId:jobId,employeeId: employeeId,qrNo: ''
          ),
          MyJobDetailResponseModel());

      emit(MyJobDetailLoading(changeLoading()));
      emit(MyJobDetailLoaded(response));

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