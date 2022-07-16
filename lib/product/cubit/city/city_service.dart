import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'city_model.dart';
import 'city_response_model.dart';


abstract class  ICityService{
  Future<dynamic> fetchList(CityModel model,CityResponseModel responseModel);
}

class CityService implements ICityService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic>  fetchList(CityModel model,CityResponseModel responseModel) async {

    final response = await networkManager!.responseList<CityModel, CityResponseModel>(model, responseModel, UrlService.instance.cityUrl);
      print("gelen response data:${response.data!}");
      return response.data;

  }

}