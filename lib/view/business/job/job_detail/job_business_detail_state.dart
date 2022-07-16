import 'job_business_detail_model_response.dart';

abstract class IJobBusinessDetailState{
  IJobBusinessDetailState();

}

class JobBusinessDetailInit extends IJobBusinessDetailState{
  JobBusinessDetailInit();
}
class JobBusinessDetailLoading extends IJobBusinessDetailState{
  late bool isLoading;
  JobBusinessDetailLoading(isLoading);
}
class JobBusinessDetailLoaded extends IJobBusinessDetailState{

  List<JobBusinessDetailResponseModel> myList;
  JobBusinessDetailLoaded(this.myList);
}
class SuccessQR extends IJobBusinessDetailState{

  late String qrCode;
  SuccessQR(this.qrCode);
}
class JobBusinessDetailError extends IJobBusinessDetailState{
  String errorMessage;
  JobBusinessDetailError(this.errorMessage);
}