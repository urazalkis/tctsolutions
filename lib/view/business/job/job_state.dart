
import 'package:motaperp_tctsolutions/view/business/job/job_business_model_response.dart';

abstract class IJobBusinessState{
  IJobBusinessState();

}

class JobBusinessInit extends IJobBusinessState{
  JobBusinessInit();
}
class JobBusinessLoading extends IJobBusinessState{
  late bool isLoading;
  JobBusinessLoading(isLoading);
}
class JobBusinessLoaded extends IJobBusinessState{

  List<JobBusinessResponseModel> myList;
  JobBusinessLoaded(this.myList);
}
class JobBusinessError extends IJobBusinessState{
  String errorMessage;
  JobBusinessError(this.errorMessage);
}