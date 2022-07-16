import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
class CardEmployee extends StatelessWidget {
  final String? name;
  final String? phone;
  final String? profession;
  final VoidCallback? onPressed;
  const CardEmployee({Key? key,this.name,this.phone,this.profession,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderConstant.instance.radiusAllCircularMin,
        ),
        child: Container(
          height: context.screenHeight/8,
          decoration: BoxDecoration(
            borderRadius:BorderConstant.instance.radiusAllCircularMin,
            gradient:
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

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${LocaleKeys.register_employee_name.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),maxLines: null,),
                    Text("$name",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${LocaleKeys.register_employee_tel.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                    Text("$phone",style: TextStyle(fontFamily: 'bozon',color: Colors.white),),
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${LocaleKeys.jobBusiness_job.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                    Text("$profession",style: TextStyle(fontFamily: 'bozon',color: Colors.white),maxLines: null,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
