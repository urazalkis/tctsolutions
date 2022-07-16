import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';

//typedef FutureCallBack = Future<void> Function();
class ElevatedCircularIconButton extends StatefulWidget {

  ElevatedCircularIconButton(
      {Key? key, required this.label, required this.onPressed, required this.icon, this.color,this.height,this.width})
      : super(key: key);
  final Widget label;
  final Widget icon;
  final Color? color;
  // late FutureCallBack onPressed;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  @override
  _ElevatedCircularIconButtonState createState() => _ElevatedCircularIconButtonState();
}

class _ElevatedCircularIconButtonState extends State<ElevatedCircularIconButton> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              primary: widget.color, shape: RoundedRectangleBorder(
            borderRadius:BorderConstant.instance.radiusAllCircularMedium,
          )),
          onPressed:widget.onPressed,
          icon: widget.icon,
          label: widget.label,
      ),
    );
  }
}
