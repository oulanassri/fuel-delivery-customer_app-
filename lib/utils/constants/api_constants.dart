/* -- LIST OF Constants used in APIs -- */

class APIConstants {
  static final String baseUrl = "http://192.168.245.17:5000";

  static _EndPoints endPoints = _EndPoints();
}

class _EndPoints {
  //Customer
  final String register = "/api/Customer/Register"; //POST  True
  final String getMyProperties = "/api/Customer/get-my-properties"; //GET
  final String getMyOrders = "/api/Customer/get-my-orders"; //GET

//User
  final String login = "/api/User/login"; //POST
  final String editPassword = "/api/User/edit-password"; //PUT

//CustomerApartment
  final String addAppartment = "/api/CustomerApartment/add-appartment"; //POST
  final String deleteApartment =
      "/api/CustomerApartment/delete-apartment"; //PATCH

//CustomerCar
  final String addCar = "/api/CustomerCar/add-car"; //POST
  final String deleteCar = "/api/CustomerCar/delete-car"; //PATCH

//Order
  final String placeCarOrder = "/api/Order/place-car-order"; //POST
  final String placeHouseOrder = "/api/Order/place-house-order"; //POST
  final String trackOrder = "/api/Order/track-order"; //GET

  //Wallet
  final String getMyWallet = "/api/Wallet/get-my-wallet"; //GET
}
