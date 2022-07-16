import 'my_job_detail_model_response.dart';

abstract class IMyJobDetailState{
  IMyJobDetailState();

}

class MyJobDetailInit extends IMyJobDetailState{
  MyJobDetailInit();
}
class MyJobDetailLoading extends IMyJobDetailState{
  late bool isLoading;
  MyJobDetailLoading(isLoading);
}
class MyJobDetailLoaded extends IMyJobDetailState{

  List<MyJobDetailResponseModel> myList;
  MyJobDetailLoaded(this.myList);
}
class MyJobDetailError extends IMyJobDetailState{
  String errorMessage;
  MyJobDetailError(this.errorMessage);
}