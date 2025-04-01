import 'package:delivery_fuel_customer/app/home/home_screen.dart';
import 'package:delivery_fuel_customer/app/properties/adding_house_screen.dart';
import 'package:delivery_fuel_customer/getx_bindings/fuel_demand_binding.dart';
import 'package:delivery_fuel_customer/getx_bindings/home_binding.dart';
import 'package:delivery_fuel_customer/getx_bindings/profile_binding.dart';
import 'package:get/get.dart';
import '../app/auth/LogIn/login_screen.dart';
import '../app/auth/SignUp/sign_up_screen.dart';
import '../app/auth/Splash/splash_screen.dart';
import '../app/fuel demand/car_fuel_demand_screen.dart';
import '../app/fuel demand/house_fuel_demand_screen.dart';
import '../app/orders/orders_screen.dart';
import '../app/profile/profile_screen.dart';
import '../app/properties/adding_house_controller.dart';
import '../app/properties/properties_screen.dart';
import '../app/settings/settings_screen.dart';
import '../app/wallet/wallet_screen.dart';
import '../getx_bindings/adding_house_binding.dart';
import '../getx_bindings/car_fuel_demand.dart';
import '../getx_bindings/login_binding.dart';
import '../getx_bindings/orders_binding.dart';
import '../getx_bindings/properties_binding.dart';
import '../getx_bindings/settings_binding.dart';
import '../getx_bindings/sign_up_binding.dart';
import '../getx_bindings/splash_binding.dart';
import '../getx_bindings/wallet_binding.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static final routes = [
    //Splash
    GetPage(
        name: Paths.SPLASH,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    //LogIn
    GetPage(
        name: Paths.LOGIN,
        page: () =>  LogInScreen(),
        binding: LoginBinding()),


    //SignUp
    GetPage(
        name: Paths.SIGNUP,
        page: () => const SignUpScreen(),
        binding: SignUpBinding()),

    //Home
    GetPage(
        name: Paths.HOME,
        page: () => const HomeScreen(),
        binding: HomeBinding()),



    //Wallet
    GetPage(
        name: Paths.WALLET,
        page: () => const WalletScreen(),
        binding: WalletBinding()),

    //Orders
    GetPage(
        name: Paths.ORDERS,
        page: () =>  OrdersScreen(),
        binding: OrdersBinding()),
    //Profile
    GetPage(
        name: Paths.PROFILE,
        page: () => const ProfileScreen(),
        binding: ProfileBinding()),
    //Properties
    GetPage(
        name: Paths.PROPERTIES,
        page: () =>  PropertiesScreen(),
        binding: PropertiesBinding()),
    //AddingHouseScreen
    GetPage(
        name: Paths.ADDINGHOUSESCREEN,
        page: () =>  AddingHouseScreen(),
        binding: AddingHouseBinding()),
    //Settings
    GetPage(
        name: Paths.SETTINGS,
        page: () => const SettingsScreen(),
        binding: SettingsBinding()),
    //Car Fuel Demand
    GetPage(
        name: Paths.CARFUELDEMAND,
        page: () =>  CarFuelDemandScreen(),
        binding: CarFuelDemandBinding()),
    //House Fuel Demand
    GetPage(
        name: Paths.HOUSEFUELDEMAND,
        page: () =>  HouseFuelDemandScreen(),
        binding: FuelDemandBinding()),

  ];
}
