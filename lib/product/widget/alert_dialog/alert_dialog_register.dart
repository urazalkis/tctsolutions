import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/widget/SizedBox/sized_box_height_medium.dart';
import 'package:motaperp_tctsolutions/core/widget/button/elevated_circular_icon_button.dart';
import 'package:motaperp_tctsolutions/core/widget/image/image_widget.dart';

class AlertDialogRegister extends StatelessWidget {
  AlertDialogRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        scrollable: true,
        backgroundColor: Colors.white.withOpacity(0.0),
        content:Column(
          children: [
            ElevatedCircularIconButton(
              color: ColorConstants.instance.customGreyColor,
              onPressed: (){
                Navigator.pop(context);
                NavigationService.instance.navigateToPage(path:NavigationConstants.REGISTER_BUSINESS);

              },
              label:Text("${LocaleKeys.login_joinUsBusiness.locale}",style: TextStyle(color: ColorConstants.instance.customBlueColor),),
              icon: ImageWidget(iconUrl: UrlIcon.instance.registerBusinessIconUrl, height: context.screenWidth/15,),
            ),
            SizedBoxHeightMedium(),
            ElevatedCircularIconButton(
              color: ColorConstants.instance.customGrey2Color,
              onPressed: (){
                Navigator.pop(context);
                NavigationService.instance.navigateToPage(path:NavigationConstants.REGISTER_EMPLOYEE);
              },
              label:Text("${LocaleKeys.login_joinUsEmployee.locale}",style: TextStyle(color: ColorConstants.instance.customBlueColor),),
              icon: ImageWidget(iconUrl: UrlIcon.instance.registerEmployeeIconUrl, height: context.screenWidth/15,),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius:BorderConstant.instance.radiusAllCircularHigh),
      ),
    );
  }


}