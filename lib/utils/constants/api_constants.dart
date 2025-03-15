/* -- LIST OF Constants used in APIs -- */

class APIConstants {
  static final String baseUrl ="http://192.168.7.17:5000";//"http://192.168.7.17:5000"; //"http://127.0.0.1:5000";

  static _EndPoints endPoints = _EndPoints();
}

class _EndPoints {
  //Customer
  final String register = "/api/Customer/Register"; //POST  True
  final String getMyProperties = "/api/Customer/get-my-properties"; //GET  True
  final String getMyOrders = "/api/Customer/get-my-orders"; //GET

//User
  final String login = "/api/User/login"; //POST  True
  final String editPassword = "/api/User/edit-password"; //PUT

//CustomerApartment
  final String addApartment = "/api/CustomerApartment/add-appartment"; //POST True
  final String deleteApartment =
      "/api/CustomerApartment/delete-apartment"; //PATCH

//CustomerCar
  final String addCar = "/api/CustomerCar/add-car"; //POST True
  final String deleteCar = "/api/CustomerCar/delete-car"; //PATCH True

//Order
  final String placeCarOrder = "/api/Order/place-car-order"; //POST
  final String placeHouseOrder = "/api/Order/place-house-order"; //POST True
  final String trackOrder = "/api/Order/track-order"; //GET

  //Wallet
  final String getMyWallet = "/api/Wallet/get-my-wallet"; //GET True

  //City
  final String getCities = "/api/City/get-cities"; //GET True

  //Neighborhood
  final String getNeighborhood = "/api/Neighborhood/get-neighborhood"; //GET True

  final String getFuelDetails = "/api/FuelDetails/get-fuel-details";//GET True

}
