import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/product/cubit/city/city_response_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

import 'city_model.dart';
import 'city_service.dart';
import 'city_state.dart';

class CityCubit extends Cubit<ICityState>  with IBaseViewModel
{

  ICityService? service;
 bool isLoading = false;
  CityCubit({this.service}):super(CityInit());

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
      emit(CityLoading(changeLoading()));

        final response = await service!.fetchList(
            CityModel(
                RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword)),
            CityResponseModel());
      emit(CityLoading(changeLoading()));
        emit(CityLoaded(response));

        print("başarılı");

    }
    catch(e){
      print(e);
      emit(CityError("An Error Occurred!"));
    }
  }


  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }
}