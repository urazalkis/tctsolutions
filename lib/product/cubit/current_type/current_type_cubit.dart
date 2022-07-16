import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/product/cubit/current_type/current_type_response_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';
import 'current_type_model.dart';
import 'current_type_service.dart';
import 'current_type_state.dart';

class CurrentTypeCubit extends Cubit<ICurrentTypeState>  with IBaseViewModel
{

  ICurrentTypeService? service;
 bool isLoading = false;
  CurrentTypeCubit({this.service}):super(CurrentTypeInit());

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

      emit(CurrentTypeLoading(changeLoading()));

        final response = await service!.fetchList(
            CurrentTypeModel(
                RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword)),
            CurrentTypeResponseModel());

      emit(CurrentTypeLoading(changeLoading()));
        emit(CurrentTypeLoaded(response));

        print("başarılı");

    }
    catch(e){
      print(e);
      emit(CurrentTypeError("An Error Occurred!"));
    }
  }



  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }
}