import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';
import 'package:motaperp_tctsolutions/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_tctsolutions/core/widget/table/custom_data_table.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_business_view_model.dart';
import 'package:provider/src/provider.dart';
import '../job_business_detail_view_model.dart';
import 'employee_detail_state.dart';
import 'employee_detail_view_model.dart';

class EmployeeBusinessDetailView extends StatelessWidget {
  const EmployeeBusinessDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<EmployeeBusinessDetailViewModel>(
      viewModel: EmployeeBusinessDetailViewModel(),
      init: (viewModel) {
        context.read<EmployeeBusinessDetailViewModel>().setContext(context);
        context.read<EmployeeBusinessDetailViewModel>().init();
        context.read<EmployeeBusinessDetailViewModel>().fetchEmployeeDetailList(
            context.read<JobBusinessViewModel>().selectedJobId!,context.read<JobBusinessDetailViewModel>().selectedEmployeeId!);
      },
      onPageBuilder: (BuildContext context, EmployeeBusinessDetailViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: context.screenHeight,
          width:  context.screenWidth,
          decoration: ColorConstants.instance.appBackgroundBlueColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left:context.screenWidth/50,right: context.screenWidth/50,top: 20),
              child:Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      ImageWidget(iconUrl: UrlIcon.instance.appLogoUrl, height: context.screenHeight/15),
                    ],
                  ),
                  FittedBox(
                    child: SizedBox(
                      height: context.screenHeight/10,
                      width:context.screenWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${LocaleKeys.register_employee_name.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),maxLines: 2,),
                                Text("${context.read<JobBusinessDetailViewModel>().selectedEmployeeName}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${LocaleKeys.register_employee_tel.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<JobBusinessDetailViewModel>().selectedEmployeePhone}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${LocaleKeys.jobBusiness_job.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<JobBusinessDetailViewModel>().selectedEmployeeProfession}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<EmployeeBusinessDetailViewModel,IEmployeeBusinessDetailState>(
                      builder: (context, state) {
                        if (state is EmployeeBusinessDetailLoading) {
                          return Padding(padding:EdgeInsets.only(top:context.screenHeight/3),child: CustomCircularProgressIndicator());
                        }
                        else if(state is EmployeeBusinessDetailLoaded){
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
                                  dataList: state.myList ?? [],
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
                                      state.myList!.length,
                                          (index) =>
                                          DataRow(
                                              onSelectChanged: (a) {
                                                print("tıklandı");
                                              },
                                              cells: [
                                                DataCell(Text(
                                                    "${state.myList![index]
                                                        .date ?? ''}"),),
                                                DataCell(Text(
                                                    "${state.myList![index]
                                                        .startingTime ?? ''}"),),
                                                DataCell(Text(
                                                    "${state.myList![index]
                                                        .completionTime ?? ''}")),
                                              ]
                                          )
                                  ),
                                ),
                              ),
                            ],

                          );

                        }
                        else if(state is EmployeeBusinessDetailError){
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
    );
  }
}
/*class RequestBusinessView extends StatelessWidget {
  const RequestBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RequestBusinessViewModel>(
      viewModel: RequestBusinessViewModel(),
      init: (viewModel) {
        context.read<RequestBusinessViewModel>().setContext(context);
        context.read<RequestBusinessViewModel>().init();
        context.read<CurrentTypeCubit>().fetchList();
        context.read<CityCubit>().fetchList();
      },
      onPageBuilder: (BuildContext context, RequestBusinessViewModel viewModel) => Scaffold(
        body: Container(
          height: context.screenHeight,
          width:  context.screenWidth,
          decoration: ColorConstants.instance.registerBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:context.screenWidth/8,right: context.screenWidth/8,bottom: 20),
                  child:Column(
                    children: [
                      Row(
                        children: [
                          IconWidget(iconUrl: UrlIcon.instance.appLogo2Url, height: context.screenHeight/15),
                          Spacer(),
                          Text('${LocaleKeys.register_employee_membershipInformation.locale}',style: TextStyle(fontFamily: 'Bozon',fontSize:12,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBoxHeightLow(),
                      Form(
                        key: context.watch<RequestBusinessViewModel>().formKey,
                        child: Wrap(
                          direction: Axis.vertical,
                          alignment: WrapAlignment.center,
                           runSpacing: 15,spacing: 15,
                          children:[
                          TextFormFieldRegister(width:85,hintText:'No',tfController:context.watch<RequestBusinessViewModel>().noController,),
                          TextFormFieldRegister(width:85,hintText:'No',tfController:context.watch<RequestBusinessViewModel>().noController,),
                            TextFormFieldExplanation(
                              hintText:LocaleKeys.register_employee_explanation.locale,
                              tfController:context.watch<RequestBusinessViewModel>().explanationController,),
                          /*  DatePickerCustom(
                              labelText:LocaleKeys.request_pickMinDate.locale,
                              selectedDate:context.watch<RequestBusinessViewModel>().selectedDateMin,
                              onConfirm: (selectedDate){
                                context.read<RequestBusinessViewModel>().changeSelectedDateMin(selectedDate);
                              },
                            ),
                            DatePickerCustom(
                              labelText:LocaleKeys.request_pickMaxDate.locale,
                              selectedDate:context.watch<RequestBusinessViewModel>().selectedDateMax,
                              onConfirm: (selectedDate){
                                context.read<RequestBusinessViewModel>().changeSelectedDateMax(selectedDate);
                              },
                            ),
                            TimePickerCustom(
                              labelText:LocaleKeys.request_pickMinTime.locale,
                              selectedDate:context.watch<RequestBusinessViewModel>().selectedTimeMin,
                              onConfirm: (selectedTime){
                                context.read<RequestBusinessViewModel>().changeSelectedTimeMin(selectedTime);
                              },
                            ),
                            TimePickerCustom(
                              labelText:LocaleKeys.request_pickMaxTime.locale,
                              selectedDate:context.watch<RequestBusinessViewModel>().selectedTimeMax,
                              onConfirm: (selectedTime){
                                context.read<RequestBusinessViewModel>().changeSelectedTimeMax(selectedTime);
                              },
                            ),*/


                          ElevatedCircularLoginButton(width:context.screenWidth/3, onPressed:(){context.read<RequestBusinessViewModel>().fetchRegisterService();},
                              title: "${LocaleKeys.register_registerMe.locale}",primaryColor:ColorConstants.instance.customBlue2Color,isLoading: context.watch<RequestBusinessViewModel>().isLoading,),

                          ],
                        ),
                      )
                    ],
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

