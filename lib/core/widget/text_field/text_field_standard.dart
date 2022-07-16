import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';

class TextFieldStandard extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
   TextFieldStandard({Key? key,this.hintText,this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
        maxLines: null,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box,color: ColorConstants.instance.customBlueColor),
          hintText: hintText,
          hintStyle: const TextStyle( fontWeight: FontWeight.bold,color: Colors.white,),

        ),
        onChanged:onChanged,
    );
  }
}
