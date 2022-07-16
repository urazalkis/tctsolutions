import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';
import 'department_model.dart';
import 'department_response_model.dart';
import 'department_service.dart';
import 'department_state.dart';

class DepartmentCubit extends Cubit<IDepartmentState>  with IBaseViewModel
{

  IDepartmentService? service;
 bool isLoading = false;
  DepartmentCubit({this.service}):super(DepartmentInit());

  @override
  void init() {

  }
  @override
  void dispose() {
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> fetchList() async {
    try{

      emit(DepartmentLoading(changeLoading()));

        final response = await service!.fetchList(
            DepartmentModel(
                RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword)),
            DepartmentResponseModel());

      emit(DepartmentLoading(changeLoading()));
        emit(DepartmentLoaded(response));
        print("başarılı");

    }
    catch(e){
      print(e);
      emit(DepartmentError("An Error Occurred!"));
    }
  }



  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }
}