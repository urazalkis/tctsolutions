import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'my_job_employee_model.dart';
import 'my_job_employee_model_response.dart';

abstract class  IMyJobEmployeeService{
  Future<dynamic> fetchActiveJobResponse(MyJobEmployeeModel model,MyJobEmployeeResponseModel responseModel);
  Future<dynamic> fetchPastJobResponse(MyJobEmployeeModel model,MyJobEmployeeResponseModel responseModel);
  Future<dynamic> fetchPendingApprovalJobResponse(MyJobEmployeeModel model,MyJobEmployeeResponseModel responseModel);
  Future<dynamic> fetchReservedJobResponse(MyJobEmployeeModel model,MyJobEmployeeResponseModel responseModel);
}

class MyJobEmployeeService implements IMyJobEmployeeService{
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;



  Future<dynamic> fetchActiveJobResponse(MyJobEmployeeModel model,MyJobEmployeeResponseModel responseModel) async {

    final response = await networkManager!.responseList<MyJobEmployeeModel,MyJobEmployeeResponseModel>(model, responseModel, UrlService.instance.activeJobEmployeeUrl);
      print("gelen response data:${response.data}");
      return response.data;

  }
  Future<dynamic> fetchPastJobResponse(MyJobEmployeeModel model,MyJobEmployeeResponseModel responseModel) async {

    final response = await networkManager!.responseList<MyJobEmployeeModel,MyJobEmployeeResponseModel>(model, responseModel, UrlService.instance.pastJobEmployeeUrl);
    print("gelen response data:${response.data}");
    return response.data;

  }
  Future<dynamic> fetchPendingApprovalJobResponse(MyJobEmployeeModel model,MyJobEmployeeResponseModel responseModel) async {

    final response = await networkManager!.responseList<MyJobEmployeeModel,MyJobEmployeeResponseModel>(model, responseModel, UrlService.instance.pendingApprovalJobEmployeeUrl);
    print("gelen response data:${response.data}");
    return response.data;

  }
  Future<dynamic> fetchReservedJobResponse(MyJobEmployeeModel model,MyJobEmployeeResponseModel responseModel) async {

    final response = await networkManager!.responseList<MyJobEmployeeModel,MyJobEmployeeResponseModel>(model, responseModel, UrlService.instance.reserveJobEmployeeUrl);
    print("gelen response data:${response.data}");
    return response.data;

  }
}