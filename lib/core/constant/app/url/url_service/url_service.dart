class UrlService {
  static UrlService instance = UrlService._init();
  UrlService._init();

  static const baseServiceUrl = "https://www.motaperp.com/UrazMobil/motaperp_tctsolutions/";
  final registerBusinessUrl = baseServiceUrl+"authenticate/registerBusiness.php";
  final registerEmployeeUrl = baseServiceUrl+"authenticate/registerEmployee.php";
  final loginUrl = baseServiceUrl+"authenticate/login.php";
  final currentTypeUrl = baseServiceUrl+"list/currentType.php";
  final cityUrl = baseServiceUrl+"list/city.php";
  final potentialJobsUrl = baseServiceUrl+"list/potential_jobs.php";
  final departmentUrl = baseServiceUrl+"list/department.php";
  final createRequestUrl = baseServiceUrl+"request/request.php";

  final requestBusinessUrl = baseServiceUrl+"request/requestBusiness.php";

  final jobListBusinessUrl = baseServiceUrl+"job/business_job/jobListBusiness.php";
  final jobListDetailBusinessUrl = baseServiceUrl+"job/business_job/jobListDetailBusiness.php";
  final employeeDetailBusinessUrl = baseServiceUrl+"job/business_job/employeeDetailBusiness.php";

  final profileUpdateUserNameUrl = baseServiceUrl+"profile/updateUserName.php";
  final profileUpdatePasswordUrl = baseServiceUrl+"profile/updatePassword.php";
  final profileInformationEmployeeUrl = baseServiceUrl+"profile/profileInformationEmployee.php";

  final jobListEmployeeUrl = baseServiceUrl+"job/employee_job/job_pool/jobListEmployee.php";
  final reserveJobEmployeeUrl = baseServiceUrl+"job/employee_job/job_pool/reserveJobEmployee.php";
  final cancelReserveJobEmployeeUrl = baseServiceUrl+"job/employee_job/job_pool/cancelReserveJobEmployee.php";

  final activeJobEmployeeUrl = baseServiceUrl+"job/employee_job/my_job/activeJobEmployee.php";
  final pastJobEmployeeUrl = baseServiceUrl+"job/employee_job/my_job/pastJobEmployee.php";
  final reservedJobEmployeeUrl = baseServiceUrl+"job/employee_job/my_job/reservedJobEmployee.php";
  final pendingApprovalJobEmployeeUrl = baseServiceUrl+"job/employee_job/my_job/pendingApprovalJobEmployee.php";
  final qrValidationUrl = baseServiceUrl+"job/employee_job/my_job/qrValidation.php";

}