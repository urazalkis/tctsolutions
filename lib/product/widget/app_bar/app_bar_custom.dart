import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';
import 'package:motaperp_tctsolutions/core/widget/appBar/rounded_rectangle_app_bar.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {

  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedRectangleAppBar(
      title: Text('${LocaleKeys.myjobs.locale}'),
      color: ColorConstants.instance.customGreyColor,
      actions: [
        Icon(Icons.person,color: ColorConstants.instance.customBlueColor,size: 24,),
      ],
    );
  }

/*  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();*/
  final double toolbarHeight=30;
  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
