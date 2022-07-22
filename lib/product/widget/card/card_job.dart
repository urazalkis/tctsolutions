import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/SizedBox/sized_box_width_low.dart';

class CardJob extends StatelessWidget {
 final String? jobName;
 final String? employeeCount;
 final String? totalJobDay;
 final String? jobStartingDate;
 final String? jobCompletionDate;
 final String? jobStartingTime;
 final String? jobCompletionTime;
 final VoidCallback? onPressed;
 final LinearGradient? gradientColor;
  const CardJob({Key? key,this.jobName,this.employeeCount,this.totalJobDay,this.jobStartingDate,this.jobCompletionDate,
    this.jobStartingTime,this.jobCompletionTime,this.onPressed,this.gradientColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraints){
          return  Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderConstant.instance.radiusAllCircularMin,
            ),
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: double.infinity
              ),
              decoration: BoxDecoration(
                borderRadius:BorderConstant.instance.radiusAllCircularMin,
                gradient:
                gradientColor ??
                    LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [

                        Color(0xFF296689),
                        Color(0xFF28639B),
                        Color(0xFF296689),
                      ],
                    ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${LocaleKeys.jobBusiness_job.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),maxLines: 2,),
                            Flexible(child: Text("$jobName",style: TextStyle(fontFamily: 'bozon',color: Colors.white),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                          ],
                        ),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${LocaleKeys.jobBusiness_employeeCount.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("$employeeCount",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              SizedBoxWidthLow(),
                              Text("${LocaleKeys.jobBusiness_dayCount.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("$totalJobDay",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                            ],
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${LocaleKeys.jobBusiness_minDate.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("$jobStartingDate",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                              SizedBoxWidthLow(),
                              Text("${LocaleKeys.jobBusiness_maxDate.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("$jobCompletionDate",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                            ],
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${LocaleKeys.jobBusiness_minTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("$jobStartingTime",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              SizedBoxWidthLow(),
                              Text("${LocaleKeys.jobBusiness_maxTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                              Text("$jobCompletionTime",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed !=null ? Icon(Icons.keyboard_arrow_right,color: Colors.white,) : Center(),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
