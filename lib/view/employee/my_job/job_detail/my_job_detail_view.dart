import 'dart:ui';
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
import 'package:motaperp_tctsolutions/core/widget/SizedBox/sized_box_width_low.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_login_button.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';
import 'package:motaperp_tctsolutions/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_tctsolutions/core/widget/message/toast_message.dart';
import 'package:motaperp_tctsolutions/core/widget/table/custom_data_table.dart';
import '../my_job_employee_view_model.dart';
import 'my_job_detail_state.dart';
import 'my_job_detail_view_model.dart';

class MyJobDetailView extends StatelessWidget {
  const MyJobDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MyJobDetailViewModel>(
      viewModel: MyJobDetailViewModel(),
      init: (viewModel) {
        context.read<MyJobDetailViewModel>().setContext(context);
        context.read<MyJobDetailViewModel>().init();
        context.read<MyJobDetailViewModel>().fetchEmployeeDetailList(context.read<MyJobEmployeeViewModel>().selectedJobId!,LocaleManager.instance.getStringValue(PreferencesKeys.userId));
      },
      onPageBuilder: (BuildContext context, MyJobDetailViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: context.screenHeight,
            width:  context.screenWidth,
            decoration: ColorConstants.instance.appBackgroundBlueColor,
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left:context.screenWidth/30,right: context.screenWidth/30,bottom: 20,top: 20),
                  child:Wrap(
                    runSpacing: context.screenHeight/30,spacing: context.screenHeight/30,
                    alignment: WrapAlignment.center,
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          ImageWidget(iconUrl: UrlIcon.instance.appLogoUrl, height: context.screenHeight/15),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${LocaleKeys.jobBusiness_job.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<MyJobEmployeeViewModel>().selectedJob}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${LocaleKeys.jobBusiness_employeeCount.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<MyJobEmployeeViewModel>().selectedCompany}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                                SizedBoxWidthLow(),
                                Text("${LocaleKeys.jobBusiness_dayCount.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<MyJobEmployeeViewModel>().selectedDayCount}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${LocaleKeys.jobBusiness_minDate.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<MyJobEmployeeViewModel>().selectedDateMin}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                                SizedBoxWidthLow(),
                                Text("${LocaleKeys.jobBusiness_maxDate.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<MyJobEmployeeViewModel>().selectedDateMax}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${LocaleKeys.jobBusiness_minTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<MyJobEmployeeViewModel>().selectedTimeMin}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                                SizedBoxWidthLow(),
                                Text("${LocaleKeys.jobBusiness_maxTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<MyJobEmployeeViewModel>().selectedTimeMax}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Container(
                       height: 3,
                       width: context.screenWidth/1.2,
                       decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                           gradient: LinearGradient(
                             begin: Alignment.topRight,
                             end: Alignment.bottomLeft,
                             colors: [
                               Colors.white.withOpacity(0.2),
                               Colors.white.withOpacity(0.7),
                               Colors.white.withOpacity(0.2),

                             ],
                             stops: [0.2,0.6,0.8]
                           )
                       ),
                     ),
                     BlocBuilder<MyJobDetailViewModel,IMyJobDetailState>(
                      builder: (context, state) {
                        if (state is MyJobDetailLoaded) {
                          return ElevatedCircularLoginButton(
                              isLoading: false,
                              primaryColor: ColorConstants.instance
                                  .customBlueColor,
                              title: "SCAN QR CODE",
                              onPressed: () {
                                context.read<MyJobEmployeeViewModel>().selectedStatus!="0" && context.read<MyJobEmployeeViewModel>().selectedAcceptStatus!="1" &&
                                context.read<MyJobEmployeeViewModel>().selectedApprovalStatus!="0" ?
                                context.read<MyJobDetailViewModel>().scan(
                                    LocaleManager.instance.getStringValue(
                                        PreferencesKeys.userId),state.myList,context.read<MyJobEmployeeViewModel>().selectedJobId!) :
                                ToastMessage.instance.errorMessage(errorMessage: "${LocaleKeys.jobEmployee_pastScanError.locale}!");
                                // context.read<MyJobDetailViewModel>().isQRValid(LocaleManager.instance.getStringValue(PreferencesKeys.userId), '2/20220620134006203503');
                              });
                        }
                        else{
                          return Center();
                        }
                      }
                     ),
                      BlocBuilder<MyJobDetailViewModel,IMyJobDetailState>(
                          builder: (context, state) {
                            if (state is MyJobDetailLoading) {
                              return Padding(padding:EdgeInsets.only(top:context.screenHeight/3),child: CustomCircularProgressIndicator());
                            }
                            else if(state is MyJobDetailLoaded){
                              return ListView(
                                shrinkWrap: true,
                                children:[
                                  SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: CustomDataTable(
                                      dividerThickness: 2,
                                      headingTextStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Bozon',
                                          color: Colors.black
                                      ),
                                      dataTextStyle: TextStyle(
                                          fontFamily: 'Bozon',
                                          color: Colors.white
                                      ),
                                      dataList: state.myList,
                                      columns:<DataColumn>[
                                        DataColumn(
                                          label: Text(
                                            "${LocaleKeys.date.locale}",
                                            maxLines: 3,
                                          ),
                                        ),
                                        DataColumn(
                                            label: Text("${LocaleKeys.jobBusiness_minTime.locale}",
                                              maxLines: 3,
                                            )
                                        ),
                                        DataColumn(
                                            label: Text("${LocaleKeys.jobBusiness_maxTime.locale}",
                                              maxLines: 3,)
                                        ),

                                      ],
                                      rows: List<DataRow>.generate(
                                          state.myList.length,
                                              (index) =>
                                              DataRow(
                                                  onSelectChanged: (a) {
                                                    print("tıklandı");
                                                  },
                                                  cells: [
                                                    DataCell(Text(
                                                        "${state.myList[index]
                                                            .date}"),),
                                                    DataCell(Text(
                                                        "${state.myList[index]
                                                            .startingTime}"),),
                                                    DataCell(Text(
                                                        "${state.myList[index]
                                                            .completionTime}")),
                                                  ]
                                              )
                                      ),
                                    ),
                                  ),
                                ],

                              );

                            }
                            else if(state is MyJobDetailError){
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


