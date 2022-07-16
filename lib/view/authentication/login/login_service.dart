import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'login_model.dart';
import 'login_model_response.dart';

class LoginService {
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;
  static LoginService instance = LoginService._init();
  LoginService._init();


  //IResponseModel<LoginModelResponse>?
  Future<LoginModelResponse?> fetchUserControl(LoginModel model,LoginModelResponse responseModel) async {

    final response = await networkManager!.response<LoginModel,LoginModelResponse>(model, responseModel, UrlService.instance.loginUrl);
   if (response.data is LoginModelResponse) {
     print("gelen response data:${response.data!.success ?? "null"}");
      return response.data;
    } else {
      return null;
    }

  }

}