import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import 'package:motaperp_tctsolutions/product/widget/app_bar/app_bar_custom.dart';
import 'package:motaperp_tctsolutions/product/widget/card/card_job.dart';
import 'package:motaperp_tctsolutions/product/widget/drop_down_button/drop_down_button_active_past.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_business_view_model.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_state.dart';


import 'package:provider/src/provider.dart';

import '../../../core/init/language/locale_keys.g.dart';

class JobBusinessView extends StatelessWidget {
  const JobBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<JobBusinessViewModel>(
      viewModel: JobBusinessViewModel(),
      init: (viewModel) {
        context.read<JobBusinessViewModel>().setContext(context);
        context.read<JobBusinessViewModel>().init();
        context.read<JobBusinessViewModel>().fetchJobActiveList();
      },
      onPageBuilder: (BuildContext context, JobBusinessViewModel viewModel) => Scaffold(
        appBar: AppBarCustom(title:LocaleKeys.myjobs.locale,),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: WillPopScope(
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
                       BlocBuilder<JobBusinessViewModel,IJobBusinessState>(
                            builder: (context, state) {
                          if (state is JobBusinessLoading) {

                            return Padding(padding:EdgeInsets.only(top:context.screenHeight/3),child: CustomCircularProgressIndicator());
                          }
                         else if(state is JobBusinessLoaded){
                           return Column(
                              children: [
                                DropDownActivePast(
                                    onChanged: (selectedValue) async {
                                      await selectedValue=="${LocaleKeys.jobBusiness_activeJobs.locale}" ?  context.read<JobBusinessViewModel>().fetchJobActiveList() : selectedValue=="${LocaleKeys.jobBusiness_pastJobs.locale}" ? context.read<JobBusinessViewModel>().fetchJobPastList()
                                          : selectedValue=="${LocaleKeys.jobBusiness_pendingApprovalJobs.locale}" ? context.read<JobBusinessViewModel>().fetchJobPendingApprovalList() :  context.read<JobBusinessViewModel>().fetchJobActiveList();
                                      context.read<JobBusinessViewModel>().changeFilterValue(selectedValue!);
                                    },
                                  selectedItem: context.watch<JobBusinessViewModel>().selectedFilterValue,

                                ),
                                state.myList.length>0 ?
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.myList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: CardJob(
                                        jobName: state.myList[index].jobName,
                                        employeeCount: state.myList[index].employeeCount,
                                        totalJobDay: state.myList[index].dayCount,
                                        jobStartingDate: state.myList[index].startingDate,
                                        jobCompletionDate: state.myList[index].completionDate,
                                        jobStartingTime: state.myList[index].startingTime,
                                        jobCompletionTime: state.myList[index].completionTime,
                                        onPressed:state.myList[index].acceptStatus=='0' ? null : (){
                                          if(state.myList[index].jobId !=null){
                                            print("selected job id ${ context.read<JobBusinessViewModel>().selectedJobId}");
                                            context.read<JobBusinessViewModel>().changeSelectedJobValues(
                                                state.myList[index].entranceSystemNo,
                                                state.myList[index].jobId,
                                                state.myList[index].jobName,
                                                state.myList[index].employeeCount,
                                                state.myList[index].dayCount,
                                                state.myList[index].startingDate,
                                                state.myList[index].completionDate,
                                                state.myList[index].startingTime,
                                                state.myList[index].completionTime,
                                            );
                                            NavigationService.instance.navigateToPage(path:NavigationConstants.JOB_BUSINESS_DETAIL);
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
                                    Padding(padding:EdgeInsets.only(top:context.screenHeight/4) ,child:Center()),
                                  ],)
                                ],),

                              ],
                            );
                          }
                          else if(state is JobBusinessError){
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
      ),
    );
  }
}

