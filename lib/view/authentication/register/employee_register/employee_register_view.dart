import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/SizedBox/sized_box_height_low.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_login_button.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/intl_phone_number.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_email.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_explanation.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_register.dart';
import 'package:motaperp_tctsolutions/view/authentication/register/employee_register/employee_register_view_model.dart';
import 'package:provider/src/provider.dart';
import '../../../../core/widget/drop_down_button/dropdown_search_button.dart';
import '../../../../product/cubit/potential_jobs/potential_jobs_cubit.dart';
import '../../../../product/cubit/potential_jobs/potential_jobs_state.dart';

class RegisterEmployeeView extends StatelessWidget {
  const RegisterEmployeeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterEmployeeViewModel>(
      viewModel: RegisterEmployeeViewModel(),
      init: (viewModel) {
        viewModel.setContext(context);
        context.read<RegisterEmployeeViewModel>().init();
        context.read<PotentialJobsCubit>().fetchList();
      },
      onPageBuilder: (BuildContext context, RegisterEmployeeViewModel viewModel) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: context.screenHeight,
            width:  context.screenWidth,
            decoration: ColorConstants.instance.registerBackgroundColor,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left:context.screenWidth/8,right: context.screenWidth/8,bottom: 20),
                child:Column(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Row(
                        children: [
                          Flexible(flex:3,child: ImageWidget(iconUrl: UrlIcon.instance.appLogo2Url)),
                          Spacer(),
                          Flexible(flex:2,child: Text('${LocaleKeys.register_employee_membershipInformation.locale}',style: TextStyle(fontFamily: 'Bozon',fontSize:12,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 15,
                      child: Form(
                        key: context.watch<RegisterEmployeeViewModel>().formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBoxHeightLow(),
                            Align(alignment:Alignment.centerLeft,child: Text('${LocaleKeys.register_registerMe.locale}',style: TextStyle(fontFamily: 'Bozon',fontSize:12),)),
                           TextFormFieldRegister(hintText:LocaleKeys.register_employee_name.locale,tfController:context.watch<RegisterEmployeeViewModel>().nameController,validator: true),
                            TextFormFieldEmail(hintText:LocaleKeys.register_employee_email.locale,tfController:context.watch<RegisterEmployeeViewModel>().emailController),
                            /*BlocBuilder<DepartmentCubit,IDepartmentState>(
                                builder: (BuildContext context, state) {
                                  if (state is DepartmentLoaded) {
                                    return CustomDropDownSearchButton(
                                      selectedItem: viewModel.selectedDropdownValueName["department"],
                                      labelText:'${LocaleKeys.register_employee_department.locale}',
                                      itemNameList:state.myList.map((e) => e.department!).toList(),
                                      onChanged: (String? selectedData){viewModel.changeDropdownValue("department",selectedData!,
                                          state.myList.map((e) => e.department!).toList(),state.myList.map((e) => e.id!).toList());},);
                                  }
                                  else{return CustomDropDownSearchButton(labelText:'${LocaleKeys.register_employee_department.locale}',);}
                                }),*/
                            IntlPhoneNumber(
                              hintText:LocaleKeys.register_employee_tel.locale,
                              validator: true,
                              tfController:context.watch<RegisterEmployeeViewModel>().phoneController,
                              filled: true,
                              onInputChanged: (String value){
                                context.read<RegisterEmployeeViewModel>().changeNumber(value);
                              },
                            ),
                            TextFormFieldRegister(hintText:LocaleKeys.register_employee_profession.locale,tfController:context.watch<RegisterEmployeeViewModel>().professionController,validator: true),
                            BlocBuilder<PotentialJobsCubit,IPotentialJobsState>(
                                builder: (BuildContext context, state) {
                                  if (state is PotentialJobsLoaded) {
                                    return CustomDropDownSearchButton(
                                      mode: Mode.BOTTOM_SHEET,
                                      validator: true,
                                      showSearchBox: true,
                                      selectedItem:  context.watch<RegisterEmployeeViewModel>().selectedAvailableJob,
                                      labelText:'${LocaleKeys.availableJobs.locale}',
                                      itemNameList:state.myList.map((e) => "${LocaleKeys.jobBusiness_job.locale} : ${e.jobName} / ${LocaleKeys.wage.locale} : ${e.wage} / ${LocaleKeys.criterion.locale} : ${e.criterion}").toList(),
                                      onChanged: (String? selectedData){
                                        context.read<RegisterEmployeeViewModel>().changeDropdownValue(selectedData!,
                                            state.myList.map((e) => "${LocaleKeys.jobBusiness_job.locale} : ${e.jobName} / ${LocaleKeys.wage.locale} : ${e.wage} / ${LocaleKeys.criterion.locale} : ${e.criterion}").toList(),
                                            state.myList.map((e) => e.id!).toList(), state.myList.map((e) => e.jobName!).toList(), state.myList.map((e) => e.wage!).toList(), state.myList.map((e) => e.criterion!).toList());
                                        },
                                    );
                                  }
                                  else{return CustomDropDownSearchButton(labelText:'${LocaleKeys.register_business_city.locale}',);}
                                }),
                            TextFormFieldExplanation(hintText:LocaleKeys.register_employee_explanation.locale,tfController:context.watch<RegisterEmployeeViewModel>().explanationController,),
                            ElevatedCircularLoginButton(width:context.screenWidth/3, onPressed:(){context.read<RegisterEmployeeViewModel>().fetchRegisterService();},
                              title: "${LocaleKeys.register_registerMe.locale}",primaryColor:ColorConstants.instance.customBlue2Color,isLoading: context.watch<RegisterEmployeeViewModel>().isLoading,),

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

