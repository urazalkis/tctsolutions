import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_view_model.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/product/cubit/potential_jobs/potential_jobs_response_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';
import 'potential_jobs_model.dart';
import 'potential_jobs_service.dart';
import 'potential_jobs_state.dart';

class PotentialJobsCubit extends Cubit<IPotentialJobsState>  with IBaseViewModel
{

  IPotentialJobsService? service;
 bool isLoading = false;
  PotentialJobsCubit({this.service}):super(PotentialJobsInit());

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
      emit(PotentialJobsLoading(changeLoading()));

        final response = await service!.fetchList(
            PotentialJobsModel(
                RegisterModel(dbName:ApplicationConstants.dbName,dbUserName:ApplicationConstants.dbUsername,dbPassword:ApplicationConstants.dbPassword)),
            PotentialJobsResponseModel());
      emit(PotentialJobsLoading(changeLoading()));
        emit(PotentialJobsLoaded(response));

        print("başarılı");

    }
    catch(e){
      print(e);
      emit(PotentialJobsError("An Error Occurred!"));
    }
  }


  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }
}