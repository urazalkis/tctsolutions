import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/widget/loading/circular_progress_indicator.dart';

//typedef FutureCallBack = Future<void> Function();
class ElevatedCircularLoginButton extends StatefulWidget {

    ElevatedCircularLoginButton(
      {Key? key, required this.title,this.titleColor, required this.onPressed, required this.isLoading, this.primaryColor,this.height,this.width})
      : super(key: key);
  final String title;
  final Color? titleColor;
  late bool isLoading;
  final Color? primaryColor;
 // late FutureCallBack onPressed;
    final  VoidCallback? onPressed;
    final double? height;
    final double? width;

  @override
  _ElevatedCircularLoginButtonState createState() => _ElevatedCircularLoginButtonState();
}

class _ElevatedCircularLoginButtonState extends State<ElevatedCircularLoginButton> {


   @override
  Widget build(BuildContext context) {
     return SizedBox(
       height: widget.height,
       width:widget.width,
       child: ElevatedButton(
           style: ElevatedButton.styleFrom(
               minimumSize: const Size.fromHeight(50),
               primary: widget.primaryColor, shape: widget.isLoading ? const CircleBorder() :  RoundedRectangleBorder(
             borderRadius:BorderConstant.instance.radiusAllCircularMedium,
           )),
           onPressed:  widget.isLoading ? null : widget.onPressed,
           child:  widget.isLoading ?  const CustomCircularProgressIndicator() : FittedBox(child: Text(widget.title,style:TextStyle(color:widget.titleColor,fontSize: 24,fontFamily: 'Bozon'),))),
     );
   }
}
