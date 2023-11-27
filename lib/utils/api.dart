class Api {
  static String baseUrl = 'https://backend.sdirbinsen.com';

  static String api = "/api";
  static String api_version = "/v1";

  //Api Login
  static String login = "${baseUrl + api + api_version}/auth/login";

  //Api User
  static String user = "${baseUrl + api + api_version}/admin/user";

  //Api Personil
  static String personil = "${baseUrl + api + api_version}/admin/personil";

  //Api download personil
  static String download_personil = "${baseUrl + api + api_version}/admin/personil_download/pdf";

  //Api Material
  static String material = "${baseUrl + api + api_version}/admin/material";
}
