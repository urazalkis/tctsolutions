import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'business_model.dart';
import 'business_model_response.dart';

class RegisterBusinessService {
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;
  static RegisterBusinessService instance = RegisterBusinessService._init();
  RegisterBusinessService._init();


  Future<BusinessResponseModel?> fetchUserControl(BusinessModel model,BusinessResponseModel responseModel) async {

    final response = await networkManager!.response<BusinessModel,BusinessResponseModel>(model, responseModel, UrlService.instance.registerBusinessUrl);
    if (response.data is BusinessResponseModel) {
      print("gelen response data:${response.data!.success ?? "null"}");
      return response.data;
    } else {
      return null;
    }

  }
}