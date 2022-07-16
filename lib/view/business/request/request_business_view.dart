import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_login_button.dart';
import 'package:motaperp_tctsolutions/core/widget/date_time_picker/date_picker.dart';
import 'package:motaperp_tctsolutions/core/widget/date_time_picker/time_picker.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_explanation.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_register.dart';
import 'package:motaperp_tctsolutions/view/business/request/request_business_view_model.dart';
import 'package:provider/src/provider.dart';

import '../../../core/constant/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';

class RequestBusinessView extends StatelessWidget {
  const RequestBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RequestBusinessViewModel>(
      viewModel: RequestBusinessViewModel(),
      init: (viewModel) {
        context.read<RequestBusinessViewModel>().setContext(context);
        context.read<RequestBusinessViewModel>().init();
      },
      onPageBuilder: (BuildContext context, RequestBusinessViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop:() async {NavigationService.instance.navigateToPageClear(path:NavigationConstants.LOGIN); return true;},
          child: Container(
            height: context.screenHeight,
            width:  context.screenWidth,
            decoration: ColorConstants.instance.registerBackgroundColor,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left:context.screenWidth/8,right: context.screenWidth/8),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${LocaleKeys.requestBusiness_jobRequestForm.locale}',style: TextStyle(fontFamily: 'Bozon',fontSize:12,fontWeight: FontWeight.bold),),
                          ImageWidget(iconUrl: UrlIcon.instance.appLogo2Url, height: context.screenHeight/15),

                        ],
                      ),
                    ),
                    Flexible(
                      flex: 10,
                      child: Form(
                        key: context.watch<RequestBusinessViewModel>().formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormFieldRegister(
                              validator: true,
                              width:250,hintText:'${LocaleKeys.requestBusiness_employeeCount.locale}',tfController:context.watch<RequestBusinessViewModel>().employeeCountController,
                              keyboardType: TextInputType.number,

                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              DatePickerCustom(
                                locale: context.locale.languageCode=='tr' ? LocaleType.tr : context.locale.languageCode=='en' ? LocaleType.en : context.locale.languageCode=='de' ? LocaleType.de : LocaleType.en,
                                labelText:LocaleKeys.requestBusiness_pickMinDate.locale,
                                selectedDate:context.watch<RequestBusinessViewModel>().selectedDateMin,
                                onConfirm: (selectedDate){
                                  context.read<RequestBusinessViewModel>().changeSelectedDateMin(selectedDate);
                                },
                              ),
                              DatePickerCustom(
                                locale: context.locale.languageCode=='tr' ? LocaleType.tr : context.locale.languageCode=='en' ? LocaleType.en : context.locale.languageCode=='de' ? LocaleType.de : LocaleType.en,
                                labelText:LocaleKeys.requestBusiness_pickMaxDate.locale,
                                selectedDate:context.watch<RequestBusinessViewModel>().selectedDateMax,
                                onConfirm: (selectedDate){
                                  context.read<RequestBusinessViewModel>().changeSelectedDateMax(selectedDate);
                                  print("max date ${context.read<RequestBusinessViewModel>().selectedDateMax}");
                                },
                              ),
                            ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              TimePickerCustom(
                                locale: context.locale.languageCode=='tr' ? LocaleType.tr : context.locale.languageCode=='en' ? LocaleType.en : context.locale.languageCode=='de' ? LocaleType.de : LocaleType.en,
                                labelText:LocaleKeys.requestBusiness_pickMinTime.locale,
                                selectedDate:context.watch<RequestBusinessViewModel>().selectedTimeMin,
                                onConfirm: (selectedTime){
                                  context.read<RequestBusinessViewModel>().changeSelectedTimeMin(selectedTime);
                                },
                              ),
                              TimePickerCustom(
                                locale: context.locale.languageCode=='tr' ? LocaleType.tr : context.locale.languageCode=='en' ? LocaleType.en : context.locale.languageCode=='de' ? LocaleType.de : LocaleType.en,
                                labelText:LocaleKeys.requestBusiness_pickMaxTime.locale,
                                selectedDate:context.watch<RequestBusinessViewModel>().selectedTimeMax,
                                onConfirm: (selectedTime){
                                  context.read<RequestBusinessViewModel>().changeSelectedTimeMax(selectedTime);
                                },
                              ),
                            ],
                            ),


                            TextFormFieldExplanation(
                              hintText:LocaleKeys.register_employee_explanation.locale,
                              tfController:context.watch<RequestBusinessViewModel>().explanationController,upLabel: true,),


                            ElevatedCircularLoginButton(width:context.screenWidth/3, onPressed:(){context.read<RequestBusinessViewModel>().fetchRequestService();},
                              title: "${LocaleKeys.requestBusiness_send.locale}",primaryColor:ColorConstants.instance.customBlue2Color,isLoading: context.watch<RequestBusinessViewModel>().isLoading,),
                          ],
                        ),
                      ),
                    )
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

