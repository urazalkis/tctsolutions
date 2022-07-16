import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';

import '../../../core/init/language/locale_keys.g.dart';


//typedef VoidCallbackParameter = void Function(String? selectedData,String? selectedItemId,List<String>? itemList,List<String>? itemIdList);
class DropDownActivePast extends StatefulWidget {
  final List<String>? itemNameList = ["${LocaleKeys.jobBusiness_activeJobs.locale}","${LocaleKeys.jobBusiness_pastJobs.locale}","${LocaleKeys.jobBusiness_pendingApprovalJobs.locale}"];
  final String? selectedItem;
  final String? labelText;
  final bool? validator;
  final String? validatorText;
  final bool? showSearchBox;
  final ValueChanged<String?>?  onChanged;

  DropDownActivePast({Key? key,this.selectedItem,
    this.labelText, this.validator,this.validatorText, this.onChanged,this.showSearchBox}) : super(key: key);

  @override
  _DropDownActivePastState createState() => _DropDownActivePastState();
}

class _DropDownActivePastState extends State<DropDownActivePast> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top:context.screenHeight/100,),
        child: SizedBox(
          width:200,
          child:  DropdownSearch<String>(
            mode: Mode.MENU,
            maxHeight: 150,
            // dialogMaxWidth: 150,
            selectedItem:widget.selectedItem,
            showSelectedItems: true,
            dropdownSearchTextAlignVertical: TextAlignVertical.center,
            dropdownSearchTextAlign: TextAlign.center,
            showSearchBox: false,
            popupBackgroundColor:Colors.white.withOpacity(1),
            popupElevation: 100,
            dropdownSearchBaseStyle: TextStyle(color: Colors.white),
            popupShape: OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMedium),
            dropdownSearchDecoration: InputDecoration(
              labelText: 'Select Filter',
              labelStyle:TextStyle(color: Colors.black,fontFamily: 'Bozon'),
              floatingLabelStyle: TextStyle(color: Colors.black,fontFamily: 'Bozon'),
              border:OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMin),
              filled: true,
              fillColor: Colors.transparent,
            ),
            items:widget.itemNameList,

            onChanged:(selectedValue){
              widget.onChanged!(selectedValue);
            },
            // await selectedValue=="EN" ? context.setLocale(LanguageManager.instance.enLocale) : context.setLocale(LanguageManager.instance.trLocale);
          ),
        ),
      ),
    );
  }
}
