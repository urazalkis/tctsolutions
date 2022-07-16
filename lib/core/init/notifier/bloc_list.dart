import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/product/cubit/city/city_cubit.dart';
import 'package:motaperp_tctsolutions/product/cubit/city/city_service.dart';
import 'package:motaperp_tctsolutions/product/cubit/current_type/current_type_cubit.dart';
import 'package:motaperp_tctsolutions/product/cubit/current_type/current_type_service.dart';
import 'package:motaperp_tctsolutions/product/cubit/department/department_cubit.dart';
import 'package:motaperp_tctsolutions/product/cubit/department/department_service.dart';
import 'package:motaperp_tctsolutions/product/cubit/potential_jobs/potential_jobs_cubit.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_business_service.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_business_view_model.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_detail/employee_detail/employee_detail_business_service.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_detail/employee_detail/employee_detail_view_model.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_detail/job_business_detail_business_service.dart';
import 'package:motaperp_tctsolutions/view/business/job/job_detail/job_business_detail_view_model.dart';
import 'package:motaperp_tctsolutions/view/business/profile/profile_business_service.dart';
import 'package:motaperp_tctsolutions/view/business/profile/profile_business_view_model.dart';
import 'package:motaperp_tctsolutions/view/employee/job/job_employee_service.dart';
import 'package:motaperp_tctsolutions/view/employee/job/job_employee_view_model.dart';
import 'package:motaperp_tctsolutions/view/employee/my_job/job_detail/my_job_detail_service.dart';
import 'package:motaperp_tctsolutions/view/employee/my_job/job_detail/my_job_detail_view_model.dart';
import 'package:motaperp_tctsolutions/view/employee/my_job/my_job_employee_service.dart';
import 'package:motaperp_tctsolutions/view/employee/my_job/my_job_employee_view_model.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_service.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_view_model.dart';
import 'package:provider/single_child_widget.dart';

import '../../../product/cubit/potential_jobs/potential_jobs_service.dart';

class ApplicationBloc {
  static ApplicationBloc? _instance;
  static ApplicationBloc get instance {
    _instance ??= ApplicationBloc._init();
    return _instance!;
  }

  ApplicationBloc._init();

  List<SingleChildWidget> singleItems = [];
  List<dynamic> dependItems = [
    BlocProvider(create: (context) => CurrentTypeCubit(service:CurrentTypeService()),lazy: true,),
    BlocProvider(create: (context) => CityCubit(service:CityService()),lazy: true,),
    BlocProvider(create: (context) => PotentialJobsCubit(service:PotentialJobsService()),lazy: true,),
    BlocProvider(create: (context) => DepartmentCubit(service:DepartmentService()),lazy: true,),
    BlocProvider(create: (context) => JobBusinessViewModel(service:JobBusinessService()),lazy: true,),
    BlocProvider(create: (context) => JobBusinessDetailViewModel(service:JobBusinessDetailService()),lazy: true,),
    BlocProvider(create: (context) => EmployeeBusinessDetailViewModel(service:EmployeeBusinessDetailService()),lazy: true,),
    BlocProvider(create: (context) => ProfileBusinessViewModel(service:ProfileBusinessService()),lazy: true,),
    BlocProvider(create: (context) => JobEmployeeViewModel(service:JobEmployeeService()),lazy: true,),
    BlocProvider(create: (context) => MyJobEmployeeViewModel(service:MyJobEmployeeService()),lazy: true,),
    BlocProvider(create: (context) => MyJobDetailViewModel(service:MyJobDetailService()),lazy: true,),
    BlocProvider(create: (context) => ProfileEmployeeViewModel(service:ProfileEmployeeService()),lazy: true,),
  ];
  List<SingleChildWidget> uiChangesItems = [];
}