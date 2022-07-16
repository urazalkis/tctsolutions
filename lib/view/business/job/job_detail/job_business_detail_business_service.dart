import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'job_business_detail_model.dart';
import 'job_business_detail_model_response.dart';

abstract class  IJobBusinessDetailService{
  Future<dynamic> fetchJobDetailResponse(JobBusinessDetailModel model,JobBusinessDetailResponseModel responseModel);
}

class JobBusinessDetailService implements IJobBusinessDetailService{
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;



  Future<dynamic> fetchJobDetailResponse(JobBusinessDetailModel model,JobBusinessDetailResponseModel responseModel) async {

    final response = await networkManager!.responseList<JobBusinessDetailModel,JobBusinessDetailResponseModel>(model, responseModel, UrlService.instance.jobListDetailBusinessUrl);
      print("gelen response data:${response.data ?? "null"}");
      return response.data;

  }
}