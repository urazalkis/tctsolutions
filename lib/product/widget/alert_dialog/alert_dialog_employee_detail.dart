import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/widget/SizedBox/sized_box_width_medium.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_icon_button.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';

import '../../../core/init/language/locale_keys.g.dart';

class AlertDialogEmployeeDetail extends StatelessWidget {
  final  VoidCallback onPressedCall;
  final VoidCallback onPressedDetail;
  AlertDialogEmployeeDetail({Key? key,required this.onPressedCall,required this.onPressedDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraints){
          return SizedBox(
            width: context.screenWidth,
            child: AlertDialog(
              scrollable: true,
              backgroundColor: Colors.white.withOpacity(0.0),
              elevation: 0,
              content:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedCircularIconButton(
                    height: context.screenHeight/10,
                    width: context.screenWidth/4,
                    color: ColorConstants.instance.customBlueColor,
                    onPressed:onPressedCall,
                    label:FittedBox(child: Text("${LocaleKeys.call.locale}",style: TextStyle(color: ColorConstants.instance.customGrey2Color),)),
                    icon: ImageWidget(iconUrl: UrlIcon.instance.callIconUrl, height: context.screenWidth/15,),
                  ),
                  SizedBoxWidthMedium(),
                  ElevatedCircularIconButton(
                    height: context.screenHeight/10,
                    width: context.screenWidth/4,
                    color: ColorConstants.instance.customGrey2Color,
                    onPressed:onPressedDetail,
                    label:FittedBox(child: Text("${LocaleKeys.detail.locale}",style: TextStyle(color: ColorConstants.instance.customBlueColor),)),
                    icon: ImageWidget(iconUrl: UrlIcon.instance.detailIconUrl, height: context.screenWidth/15,),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(borderRadius:BorderConstant.instance.radiusAllCircularHigh),
            ),
          );
        }
      ),
    );
  }


}