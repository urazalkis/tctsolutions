import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'my_jobs_detail_model.dart';
import 'my_job_detail_model_response.dart';

abstract class  IMyJobDetailService{
  Future<dynamic> fetchEmployeeDetailResponse(MyJobDetailModel model,MyJobDetailResponseModel responseModel);
  Future<MyJobDetailResponseModel?> fetchQrValidation(MyJobDetailModel model,MyJobDetailResponseModel responseModel);
}

class MyJobDetailService implements IMyJobDetailService{
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;



  Future<dynamic> fetchEmployeeDetailResponse(MyJobDetailModel model,MyJobDetailResponseModel responseModel) async {

    final response = await networkManager!.responseList<MyJobDetailModel,MyJobDetailResponseModel>(model, responseModel, UrlService.instance.employeeDetailBusinessUrl);
      print("gelen response data:${response.data ?? "null"}");
      return response.data;

  }
  Future<MyJobDetailResponseModel?> fetchQrValidation(MyJobDetailModel model,MyJobDetailResponseModel responseModel) async {

    final response = await networkManager!.response<MyJobDetailModel,MyJobDetailResponseModel>(model, responseModel, UrlService.instance.qrValidationUrl);
    print("gelen response data:${response.data}");
    return response.data;

  }
}