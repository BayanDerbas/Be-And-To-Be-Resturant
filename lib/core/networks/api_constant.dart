class ApiConstant {
  static const String baseUrl = "http://127.0.0.1:8000/api";
  static const String imageBase = "http://127.0.0.1:8000";
  static const String register = "$baseUrl/auth/register";
  static const String login = "$baseUrl/auth/login";
  static const String logout = "$baseUrl/auth/logout";
  static const String refresh = "$baseUrl/auth/refresh";
  static const String branch = "$baseUrl/getbranches";
  static const String categories = "$baseUrl/getmaincategories";
  static const String request = "$baseUrl/getmaincategories";
  static const String getMeals = "$baseUrl/getmealsofcategory";
  static const String getTypesOfMeals = "$baseUrl/gettypesofmeal";
  static const String addToCart = "$baseUrl/addtocart";
  static const String show_cart = "$baseUrl/show_cart";
}