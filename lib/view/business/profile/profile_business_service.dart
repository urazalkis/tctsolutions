import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'package:motaperp_tctsolutions/view/business/profile/profile_business_model.dart';
import 'package:motaperp_tctsolutions/view/business/profile/profile_business_model_response.dart';

abstract class  IProfileBusinessService{
  Future<ProfileBusinessResponseModel?> fetchUpdateUserName(ProfileBusinessModel model,ProfileBusinessResponseModel responseModel);
  Future<ProfileBusinessResponseModel?> fetchUpdatePassword(ProfileBusinessModel model,ProfileBusinessResponseModel responseModel);
}

class ProfileBusinessService implements IProfileBusinessService{
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;



  Future<ProfileBusinessResponseModel?> fetchUpdateUserName(ProfileBusinessModel model,ProfileBusinessResponseModel responseModel) async {

    final response = await networkManager!.response<ProfileBusinessModel,ProfileBusinessResponseModel>(model, responseModel, UrlService.instance.profileUpdateUserNameUrl);

    if (response.data is ProfileBusinessResponseModel) {
      return response.data;
    } else {
      return null;
    }


  }
  Future<ProfileBusinessResponseModel?> fetchUpdatePassword(ProfileBusinessModel model,ProfileBusinessResponseModel responseModel) async {

    final response = await networkManager!.response<ProfileBusinessModel,ProfileBusinessResponseModel>(model, responseModel, UrlService.instance.profileUpdatePasswordUrl);
    if (response.data is ProfileBusinessResponseModel) {
      return response.data;
    } else {
      return null;
    }


  }
}