import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/view/employee/job/job_employee_view.dart';
import 'package:motaperp_tctsolutions/view/employee/my_job/my_job_employee_view.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_view.dart';
class NavigationBarEmployeeViewModel extends ChangeNotifier implements IBaseViewModel{

  var pageList = [MyJobEmployeeView(),JobEmployeeView(),ProfileEmployeeView()];
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