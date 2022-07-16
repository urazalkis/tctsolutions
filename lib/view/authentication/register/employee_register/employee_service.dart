import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'package:motaperp_tctsolutions/view/authentication/register/employee_register/employee_model.dart';
import 'package:motaperp_tctsolutions/view/authentication/register/employee_register/employee_model_response.dart';
class RegisterEmployeeService {
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;
  static RegisterEmployeeService instance = RegisterEmployeeService._init();
  RegisterEmployeeService._init();


  Future<EmployeeResponseModel?> fetchUserControl(EmployeeModel model,EmployeeResponseModel responseModel) async {

    final response = await networkManager!.response<EmployeeModel,EmployeeResponseModel>(model, responseModel, UrlService.instance.registerEmployeeUrl);
    if (response.data is EmployeeResponseModel) {
      print("gelen response data:${response.data!.success ?? "null"}");
      return response.data;
    } else {
      return null;
    }

  }
  }
