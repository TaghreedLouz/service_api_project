class APISettings{
  static String BASE_URL = "https://studentucas.awamr.com/public/api/";
  static String register = "${BASE_URL}auth/register/user";
  static String login = "${BASE_URL}auth/login/user";
  static String all_services = "${BASE_URL}all/works";
  static String services_by_id = "${BASE_URL}${all_services}/{id}";
  static String add_order = "${BASE_URL}create/order";
}