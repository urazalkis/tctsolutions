import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/widget/SizedBox/sized_box_width_low.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_login_button.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';
import 'package:motaperp_tctsolutions/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_tctsolutions/product/widget/alert_dialog/alert_dialog_employee_detail.dart';
import 'package:motaperp_tctsolutions/product/widget/card/card_employee.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_business_view_model.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_detail/job_business_detail_state.dart';
import 'package:provider/src/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'job_business_detail_view_model.dart';

class JobBusinessDetailView extends StatefulWidget {
  const JobBusinessDetailView({Key? key}) : super(key: key);

  @override
  _JobBusinessDetailViewState createState() => _JobBusinessDetailViewState();
}

class _JobBusinessDetailViewState extends State<JobBusinessDetailView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<JobBusinessDetailViewModel>(
      viewModel: JobBusinessDetailViewModel(),
      init: (viewModel) {
        context.read<JobBusinessDetailViewModel>().setContext(context);
        context.read<JobBusinessDetailViewModel>().init();
        context.read<JobBusinessDetailViewModel>().fetchJobDetailList(context.read<JobBusinessViewModel>().selectedJobId!);
      },
      onPageBuilder: (BuildContext context, JobBusinessDetailViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: context.screenHeight,
          width:  context.screenWidth,
          decoration: ColorConstants.instance.appBackgroundBlueColor,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left:context.screenWidth/30,right: context.screenWidth/30,bottom: 20,top: 20),
                child:Wrap(
                  runSpacing: context.screenHeight/30,spacing:context.screenHeight/30,
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
                              Text("${context.read<JobBusinessViewModel>().selectedJob}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                            ],
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${LocaleKeys.jobBusiness_employeeCount.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("${context.read<JobBusinessViewModel>().selectedEmployeeCount}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              SizedBoxWidthLow(),
                              Text("${LocaleKeys.jobBusiness_dayCount.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("${context.read<JobBusinessViewModel>().selectedDayCount}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                            ],
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${LocaleKeys.jobBusiness_minDate.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("${context.read<JobBusinessViewModel>().selectedDateMin}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              SizedBoxWidthLow(),
                              Text("${LocaleKeys.jobBusiness_maxDate.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("${context.read<JobBusinessViewModel>().selectedDateMax}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                            ],
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${LocaleKeys.jobBusiness_minTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("${context.read<JobBusinessViewModel>().selectedTimeMin}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              SizedBoxWidthLow(),
                              Text("${LocaleKeys.jobBusiness_maxTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("${context.read<JobBusinessViewModel>().selectedTimeMax}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
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
                    ElevatedCircularLoginButton(
                        isLoading: false,
                        primaryColor: ColorConstants.instance.customBlueColor,
                        title: "QR CODE", onPressed: (){
                      //context.read<JobBusinessDetailViewModel>().startAnimation(this);
                      showDialog(
                          context: context, builder:(BuildContext context){
                        return  StreamBuilder(
                          initialData:'${context.read<JobBusinessViewModel>().selectedJobId!+'/'+context.watch<JobBusinessDetailViewModel>().generateQrSystemNo()}',
                          stream:context.read<JobBusinessDetailViewModel>().generateQrPeriodic(),
                          builder:(BuildContext context, AsyncSnapshot snapshot){
                            return BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: AlertDialog(
                                backgroundColor:Colors.white,
                                shape: RoundedRectangleBorder(borderRadius:BorderConstant.instance.radiusAllCircularHigh),
                                title:Text(
                                  'QR CODE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Bozon',color: ColorConstants.instance.customBlueColor),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Stack(
                                          children:[
                                            Container(
                                              width: 200.0,
                                              height: 200.0,
                                              child: QrImage(
                                                version: QrVersions.auto,
                                                errorStateBuilder: (context, error) =>
                                                    Text(error.toString()),
                                                data: '${context.read<JobBusinessViewModel>().selectedJobId!+'/'+snapshot.data}',
                                                //:'${context.read<JobBusinessViewModel>().selectedJobId!+'/'+context.read<JobBusinessDetailViewModel>().generateQrSystemNo()}',
                                              ),
                                            ),
                                          ]
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },

                        );
                      }
                      );

                    }),
                    BlocBuilder<JobBusinessDetailViewModel,IJobBusinessDetailState>(
                        builder: (context, state) {
                          if (state is JobBusinessDetailLoading) {
                            return Padding(padding:EdgeInsets.only(top:context.screenHeight/3),child: CustomCircularProgressIndicator());
                          }
                          else if(state is JobBusinessDetailLoaded){
                            return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:2,
                                childAspectRatio:10/11,
                                //crossAxisCount:state.myList.length>1 ? 2 : 1,
                                // childAspectRatio: state.myList.length>1 ? 3/4 : 1/1,
                              ),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.myList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 5,left: 5),
                                  child: CardEmployee(
                                    name: state.myList[index].employeeModel!.name,
                                    phone:  state.myList[index].employeeModel!.phone,
                                    profession:  state.myList[index].employeeModel!.profession,
                                    onPressed: (){
                                      print(state.myList[index].employeeModel!.phone);
                                      showDialog(context: context, builder: (BuildContext context)
                                      {
                                        return AlertDialogEmployeeDetail(
                                          onPressedCall: (){

                                            context.read<JobBusinessDetailViewModel>().callPhone(state.myList[index].employeeModel!.phone);
                                          },
                                          onPressedDetail: (){
                                            Navigator.pop(context);
                                            if(state.myList[index].employeeModel!.id !=null){
                                              context.read<JobBusinessDetailViewModel>().changeSelectedData(state.myList[index].employeeModel!.id,
                                                  state.myList[index].employeeModel!.name,state.myList[index].employeeModel!.phone,
                                                  state.myList[index].employeeModel!.profession);
                                              NavigationService.instance.navigateToPage(path:NavigationConstants.EMPLOYEE_BUSINESS_DETAIL);
                                            }
                                          },
                                        );

                                      });
                                      /* if(state.myList[index].employeeModel!.id !=null){
                                    context.read<JobBusinessDetailViewModel>().changeSelectedData(state.myList[index].employeeModel!.id,
                                        state.myList[index].employeeModel!.name,state.myList[index].employeeModel!.phone);
                                    NavigationService.instance.navigateToPage(path:NavigationConstants.EMPLOYEE_BUSINESS_DETAIL);
                                  }*/
                                    },
                                  ),
                                );
                              },


                            );
                          }
                          else if(state is JobBusinessDetailError){
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
    );
  }
}

/*class JobBusinessDetailView extends StatelessWidget {
  const JobBusinessDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<JobBusinessDetailViewModel>(
      viewModel: JobBusinessDetailViewModel(),
      init: (viewModel) {
        context.read<JobBusinessDetailViewModel>().setContext(context);
        context.read<JobBusinessDetailViewModel>().init();
        context.read<JobBusinessDetailViewModel>().fetchJobDetailList(context.read<JobBusinessViewModel>().selectedJobId!);
      },
      onPageBuilder: (BuildContext context, JobBusinessDetailViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: context.screenHeight,
          width:  context.screenWidth,
          decoration: ColorConstants.instance.appBackgroundBlueColor,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left:context.screenWidth/30,right: context.screenWidth/30,bottom: 20,top: 20),
                child:Wrap(
                  runSpacing: 20,spacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        ImageWidget(iconUrl: UrlIcon.instance.appLogoUrl, height: context.screenHeight/15),
                      ],
                    ),

                    SizedBox(
                      height: context.screenHeight/10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${LocaleKeys.jobBusiness_job.locale} : ",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<JobBusinessViewModel>().selectedJob}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${LocaleKeys.jobBusiness_employeeCount.locale} : ",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<JobBusinessViewModel>().selectedEmployeeCount}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                                SizedBoxWidthLow(),
                                Text("${LocaleKeys.jobBusiness_dayCount.locale} : ",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<JobBusinessViewModel>().selectedDayCount}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${LocaleKeys.jobBusiness_minDate.locale} : ",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<JobBusinessViewModel>().selectedDateMin}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                                SizedBoxWidthLow(),
                                Text("${LocaleKeys.jobBusiness_maxDate.locale} : ",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<JobBusinessViewModel>().selectedDateMax}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${LocaleKeys.jobBusiness_minTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<JobBusinessViewModel>().selectedTimeMin}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                                SizedBoxWidthLow(),
                                Text("${LocaleKeys.jobBusiness_maxTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'bozon',color: Colors.white),),
                                Text("${context.read<JobBusinessViewModel>().selectedTimeMax}",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                   ElevatedCircularLoginButton(
                    isLoading: false,
                       primaryColor: ColorConstants.instance.customBlueColor,
                       title: "QR CODE", onPressed: (){
                        showDialog(
                            context: context, builder:(BuildContext context){
                              return  StreamBuilder(
                                initialData:'${context.read<JobBusinessViewModel>().selectedJobId!+'/'+context.watch<JobBusinessDetailViewModel>().generateQrSystemNo()}',
                                stream:context.read<JobBusinessDetailViewModel>().generateQrPeriodic(),
                                builder:(BuildContext context, AsyncSnapshot snapshot){
                                  return BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: AlertDialog(
                                      backgroundColor:Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius:BorderConstant.instance.radiusAllCircularHigh),
                                      title:Text(
                                        'QR CODE',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Bozon',color: ColorConstants.instance.customBlueColor),
                                      ),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Stack(
                                              children:[
                                                Container(
                                                  width: 200.0,
                                                  height: 200.0,
                                                  child: QrImage(
                                                    version: QrVersions.auto,
                                                    errorStateBuilder: (context, error) =>
                                                        Text(error.toString()),
                                                    data: '${context.read<JobBusinessViewModel>().selectedJobId!+'/'+snapshot.data}',
                                                    //:'${context.read<JobBusinessViewModel>().selectedJobId!+'/'+context.read<JobBusinessDetailViewModel>().generateQrSystemNo()}',
                                                  ),
                                                ),
                                        ]
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },

                              );
                        }
                        );

                   }),
                   BlocBuilder<JobBusinessDetailViewModel,IJobBusinessDetailState>(
                        builder: (context, state) {
                      if (state is JobBusinessDetailLoading) {
                        return Padding(padding:EdgeInsets.only(top:context.screenHeight/3),child: CustomCircularProgressIndicator());
                      }
                     else if(state is JobBusinessDetailLoaded){
                       return GridView.builder(
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount:2,
                           childAspectRatio:10/11,
                             //crossAxisCount:state.myList.length>1 ? 2 : 1,
                          // childAspectRatio: state.myList.length>1 ? 3/4 : 1/1,
                         ),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.myList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 5,left: 5),
                              child: CardEmployee(
                                name: state.myList[index].employeeModel!.name,
                                phone:  state.myList[index].employeeModel!.phone,
                                profession:  state.myList[index].employeeModel!.profession,
                                onPressed: (){
                                  print(state.myList[index].employeeModel!.phone);
                                 showDialog(context: context, builder: (BuildContext context)
                                  {
                                    return AlertDialogEmployeeDetail(
                                      onPressedCall: (){

                                        context.read<JobBusinessDetailViewModel>().callPhone(state.myList[index].employeeModel!.phone);
                                      },
                                      onPressedDetail: (){
                                        Navigator.pop(context);
                                        if(state.myList[index].employeeModel!.id !=null){
                                          context.read<JobBusinessDetailViewModel>().changeSelectedData(state.myList[index].employeeModel!.id,
                                              state.myList[index].employeeModel!.name,state.myList[index].employeeModel!.phone,
                                              state.myList[index].employeeModel!.profession);
                                          NavigationService.instance.navigateToPage(path:NavigationConstants.EMPLOYEE_BUSINESS_DETAIL);
                                        }
                                      },
                                    );

                                  });
                                 /* if(state.myList[index].employeeModel!.id !=null){
                                    context.read<JobBusinessDetailViewModel>().changeSelectedData(state.myList[index].employeeModel!.id,
                                        state.myList[index].employeeModel!.name,state.myList[index].employeeModel!.phone);
                                    NavigationService.instance.navigateToPage(path:NavigationConstants.EMPLOYEE_BUSINESS_DETAIL);
                                  }*/
                                },
                              ),
                            );
                          },


                        );
                      }
                      else if(state is JobBusinessDetailError){
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
    );
  }
}*/


