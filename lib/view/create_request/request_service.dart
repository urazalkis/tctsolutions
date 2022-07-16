import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'request_model.dart';
import 'request_model_response.dart';

class RequestService {
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;
  static RequestService instance = RequestService._init();
  RequestService._init();


  Future<RequestResponseModel?> fetchRequestResponse(RequestModel model,RequestResponseModel responseModel) async {

    final response = await networkManager!.response<RequestModel,RequestResponseModel>(model, responseModel, UrlService.instance.createRequestUrl);
    if (response.data is RequestResponseModel) {
      print("gelen response data:${response.data!.success ?? "null"}");
      return response.data;
    } else {
      return null;
    }

  }
}