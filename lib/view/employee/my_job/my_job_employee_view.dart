import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';
import 'package:motaperp_tctsolutions/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_tctsolutions/product/widget/card/card_my_job.dart';
import 'package:motaperp_tctsolutions/product/widget/drop_down_button/drop_down_button_active_past.dart';
import '../../../core/init/language/locale_keys.g.dart';
import 'my_job_employee_view_model.dart';
import 'my_job_state.dart';

class MyJobEmployeeView extends StatelessWidget {
  const MyJobEmployeeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MyJobEmployeeViewModel>(
      viewModel: MyJobEmployeeViewModel(),
      init: (viewModel) {
        context.read<MyJobEmployeeViewModel>().setContext(context);
        context.watch<MyJobEmployeeViewModel>().init();
        context.read<MyJobEmployeeViewModel>().fetchJobActiveList();
      },
      onPageBuilder: (BuildContext context, MyJobEmployeeViewModel viewModel) => Scaffold(
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
                     BlocBuilder<MyJobEmployeeViewModel,IMyJobEmployeeState>(
                          builder: (context, state) {
                        if (state is  MyJobEmployeeLoading) {

                          return Padding(padding:EdgeInsets.only(top:context.screenHeight/3),child: CustomCircularProgressIndicator());
                        }
                       else if(state is MyJobEmployeeLoaded){
                         return Column(
                            children: [
                              DropDownActivePast(
                                onChanged: (selectedValue) async {
                                  await selectedValue=="${LocaleKeys.jobBusiness_activeJobs.locale}" ?  context.read<MyJobEmployeeViewModel>().fetchJobActiveList() : selectedValue=="${LocaleKeys.jobBusiness_pastJobs.locale}" ? context.read<MyJobEmployeeViewModel>().fetchJobPastList()
                                      : selectedValue=="${LocaleKeys.jobBusiness_pendingApprovalJobs.locale}" ? context.read<MyJobEmployeeViewModel>().fetchJobPendingApprovalList() :  context.read<MyJobEmployeeViewModel>().fetchJobActiveList();
                                  context.read<MyJobEmployeeViewModel>().changeFilterValue(selectedValue!);
                                },
                                selectedItem: context.read<MyJobEmployeeViewModel>().selectedFilterValue,

                              ),
                              state.myList.length>0 ?
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.myList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: CardMyJob(
                                      job: state.myList[index].jobName,
                                      company: state.myList[index].company,
                                      jobStartingDate: state.myList[index].startingDate,
                                      jobCompletionDate: state.myList[index].completionDate,
                                      jobStartingTime: state.myList[index].startingTime,
                                      jobCompletionTime: state.myList[index].completionTime,
                                      dayCount: state.myList[index].dayCount,
                                      onPressed:state.myList[index].approvalStatus=="0" ? null : (){
                                        if(state.myList[index].jobId !=null){
                                          print("approval Status ${state.myList[index].approvalStatus}");
                                          print("selected job id ${ context.read<MyJobEmployeeViewModel>().selectedJobId}");
                                          context.read<MyJobEmployeeViewModel>().changeSelectedJobValues(
                                            state.myList[index].status,
                                            state.myList[index].acceptStatus,
                                            state.myList[index].approvalStatus,
                                              state.myList[index].entranceSystemNo,
                                              state.myList[index].jobId,
                                              state.myList[index].jobName,
                                              state.myList[index].company,
                                            state.myList[index].dayCount,
                                              state.myList[index].startingDate,
                                              state.myList[index].completionDate,
                                              state.myList[index].startingTime,
                                              state.myList[index].completionTime,

                                          );
                                          NavigationService.instance.navigateToPage(path:NavigationConstants.MY_JOB_DETAIL);
                                        }
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
                                  Padding(padding:EdgeInsets.only(top:context.screenHeight/4) ,child: Center()),
                                ],)
                              ],),

                            ],
                          );
                        }
                        else if(state is MyJobEmployeeError){
                          print("zortladı");
                          return Center();
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

