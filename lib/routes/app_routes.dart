

abstract class Routes{
  Routes._();
  static const SPLASH=Paths.SPLASH;
  static const LOGIN=Paths.LOGIN;
  static const LOGOUT=Paths.LOGOUT;
  static const SIGNUP=Paths.SIGNUP;


  static const HOME=Paths.HOME;


  static const WALLET=Paths.WALLET;
  static const ORDERS=Paths.ORDERS;
  static const PROFILE=Paths.PROFILE;
  static const PROPERTIES=Paths.PROPERTIES;
  static const SETTINGS=Paths.SETTINGS;
  static const CARFUELDEMAND=Paths.CARFUELDEMAND;
  static const HOUSEFUELDEMAND=Paths.HOUSEFUELDEMAND;
}

abstract class Paths{
  Paths._();
  static const  SPLASH='/splash';
  static const  LOGIN='/login';
  static const  LOGOUT='/logout_screen';

  static const  SIGNUP='/sign_up_screen';
  static const  HOME='/home_screen';

  static const WALLET='/wallet_screen';
  static const ORDERS='/orders_screen';
  static const PROFILE='/profile_screen';
  static const PROPERTIES='/properties_screen';
  static const SETTINGS='/settings_screen';
  static const CARFUELDEMAND='/car_fuel_demand_screen';
  static const HOUSEFUELDEMAND='/house_fuel_demand_screen';
}