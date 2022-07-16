import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/view/authentication/login/login_view.dart';
import 'package:motaperp_tctsolutions/view/authentication/register/business_register/business_register_view.dart';
import 'package:motaperp_tctsolutions/view/authentication/register/employee_register/employee_register_view.dart';
import 'package:motaperp_tctsolutions/core/widget/card/not_found_navigation_card.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_business_view.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_detail/employee_detail/employee_detail_view.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_detail/job_business_detail_view.dart';
import 'package:motaperp_tctsolutions/view/business/navigation/navigation_bar.dart';
import 'package:motaperp_tctsolutions/view/business/profile/profile_business_view.dart';
import 'package:motaperp_tctsolutions/view/business/request/request_business_view.dart';
import 'package:motaperp_tctsolutions/view/employee/job/job_employee_view.dart';
import 'package:motaperp_tctsolutions/view/employee/my_job/job_detail/my_job_detail_view.dart';
import 'package:motaperp_tctsolutions/view/employee/my_job/my_job_employee_view.dart';
import 'package:motaperp_tctsolutions/view/employee/navigation/navigation_bar.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_view.dart';

import '../../constant/enum/locale_keys_enum.dart';


class NavigationRoute {
  LocaleManager localeManager = LocaleManager.instance;
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
    /*case NavigationConstants.DEFAULT:
        return normalNavigate(SplashView(), NavigationConstants.Default);*/
      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginView(), NavigationConstants.LOGIN);
      case NavigationConstants.REGISTER_BUSINESS:
        return normalNavigate(const RegisterBusinessView(),
            NavigationConstants.REGISTER_BUSINESS);
      case NavigationConstants.REGISTER_EMPLOYEE:
        return normalNavigate(const RegisterEmployeeView(),
            NavigationConstants.REGISTER_EMPLOYEE);
      case NavigationConstants.NAVIGATION_BAR_EMPLOYEE:
        return normalNavigate(const NavigationBarEmployee(),
            NavigationConstants.NAVIGATION_BAR_EMPLOYEE);
      case NavigationConstants.NAVIGATION_BAR_BUSINESS:
        return normalNavigate(const NavigationBarBusiness(),
            NavigationConstants.NAVIGATION_BAR_BUSINESS);
      case NavigationConstants.REQUEST_BUSINESS:
        return normalNavigate(
            const RequestBusinessView(), NavigationConstants.REQUEST_BUSINESS);
      case NavigationConstants.JOB_BUSINESS:
        return normalNavigate(
            const JobBusinessView(), NavigationConstants.JOB_BUSINESS);
      case NavigationConstants.JOB_BUSINESS_DETAIL:
        return normalNavigate(const JobBusinessDetailView(),
            NavigationConstants.JOB_BUSINESS_DETAIL);
      case NavigationConstants.EMPLOYEE_BUSINESS_DETAIL:
        return normalNavigate(const EmployeeBusinessDetailView(),
            NavigationConstants.EMPLOYEE_BUSINESS_DETAIL);
      case NavigationConstants.PROFILE_BUSINESS:
        return normalNavigate(
            const ProfileBusinessView(), NavigationConstants.PROFILE_BUSINESS);
      case NavigationConstants.JOB_EMPLOYEE:
        return normalNavigate(
            const JobEmployeeView(), NavigationConstants.JOB_EMPLOYEE);
      case NavigationConstants.MY_JOB_EMPLOYEE:
        return normalNavigate(
            const MyJobEmployeeView(), NavigationConstants.MY_JOB_EMPLOYEE);
      case NavigationConstants.MY_JOB_DETAIL:
        return normalNavigate(
            const MyJobDetailView(), NavigationConstants.MY_JOB_DETAIL);
      case NavigationConstants.PROFILE_EMPLOYEE:
        return normalNavigate(
            const ProfileEmployeeView(), NavigationConstants.PROFILE_EMPLOYEE);


      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationCard(),
        );
    }
  }

  String? initialRoute() {
    if (localeManager.getStringValue(PreferencesKeys.type) == "ISCI") {
      return NavigationConstants.NAVIGATION_BAR_EMPLOYEE;
    }
    else if (localeManager.getStringValue(PreferencesKeys.type) == "MUSTERI") {
      return NavigationConstants.NAVIGATION_BAR_BUSINESS;
    }
    else {
      return NavigationConstants.LOGIN;
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }
}