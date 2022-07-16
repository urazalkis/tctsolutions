import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';


class LanguagePopupMenu extends StatelessWidget {
  final ValueChanged<int?>  onChanged;
 final String? selectedValue;
  final int? initialValue;
 final AlignmentGeometry? align;
 final Color? color;
   LanguagePopupMenu({Key? key,required this.onChanged,this.initialValue,this.align,this.selectedValue,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(200,0),
      padding: EdgeInsets.only(top:context.screenHeight/100,),
      shape:OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMin),
      color: Colors.white.withOpacity(0.8),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(selectedValue ?? '${LocaleKeys.language.locale}',
            style: TextStyle(color:color ?? Colors.white),),
          Icon(Icons.language,color:color ?? Colors.white,)],
      ),
        initialValue: initialValue,
        itemBuilder: (context)=>[
          PopupMenuItem(value:1,child: Text('EN',style: TextStyle(fontFamily: 'Bozon',color: Colors.blue),)),
          PopupMenuItem(value:2,child: Text('DE',style: TextStyle(fontFamily: 'Bozon',color: Colors.blue),)),
          PopupMenuItem(value:3,child: Text('TR',style: TextStyle(fontFamily: 'Bozon',color: Colors.blue),)),
        ],
      onSelected:onChanged,


    );
  }
}
