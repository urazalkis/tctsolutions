import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/language_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';

class DropDownLanguage extends StatelessWidget {
  final String? selectedItem;
  final ValueChanged<String?>  onChanged;
  final AlignmentGeometry? align;
   DropDownLanguage({Key? key,required this.onChanged,this.selectedItem,this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:align ?? Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(top:context.screenHeight/100,),
        child: SizedBox(
          height: 70,
          width:110,
          child: DropdownSearch<String>(
            mode: Mode.MENU,
             maxHeight: 150,
           // dialogMaxWidth: 150,
            selectedItem:selectedItem,
            showSelectedItems: true,
            dropdownSearchTextAlignVertical: TextAlignVertical.center,
            dropdownSearchTextAlign: TextAlign.center,
            showSearchBox: false,
            popupBackgroundColor: Colors.white,
            popupElevation: 100,
            dropdownSearchBaseStyle: TextStyle(color: Colors.white),
            popupShape: OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMedium),
            dropdownSearchDecoration: InputDecoration(
              labelText: '${LocaleKeys.language.locale}',
              labelStyle:TextStyle(color: Colors.black,fontFamily: 'Bozon'),
              floatingLabelStyle: TextStyle(color: Colors.black,fontFamily: 'Bozon'),
              border:OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMin),
              filled: true,
              fillColor: Colors.transparent,
            ),
            items:LanguageManager.instance.languageList,

            onChanged:(selectedValue){
              onChanged(selectedValue);
            },
            // await selectedValue=="EN" ? context.setLocale(LanguageManager.instance.enLocale) : context.setLocale(LanguageManager.instance.trLocale);
          ),
          /*child: DropdownButtonFormField<String>(
            //style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              border:OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMin),
              fillColor: Colors.white,
            ),
              isExpanded: true,
              items: LanguageManager.instance.languageList.map<DropdownMenuItem<String>>((value){
                return DropdownMenuItem<String>(
                  value:value,
                  child: (Text("$value")),
                );
          }
          ).toList(),
            onChanged: (String? selectedValue){
             onChanged(selectedValue);
            },
          ),*/
        ),
      ),
    );
  }
}
