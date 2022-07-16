import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/view/authentication/login/login_view_model.dart';
import 'package:motaperp_tctsolutions/view/authentication/register/business_register/business_register_view_model.dart';
import 'package:motaperp_tctsolutions/view/authentication/register/employee_register/employee_register_view_model.dart';
import 'package:motaperp_tctsolutions/view/business/navigation/navigation_bar_view_model.dart';
import 'package:motaperp_tctsolutions/view/business/request/request_business_view_model.dart';
import 'package:motaperp_tctsolutions/view/create_request/request_view_model.dart';
import 'package:motaperp_tctsolutions/view/employee/navigation/navigation_bar_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<dynamic> dependItems = [
    ChangeNotifierProvider(create: (_) => RegisterBusinessViewModel(),lazy: true,),
    ChangeNotifierProvider(create: (_) => RegisterEmployeeViewModel(),lazy: true,),
    ChangeNotifierProvider(create: (_) => LoginViewModel(),lazy: true,),
    ChangeNotifierProvider(create: (_) => NavigationBarBusinessViewModel(),lazy: true,),
    ChangeNotifierProvider(create: (_) => RequestBusinessViewModel(),lazy: true,),
    ChangeNotifierProvider(create: (_) => RequestViewModel(),lazy: true,),
    ChangeNotifierProvider(create: (_) => NavigationBarEmployeeViewModel(),lazy: true,),
    Provider.value(value: NavigationService.instance)

  ];
  List<SingleChildWidget> uiChangesItems = [];
}