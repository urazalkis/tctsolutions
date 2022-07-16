import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_icon_button.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_login_button.dart';

class AlertDialogReserve extends StatelessWidget {
  final String? title;
  final String? buttonTitle;
  final String? jobName;
  final String? company;
  final String? totalJobDay;
  final String? jobStartingDate;
  final String? jobCompletionDate;
  final String? jobStartingTime;
  final String? jobCompletionTime;
  final bool isLoading;
  final VoidCallback onConfirm;
  final Color? buttonColor;
  AlertDialogReserve({Key? key,this.title,this.buttonTitle,this.buttonColor,this.jobName,this.company,this.totalJobDay,this.jobStartingDate,this.jobCompletionDate,
    this.jobStartingTime,this.jobCompletionTime,required this.isLoading,required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor: Colors.white,
      title: Column(children: [
        Icon(Icons.help,color: ColorConstants.instance.customBlueColor,),
       Text('$title',style: TextStyle(fontFamily: 'Bozon',color: ColorConstants.instance.customBlueColor),maxLines: 3,),
      ],),
      actions: [
        Row(
          children: [
            ElevatedCircularLoginButton(width:context.screenWidth/3,
              title: "$buttonTitle",primaryColor:buttonColor,
              isLoading:isLoading,
              onPressed:onConfirm,
            ),
            Spacer(),
            ElevatedCircularIconButton(width:context.screenWidth/3,
              onPressed:(){Navigator.pop(context);},
              icon: Icon(Icons.backspace),
              label: Text('${LocaleKeys.returnBack.locale}'),
              color:ColorConstants.instance.customBlue2Color,
            ),
          ],
        ),

      ],
      shape: OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMedium),
      content:  SizedBox(
        height: context.screenHeight/8,
        width:context.screenWidth,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${LocaleKeys.company.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.black),),
                  Text("$company",style: TextStyle(fontFamily: 'bozon',color: Colors.black),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${LocaleKeys.jobBusiness_job.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.black),maxLines: 2,),
                  Text("$jobName",style: TextStyle(fontFamily: 'bozon',color: Colors.black),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${LocaleKeys.jobBusiness_minDate.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.black),),
                  Text("$jobStartingDate",style: TextStyle(fontFamily: 'bozon',color: Colors.black),),
                  Text("${LocaleKeys.jobBusiness_maxDate.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.black),),
                  Text("$jobCompletionDate",style: TextStyle(fontFamily: 'bozon',color: Colors.black),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${LocaleKeys.jobBusiness_minTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.black),),
                  Text("$jobStartingTime",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.black),),
                  Text("${LocaleKeys.jobBusiness_maxTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.black),),
                  Text("$jobCompletionTime",style: TextStyle(fontFamily: 'bozon',color: Colors.black),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${LocaleKeys.jobBusiness_dayCount.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.black),),
                  Text("$totalJobDay",style: TextStyle(fontFamily: 'bozon',color: Colors.black),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}