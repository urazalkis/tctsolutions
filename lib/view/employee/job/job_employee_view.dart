import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';
import 'package:motaperp_tctsolutions/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_tctsolutions/product/widget/alert_dialog/reserve_alert_dialog.dart';
import 'package:motaperp_tctsolutions/product/widget/card/card_my_job.dart';
import 'package:provider/src/provider.dart';
import '../../../core/constant/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import 'job_employee_view_model.dart';
import 'job_state.dart';

class JobEmployeeView extends StatelessWidget {
  const JobEmployeeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<JobEmployeeViewModel>(
      viewModel: JobEmployeeViewModel(),
      init: (viewModel) {
        context.read<JobEmployeeViewModel>().setContext(context);
        context.read<JobEmployeeViewModel>().init();
      },
      onPageBuilder: (BuildContext context, JobEmployeeViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop:() async {NavigationService.instance.navigateToPageClear(path:NavigationConstants.LOGIN); return true;},
          child: Container(
            height: context.screenHeight,
            width:  context.screenWidth,
            decoration: ColorConstants.instance.appBackgroundBlueColor,
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left:context.screenWidth/30,right: context.screenWidth/30,bottom: 20,top: 20),
                  child:Column(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          ImageWidget(iconUrl: UrlIcon.instance.appLogoUrl, height: context.screenHeight/15),
                        ],
                      ),
                     BlocBuilder<JobEmployeeViewModel,IJobEmployeeState>(
                          builder: (context, state) {
                        if (state is JobEmployeeLoading) {

                          return Padding(padding:EdgeInsets.only(top:context.screenHeight/3),child: CustomCircularProgressIndicator());
                        }
                        else if(state is JobEmployeeError){
                          print("zortladı");
                          return Center();
                        }
                       else if(state is JobEmployeeLoaded){
                         return Column(
                            children: [
                              state.myList.length>0 ?
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.myList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: CardMyJob(
                                      gradientColor:(LocaleManager.instance.getStringValue(PreferencesKeys.employeeJobId)==state.myList[index].jobId) &&
                                          (LocaleManager.instance.getStringValue(PreferencesKeys.jobAcceptStatus)=='1') ?
                                          LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.green,
                                          Colors.green,
                                        ],
                                      ) : (state.myList[index].jobId==LocaleManager.instance.getStringValue(PreferencesKeys.reserveJobId)||
                                          (state.myList[index].jobId==LocaleManager.instance.getStringValue(PreferencesKeys.employeeJobId)))  ?
                                      LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xFFA00D00),
                                          Color(0xFFA00D00),
                                        ],
                                      )
                                          : LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xFF296689),
                                          Color(0xFF28639B),
                                          Color(0xFF296689),
                                        ],
                                      ),
                                      job: state.myList[index].jobName,
                                      company: state.myList[index].company,
                                      jobStartingDate: state.myList[index].startingDate,
                                      jobCompletionDate: state.myList[index].completionDate,
                                      jobStartingTime: state.myList[index].startingTime,
                                      jobCompletionTime: state.myList[index].completionTime,
                                      dayCount: state.myList[index].dayCount,
                                      onPressed: (){
                                        (LocaleManager.instance.getStringValue(PreferencesKeys.employeeJobId)==state.myList[index].jobId) &&
                                            (LocaleManager.instance.getStringValue(PreferencesKeys.jobAcceptStatus)=='1') ? null

                                            :  (state.myList[index].jobId==LocaleManager.instance.getStringValue(PreferencesKeys.reserveJobId)||
                                            (state.myList[index].jobId==LocaleManager.instance.getStringValue(PreferencesKeys.employeeJobId)))  ?
                                        showDialog(
                                            context: context,
                                          builder: (BuildContext context){
                                            return AlertDialogReserve(
                                              title: '${LocaleKeys.jobEmployee_cancelReserveQuestion.locale}',
                                              buttonTitle:'${LocaleKeys.jobEmployee_cancelReserve.locale}',
                                              company:state.myList[index].company,
                                              jobName: state.myList[index].jobName,
                                              jobStartingDate: state.myList[index].startingDate,
                                              jobCompletionDate: state.myList[index].completionDate,
                                              jobStartingTime: state.myList[index].startingTime,
                                              jobCompletionTime: state.myList[index].completionTime,
                                              totalJobDay: state.myList[index].dayCount,
                                              isLoading:false,
                                              buttonColor: Colors.deepOrangeAccent,
                                              onConfirm: () { context.read<JobEmployeeViewModel>().fetchCancelReservedJob(state.myList[index].jobId!);Navigator.pop(context);},

                                            );

                                          }
                                        ):
                                        state.myList[index].jobId !=null ?
                                         showDialog(
                                             context: context,
                                             builder: (BuildContext context){
                                               return AlertDialogReserve(
                                                 title: '${LocaleKeys.jobEmployee_reserveQuestion.locale}',
                                                 buttonTitle:'${LocaleKeys.jobEmployee_Reserve.locale}',
                                                 company:state.myList[index].company,
                                                 jobName: state.myList[index].jobName,
                                                 jobStartingDate: state.myList[index].startingDate,
                                                 jobCompletionDate: state.myList[index].completionDate,
                                                 jobStartingTime: state.myList[index].startingTime,
                                                 jobCompletionTime: state.myList[index].completionTime,
                                                 totalJobDay: state.myList[index].dayCount,
                                                 isLoading:false,
                                                 buttonColor: Colors.green,
                                                 onConfirm: () {context.read<JobEmployeeViewModel>().fetchCanBeReservedJob(state.myList[index].jobId!);Navigator.pop(context);},

                                               );
                                             }) : null;

                                        print ("tıklandı");
                                      },
                                    ),
                                  );
                                },
                              ) :
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  Padding(padding:EdgeInsets.only(top:context.screenHeight/3) ,child: Center()),
                                ],)
                              ],),

                            ],
                          );
                        }
                       else{
                         return Center();
                        }
                        }

                     ),
                    ],
                  ),

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

