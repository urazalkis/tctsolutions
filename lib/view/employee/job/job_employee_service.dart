import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'job_employee_model.dart';
import 'job_employee_model_response.dart';

abstract class  IJobEmployeeService{
  Future<dynamic> fetchJobResponse(JobEmployeeModel model,JobEmployeeResponseModel responseModel);
  Future<JobEmployeeResponseModel?> fetchCanBeReserveJobResponse(JobEmployeeModel model,JobEmployeeResponseModel responseModel);
  Future<JobEmployeeResponseModel?> fetchCancelReserveJobResponse(JobEmployeeModel model,JobEmployeeResponseModel responseModel);
}

class JobEmployeeService implements IJobEmployeeService{
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;



  Future<dynamic> fetchJobResponse(JobEmployeeModel model,JobEmployeeResponseModel responseModel) async {

    final response = await networkManager!.responseList<JobEmployeeModel,JobEmployeeResponseModel>(model, responseModel, UrlService.instance.jobListEmployeeUrl);
      print("gelen response data:${response.data}");
      return response.data;
  }

  Future<JobEmployeeResponseModel?> fetchCanBeReserveJobResponse(JobEmployeeModel model,JobEmployeeResponseModel responseModel) async {

    final response = await networkManager!.response<JobEmployeeModel,JobEmployeeResponseModel>(model, responseModel, UrlService.instance.reserveJobEmployeeUrl);
    print("gelen response data:${response.data}");
    return response.data;
  }

  Future<JobEmployeeResponseModel?> fetchCancelReserveJobResponse(JobEmployeeModel model,JobEmployeeResponseModel responseModel) async {

    final response = await networkManager!.response<JobEmployeeModel,JobEmployeeResponseModel>(model, responseModel, UrlService.instance.cancelReserveJobEmployeeUrl);
    print("gelen response data:${response.data}");
    return response.data;
  }
}