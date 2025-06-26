/* -- LIST OF Constants used in APIs -- */

class APIConstants {
  static final String baseUrl ="http://172.201.110.216:5000";

  static _EndPoints endPoints = _EndPoints();
}

class _EndPoints {
  //Customer
  final String register = "/api/Customer/Register"; //POST  True
  final String getMyProperties = "/api/Customer/get-my-properties"; //GET  True
  final String getMyOrders = "/api/Customer/get-my-orders"; //GET

//User
  final String login = "/api/User/login"; //POST  True
  final String editPassword = "/api/User/edit-password"; //PUT True

//CustomerApartment
  final String addApartment = "/api/CustomerApartment/add-appartment"; //POST True
  final String deleteApartment =
      "/api/CustomerApartment/delete-apartment"; //PATCH True

//CustomerCar
  final String addCar = "/api/CustomerCar/add-car"; //POST True
  final String deleteCar = "/api/CustomerCar/delete-car"; //PATCH True

//Order
  final String placeCarOrder = "/api/Order/place-car-order"; //POST True
  final String placeHouseOrder = "/api/Order/place-house-order"; //POST True
  final String trackOrder = "/api/Order/track-order"; //GET

  //Wallet
  final String getMyWallet = "/api/Wallet/get-my-wallet"; //GET True
  final String requestOTP = "/api/Wallet/request-otp"; //POST


  //City
  final String getCities = "/api/City/get-cities"; //GET True

  //Neighborhood
  final String getNeighborhood = "/api/Neighborhood/get-neighborhood"; //GET True

  final String getFuelDetails = "/api/FuelDetails/get-fuel-details";//GET True

  final String getProfile = "/api/User/get-profile";
  final String getAuthCode = "/api/Order/get-authcode";

}
