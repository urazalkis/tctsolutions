import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'job_business_model.dart';
import 'job_business_model_response.dart';

abstract class  IJobBusinessService{
  Future<dynamic> fetchJobResponse(JobBusinessModel model,JobBusinessResponseModel responseModel);
}

class JobBusinessService implements IJobBusinessService{
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;



  Future<dynamic> fetchJobResponse(JobBusinessModel model,JobBusinessResponseModel responseModel) async {

    final response = await networkManager!.responseList<JobBusinessModel,JobBusinessResponseModel>(model, responseModel, UrlService.instance.jobListBusinessUrl);
      print("gelen response data:${response.data}");
      return response.data;


  }
}