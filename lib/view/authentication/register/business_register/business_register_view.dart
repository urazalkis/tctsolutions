import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_login_button.dart';
import 'package:motaperp_tctsolutions/core/widget/drop_down_button/dropdown_search_button.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/intl_phone_number.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_email.dart';
import 'package:motaperp_tctsolutions/core/widget/text_field/text_form_field_register.dart';
import 'package:motaperp_tctsolutions/product/cubit/city/city_cubit.dart';
import 'package:motaperp_tctsolutions/product/cubit/city/city_state.dart';
import 'package:provider/src/provider.dart';
import 'business_register_view_model.dart';

class RegisterBusinessView extends StatelessWidget {
  const RegisterBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterBusinessViewModel>(
      viewModel: RegisterBusinessViewModel(),
      init: (viewModel) {
        context.read<RegisterBusinessViewModel>().setContext(context);
        context.read<RegisterBusinessViewModel>().init();
        context.read<CityCubit>().fetchList();
      },
      onPageBuilder: (BuildContext context, RegisterBusinessViewModel viewModel) => Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: context.screenHeight,
              width:  context.screenWidth,
              decoration: ColorConstants.instance.registerBackgroundColor,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left:context.screenWidth/8,right: context.screenWidth/8),
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
                          key: context.watch<RegisterBusinessViewModel>().formKey,
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(alignment:Alignment.centerLeft,child: Text('${LocaleKeys.register_registerMe.locale}',style: TextStyle(fontFamily: 'Bozon',fontSize:12),)),
                              TextFormFieldRegister(hintText:LocaleKeys.register_business_companyName.locale,tfController:context.watch<RegisterBusinessViewModel>().companyNameController,validator: true,),
                              TextFormFieldRegister(hintText:'${LocaleKeys.register_business_authorizedName.locale}',tfController:context.watch<RegisterBusinessViewModel>().authorizedNameController,validator: true),
                              BlocBuilder<CityCubit,ICityState>(
                                  builder: (BuildContext context, state) {
                                    if (state is CityLoaded) {
                                      return CustomDropDownSearchButton(
                                        showSearchBox: true,
                                        selectedItem: viewModel.selectedDropdownValueName["city"],
                                        labelText:'${LocaleKeys.register_business_city.locale}',
                                        itemNameList:state.myList.map((e) => e.city!).toList(),
                                        onChanged: (String? selectedData){viewModel.changeDropdownValue("city",selectedData!,
                                            state.myList.map((e) => e.city!).toList(),state.myList.map((e) => e.id!).toList());},);
                                    }
                                    else{return CustomDropDownSearchButton(labelText:'${LocaleKeys.register_business_city.locale}',);}
                                  }),
                              TextFormFieldEmail(hintText:LocaleKeys.register_employee_email.locale,tfController:context.watch<RegisterBusinessViewModel>().emailController,),
                              IntlPhoneNumber(
                                hintText:LocaleKeys.register_employee_tel.locale,
                                validator: true,
                                tfController:context.watch<RegisterBusinessViewModel>().phoneController,
                                filled: true,
                                onInputChanged: (String value){
                                  context.read<RegisterBusinessViewModel>().changeNumber(value);
                                },
                              ),
                              ElevatedCircularLoginButton(width:context.screenWidth/3, onPressed:(){context.read<RegisterBusinessViewModel>().fetchRegisterService();},
                                title: "${LocaleKeys.register_registerMe.locale}",primaryColor:ColorConstants.instance.customBlue2Color,isLoading: context.watch<RegisterBusinessViewModel>().isLoading,),
                             /*
                             BlocBuilder<CurrentTypeCubit,ICurrentTypeState>(
                                  builder: (BuildContext context, state) {
                                    if (state is CurrentTypeLoaded) {
                                      print("liste ${state.myList.map((e) => e.CurrentType!)}");
                                      return CustomDropDownSearchButton(
                                        selectedItem: viewModel.selectedDropdownValueName["currentType"],
                                        labelText:'${LocaleKeys.register_business_currentType.locale}',
                                        itemNameList:state.myList.map((e) => e.CurrentType!).toList(),
                                        onChanged: (String? selectedData){viewModel.changeDropdownValue("currentType",selectedData!,
                                            state.myList.map((e) => e.CurrentType!).toList(),state.myList.map((e) => e.id!).toList());},);
                                    }
                                    else{return CustomDropDownSearchButton(labelText:'${LocaleKeys.register_business_currentType.locale}',);}
                                  }),
                              TextFormFieldRegister(hintText:LocaleKeys.register_business_postCode.locale,tfController:context.watch<RegisterBusinessViewModel>().postCodeController,upLabel: true,),
                              TextFormFieldRegister(hintText:LocaleKeys.register_employee_street.locale,tfController:context.watch<RegisterBusinessViewModel>().streetController,),
                              Align(alignment: Alignment.topLeft, child: TextFormFieldRegister(width:85,hintText:'No',tfController:context.watch<RegisterBusinessViewModel>().noController,)),

                              TextFormFieldRegister(hintText:LocaleKeys.register_business_fixedNo.locale,tfController:context.watch<RegisterBusinessViewModel>().fixedNoController,),

                              TextFormFieldRegister(hintText:LocaleKeys.register_employee_address.locale,tfController:context.watch<RegisterBusinessViewModel>().addressController,),
                            */

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
      ),
    );
  }
}

