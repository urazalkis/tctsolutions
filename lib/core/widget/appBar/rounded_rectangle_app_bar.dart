import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
class RoundedRectangleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Decoration? gradientColor;
  final Color? color;
  const RoundedRectangleAppBar({Key? key, this.title, this.actions, this.leading, this.gradientColor, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsIconTheme:CupertinoIconThemeData(size: 18),
      automaticallyImplyLeading: false,
      title: title,
      actions: actions,
      centerTitle: true,
      shape:RoundedRectangleBorder(
        borderRadius: BorderConstant.instance.radiusAllCircularHigh,
      ),
      flexibleSpace: Container(
        color:color,
        decoration:color==null ? gradientColor : null,
      ),
      leading:leading ?? null,
    );
  }

/*  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();*/
 final double toolbarHeight=30;
  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
