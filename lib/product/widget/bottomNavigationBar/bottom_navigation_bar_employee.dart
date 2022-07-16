import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/app/url/url_icon/url_icon.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import 'package:motaperp_tctsolutions/core/init/language/locale_keys.g.dart';

import '../../../core/constant/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';


typedef IntParameterFunction = void Function(int data);
class BottomNavigationBarEmployee extends StatelessWidget {
  final IntParameterFunction onTab;
  final int currentIndex;
  const BottomNavigationBarEmployee({Key? key,required this.onTab,required this.currentIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.green,
      iconSize: 35,
      backgroundColor: ColorConstants.instance.customBlueColor.withOpacity(0.6),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      //selectedIconTheme: CupertinoIconThemeData(color: Colors.red),
      selectedLabelStyle: TextStyle(fontSize: 13,),
      // selectedFontSize: 10,
      onTap: (index){
        onTab(index);
      },
      currentIndex:currentIndex,
      items: [
        /* BottomNavigationBarItem(
          label: '${LocaleKeys.home.locale}',
          icon: Icon(Icons.home,color: Colors.white,),
        ),*/
        BottomNavigationBarItem(
          label: '${LocaleKeys.myjobs.locale}',
          icon:  Image.asset(
            UrlIcon.instance.businessIconUrl,
            color: Colors.white,
            height: 24,
          ),
        ),
        BottomNavigationBarItem(
          label: '${LocaleKeys.activeJobPool.locale}',
          icon: Icon(Icons.business_center,color: Colors.white,),
        ),
        BottomNavigationBarItem(
          label: '${LocaleKeys.profile.locale}',
          icon: Icon(Icons.person,color: Colors.white,),
        ),

       /* BottomNavigationBarItem(
          label: '${LocaleKeys.notifications.locale}',
          icon: Icon(Icons.notifications,color: Colors.white,),
        ),*/
       /* BottomNavigationBarItem(
          label: '${LocaleKeys.profile.locale}',
          icon: Icon(Icons.person,color: Colors.white,),
        ),*/
      ],
    );
  }
}