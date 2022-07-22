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
      child: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraints){
          return Card(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${LocaleKeys.register_employee_name.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),maxLines: null,),
                      Flexible(child: Text("$name",style: TextStyle(fontFamily: 'bozon',color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${LocaleKeys.register_employee_tel.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                      Flexible(child: Text("$phone",style: TextStyle(fontFamily: 'bozon',color: Colors.white),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${LocaleKeys.jobBusiness_job.locale} : ",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'bozon',color: Colors.white),),
                      Flexible(
                          child: Text("$profession",style: TextStyle(fontFamily: 'bozon',color: Colors.white),maxLines: 3,overflow: TextOverflow.ellipsis,)),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
