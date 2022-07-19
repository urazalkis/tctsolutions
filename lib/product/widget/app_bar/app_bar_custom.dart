import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';

import '../../../core/constant/design/color_constant.dart';
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
        automaticallyImplyLeading: true,
        title: Text(title!),
        centerTitle: true,
        elevation: 15,
        backgroundColor: ColorConstants.instance.customBlueColor.withOpacity(0.6),
       // backgroundColor:
        leading: leading,
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
