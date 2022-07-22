import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import '../../../core/constant/design/color_constant.dart';
import '../../../core/constant/navigation/navigation_constants.dart';
import '../../../core/init/language/locale_keys.g.dart';
class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Decoration? gradientColor;
  final Color? color;
  final Color? backgroundColor;
  const AppBarCustom({Key? key, this.title, this.actions, this.leading, this.gradientColor, this.color,this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: AppBar(
        actionsIconTheme:CupertinoIconThemeData(size: 18),
        automaticallyImplyLeading: false,
        title: Text(title!),
        centerTitle: true,
        elevation: 15,
        backgroundColor: ColorConstants.instance.customBlueColor.withOpacity(0.6),
       // backgroundColor:
        leading:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap:(){
                  NavigationService.instance.navigateToPageClear(path:NavigationConstants.LOGIN);
                },
                child: Icon(Icons.backspace)),
            FittedBox(child: Text("${LocaleKeys.logout.locale}",style: TextStyle(fontFamily: 'bozon'),))
          ],
        ),
      ),
    );
  }

/*  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();*/
  final double toolbarHeight=60;
  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
