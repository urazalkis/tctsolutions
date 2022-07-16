import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'package:motaperp_tctsolutions/product/cubit/potential_jobs/potential_jobs_response_model.dart';
import 'potential_jobs_model.dart';


abstract class  IPotentialJobsService{
  Future<dynamic> fetchList(PotentialJobsModel model,PotentialJobsResponseModel responseModel);
}

class PotentialJobsService implements IPotentialJobsService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic>  fetchList(PotentialJobsModel model,PotentialJobsResponseModel responseModel) async {

    final response = await networkManager!.responseList<PotentialJobsModel, PotentialJobsResponseModel>(model, responseModel, UrlService.instance.potentialJobsUrl);
      print("gelen response data:${response.data!}");
      return response.data;

  }

}