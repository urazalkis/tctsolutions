import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
class RoundedRectangleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Decoration? gradientColor;
  final Color? color;
  final Color? backgroundColor;
  const RoundedRectangleAppBar({Key? key, this.title, this.actions, this.leading, this.gradientColor, this.color,this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: Container(
        color: color,
        child: AppBar(
          actionsIconTheme:CupertinoIconThemeData(size: 18),
          automaticallyImplyLeading: false,
          title: title,
          actions: actions,
          centerTitle: true,
          backgroundColor:backgroundColor ,
            shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))
            ),
        /*  flexibleSpace: Container(
            decoration:color==null ? gradientColor : null,
          ),*/
          leading:leading ?? null,
        ),
      ),
    );
  }

/*  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();*/
 final double toolbarHeight=50;
  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
