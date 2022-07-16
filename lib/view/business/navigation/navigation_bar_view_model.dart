import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_business_view.dart';
import 'package:motaperp_tctsolutions/view/business/profile/profile_business_view.dart';
import 'package:motaperp_tctsolutions/view/business/request/request_business_view.dart';

class NavigationBarBusinessViewModel extends ChangeNotifier implements IBaseViewModel{
  var pageList = [JobBusinessView(),RequestBusinessView(),ProfileBusinessView()];
  int selectedPageIndex = 0;
  @override
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;
  @override
  BuildContext? context;
  @override
  void init() {
clear();
  }
  void changePage(int index){
    selectedPageIndex = index;
    notifyListeners();

  }

  @override
  void setContext(BuildContext context) => this.context = context;

  void clear(){
    selectedPageIndex = 0;
  }

}