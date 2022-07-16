import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_model.dart';
import 'package:motaperp_tctsolutions/view/employee/profile/profile_employee_model_response.dart';

abstract class  IProfileEmployeeService{
  Future<ProfileEmployeeResponseModel?> fetchUpdateUserName(ProfileEmployeeModel model,ProfileEmployeeResponseModel responseModel);
  Future<ProfileEmployeeResponseModel?> fetchUpdatePassword(ProfileEmployeeModel model,ProfileEmployeeResponseModel responseModel);
  Future<ProfileEmployeeResponseModel?> profileInformation(ProfileEmployeeModel model,ProfileEmployeeResponseModel responseModel);
}

class ProfileEmployeeService implements IProfileEmployeeService{
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;



  Future<ProfileEmployeeResponseModel?> fetchUpdateUserName(ProfileEmployeeModel model,ProfileEmployeeResponseModel responseModel) async {

    final response = await networkManager!.response<ProfileEmployeeModel,ProfileEmployeeResponseModel>(model, responseModel, UrlService.instance.profileUpdateUserNameUrl);

    if (response.data is ProfileEmployeeResponseModel) {
      return response.data;
    } else {
      return null;
    }


  }
  Future<ProfileEmployeeResponseModel?> fetchUpdatePassword(ProfileEmployeeModel model,ProfileEmployeeResponseModel responseModel) async {

    final response = await networkManager!.response<ProfileEmployeeModel,ProfileEmployeeResponseModel>(model, responseModel, UrlService.instance.profileUpdatePasswordUrl);
    if (response.data is ProfileEmployeeResponseModel) {
      return response.data;
    } else {
      return null;
    }

  }
  Future<ProfileEmployeeResponseModel?> profileInformation(ProfileEmployeeModel model,ProfileEmployeeResponseModel responseModel) async {

    final response = await networkManager!.response<ProfileEmployeeModel,ProfileEmployeeResponseModel>(model, responseModel, UrlService.instance.profileInformationEmployeeUrl);
    if (response.data is ProfileEmployeeResponseModel) {
      return response.data;
    } else {
      return null;
    }

  }
}