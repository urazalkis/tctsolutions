import 'potential_jobs_response_model.dart';

abstract class IPotentialJobsState{
  IPotentialJobsState();

}

class PotentialJobsInit extends IPotentialJobsState{
  PotentialJobsInit();
}
class PotentialJobsLoading extends IPotentialJobsState{
  late bool isLoading;
  PotentialJobsLoading(isLoading);
}
class PotentialJobsLoaded extends IPotentialJobsState{

  List<PotentialJobsResponseModel> myList;
  PotentialJobsLoaded(this.myList);
}
class PotentialJobsError extends IPotentialJobsState{
  String errorMessage;
  PotentialJobsError(this.errorMessage);
}