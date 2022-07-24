class ProjectApis {
  static String baseUrl = "https://cjays-panel.herokuapp.com/";
  static String localBaseUrl = "0.0.0.0:8000/";

  String loginUrl = "${baseUrl}api/auth/login";
  String registerUrl = "${baseUrl}api/auth/register";

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
}
