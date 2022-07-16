import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'current_type_model.dart';
import 'current_type_response_model.dart';

abstract class  ICurrentTypeService{
  Future<dynamic> fetchList(CurrentTypeModel model,CurrentTypeResponseModel responseModel);
}

class CurrentTypeService implements ICurrentTypeService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic>  fetchList(CurrentTypeModel model,CurrentTypeResponseModel responseModel) async {

    final response = await networkManager!.responseList<CurrentTypeModel, CurrentTypeResponseModel>(model, responseModel, UrlService.instance.currentTypeUrl);
      print("gelen response data:${response.data!}");
      return response.data;
  }

}