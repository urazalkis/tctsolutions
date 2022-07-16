import 'package:motaperp_tctsolutions/product/cubit/current_type/current_type_response_model.dart';

abstract class ICurrentTypeState{
  ICurrentTypeState();

}

class CurrentTypeInit extends ICurrentTypeState{
  CurrentTypeInit();
}
class CurrentTypeLoading extends ICurrentTypeState{
  late bool isLoading;
  CurrentTypeLoading(isLoading);
}
class CurrentTypeLoaded extends ICurrentTypeState{

  List<CurrentTypeResponseModel> myList;
  CurrentTypeLoaded(this.myList);
}
class CurrentTypeError extends ICurrentTypeState{
  String errorMessage;
  CurrentTypeError(this.errorMessage);
}