import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/SizedBox/sized_box_width_low.dart';


class CardMyJob extends StatelessWidget {
  final String? company;
  final String? job;
  final String? dayCount;
  final String? jobStartingDate;
  final String? jobCompletionDate;
  final String? jobStartingTime;
  final String? jobCompletionTime;
  final VoidCallback? onPressed;
  final LinearGradient? gradientColor;
  const CardMyJob({Key? key,this.company,this.job,this.dayCount,this.jobStartingDate,this.jobCompletionDate,
    this.jobStartingTime,this.jobCompletionTime,this.onPressed,this.gradientColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: FittedBox(
        child: Card(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${LocaleKeys.company.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),maxLines: 2,),
                          Text("$company",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${LocaleKeys.jobBusiness_job.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                          Text("$job",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${LocaleKeys.jobBusiness_minTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                          Text("$jobStartingTime",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                          SizedBoxWidthLow(),
                          Text("${LocaleKeys.jobBusiness_maxTime.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                          Text("$jobCompletionTime",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${LocaleKeys.jobBusiness_dayCount.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                          Text("$dayCount",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                        ],
                      ),
                    ),
                  ],
                ),
                onPressed !=null ? Icon(Icons.keyboard_arrow_right,color: Colors.white,) : Center(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
