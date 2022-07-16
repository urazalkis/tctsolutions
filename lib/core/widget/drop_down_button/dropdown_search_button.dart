import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/border_constant.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';


//typedef VoidCallbackParameter = void Function(String? selectedData,String? selectedItemId,List<String>? itemList,List<String>? itemIdList);
class CustomDropDownSearchButton extends StatefulWidget {
  final List<String>? itemNameList;
  final String? selectedItem;
  final String? labelText;
  final bool? validator;
  final String? validatorText;
  final bool? showSearchBox;
  final double? width;
  ValueChanged<String?>?  onChanged;
  final Mode? mode;

  CustomDropDownSearchButton({Key? key,this.width,this.itemNameList, this.selectedItem,
    this.labelText, this.validator,this.validatorText, this.onChanged,this.showSearchBox,this.mode}) : super(key: key);

  @override
  _CustomDropDownSearchButtonState createState() => _CustomDropDownSearchButtonState();
}

class _CustomDropDownSearchButtonState extends State<CustomDropDownSearchButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:widget.width,
      child: DropdownSearch<String>(
        popupShape: OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMedium),
        mode: widget.mode ?? Mode.MENU,
        popupBackgroundColor: Colors.white,
        showSearchBox: widget.showSearchBox ?? false,
        searchFieldProps: TextFieldProps(decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          helperStyle: TextStyle(
              color: ColorConstants.instance.customBlueColor),
          helperText: "${LocaleKeys.youcansearch.locale}",
        ),
        ),
        dropdownSearchDecoration: InputDecoration(
          border:OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMin),
          filled: true,
          fillColor: Colors.white,
          labelText: widget.labelText,
          labelStyle: TextStyle(
              fontFamily: 'bozon',
              ),
        ),
        items:widget.itemNameList,
        selectedItem:widget.selectedItem,
        onChanged:(String? selectedData) {
          widget.onChanged!(selectedData);

          },
        validator:(tfInput){
          if(widget.validator==true) {
            if (tfInput == null) {
              return "${LocaleKeys.emptyFieldError.locale}";
            }
          }
          else {
            return null;
          }
        },

      ),
    );
  }
}
