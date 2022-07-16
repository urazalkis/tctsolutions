import 'city_response_model.dart';

abstract class ICityState{
  ICityState();

}

class CityInit extends ICityState{
  CityInit();
}
class CityLoading extends ICityState{
  late bool isLoading;
  CityLoading(isLoading);
}
class CityLoaded extends ICityState{

  List<CityResponseModel> myList;
  CityLoaded(this.myList);
}
class CityError extends ICityState{
  String errorMessage;
  CityError(this.errorMessage);
}