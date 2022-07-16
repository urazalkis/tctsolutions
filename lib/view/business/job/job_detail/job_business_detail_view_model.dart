import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/core/constant/text_format/system_no_format.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/widget/message/toast_message.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'job_business_detail_model.dart';
import 'job_business_detail_model_response.dart';
import 'job_business_detail_business_service.dart';
import 'job_business_detail_state.dart';


class JobBusinessDetailViewModel extends Cubit<IJobBusinessDetailState>  implements IBaseViewModel{


  @override
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;
  //late AnimationController animationController;
  StreamController streamController = StreamController();


  String? selectedEmployeeId;
  String? selectedEmployeeName;
  String? selectedEmployeePhone;
  String? selectedEmployeeProfession;


  bool isLoading = false;
  bool showPassword = false;



  @override
  BuildContext? context;

 IJobBusinessDetailService? service;
  JobBusinessDetailViewModel({this.service}) : super(JobBusinessDetailInit());


 /* void startAnimation(TickerProvider provider){
    animationController = new AnimationController(
        duration: new Duration(seconds: 1), vsync: provider);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });
  }
  void animateScanAnimation(bool reverse) {
    if (reverse) {
      animationController.reverse(from: 1.0);
    } else {
      animationController.forward(from: 0.0);
    }
  }*/
  @override
  void init() {

    clear();
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Stream<String> generateQrPeriodic(){
    return Stream.periodic(Duration(seconds: 3), (timer) => generateQrSystemNo());
  }
  void changeSelectedData(String? employeeId,String? employeeName,String? phone,String? profession){
    selectedEmployeeId = employeeId;
    selectedEmployeeName = employeeName;
    selectedEmployeePhone = phone;
    selectedEmployeeProfession = profession;
  }
  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;
  }

  Future<void> fetchJobDetailList(String jobId) async{
    try {

      emit(JobBusinessDetailLoading(changeLoading()));
        final response = await service!.fetchJobDetailResponse(
            JobBusinessDetailModel(
              registerModel:RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword),
              jobId:jobId,
            ),
            JobBusinessDetailResponseModel());
      emit(JobBusinessDetailLoading(changeLoading()));
      emit(JobBusinessDetailLoaded(response));

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

  String generateQrSystemNo(){
    String millisecond = DateTime.now().millisecond.toString().padLeft(3,'0');
    //String microsecond = DateTime.now().microsecond.toString().padLeft(3,'0');

    String systemNo =  SystemNoFormatter.instance.systemNo.format(DateTime.now()).toString() + millisecond;
    print("qr code no $systemNo");
    return systemNo;
  }

  Future<void> callPhone(String? phone) async {
    var _phone = Uri.parse("tel://$phone");
    if (await canLaunchUrl(_phone)) {
      await launchUrl(_phone);
    }else {
      throw 'An error occured';
    }
  }

  void clear(){
    isLoading = false;
    showPassword = false;
    streamController.close();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }




}