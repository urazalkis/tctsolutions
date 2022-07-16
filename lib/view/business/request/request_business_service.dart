import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'request_business_model.dart';
import 'request_business_model_response.dart';

class RequestBusinessService {
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;
  static RequestBusinessService instance = RequestBusinessService._init();
  RequestBusinessService._init();


  Future<RequestBusinessResponseModel?> fetchProfileResponse(RequestBusinessModel model,RequestBusinessResponseModel responseModel) async {

    final response = await networkManager!.response<RequestBusinessModel,RequestBusinessResponseModel>(model, responseModel, UrlService.instance.requestBusinessUrl);
    if (response.data is RequestBusinessResponseModel) {
      print("gelen response data:${response.data!.success ?? "null"}");
      return response.data;
    } else {
      return null;
    }

  }
}