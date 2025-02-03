import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../native_service/get_storage.dart';



class SignUpController extends GetxController {
  final getStorage = GetStorage();
  late UserStorage storage;
  int? statusCode = 0;

  //vars of screen
  final userNameController = TextEditingController();
  final lastUserNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final signupFormKey = GlobalKey<FormState>();

  RxBool isPasswordHidden = true.obs;
  RxBool isPasswordConfirmHidden = true.obs;
  RxString imagePath = ''.obs;
  var selectedImageSize = ''.obs;

  FocusNode usernameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  //vars of api call
  late String userName;
  late String email;

  late String mobileNumber;

  late String password;
  late String confirmPassword;
  late String filePathing;
  late String fileName;
  late String imagePathing;
  late String imageName;

 // late SignUpResponseModel signUpResponseModel;



  //vars of api response
  String message = '';
  bool signUpStatus = false;
  bool isLoading = false;

  @override
  void onInit() {
    userName = '';
    email = '';
    mobileNumber = '';
    password = '';
    confirmPassword = '';
    filePathing = '';
    imagePathing = '';
    imageName = '';
    storage=UserStorage();
    // _addListener();
    // textFieldFocusNode.hasFocus = false;
    super.onInit();
  }



/*  Future<bool> userRegister({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
    required String imagePathing,
    required String imageName,
    required String filePath,
    required String fileName,
  }) async {
    print('User Register:');
    print('Email: $email');
    print('Password: $password');
    print('Phone Number: $phoneNumber');
    print('passwordConfirmation : $passwordConfirmation');
    print('name: $name');
    print('imageName: $imageName');
    print('imagePathing: $imagePathing');
    print('fileName: $fileName');
    print('filePath: $filePath');

    try {
      dynamic response =await DioHelper.postRegisterData(
          name: name,
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation,
          phoneNumber: phoneNumber,
          imagePathing: imagePathing,
          imageName: imageName,
          filePathing: filePath,
          fileName: fileName);


      return true; // Indicate success
    } catch (error) {
      if (error is DioException) {
        print('DioException occurred:');
        print(error.message);

        if (error.response != null) {
          print('Response data:');//here i have to print the error to the user
          print(error.response?.data['errors']);
          print('Status code:');
          print(error.response?.statusCode);
          statusCode = error.response?.statusCode!;
        }
      } else {
        print('An unexpected error occurred:');
        print(error);
      }
      return false; // Indicate failure
    }
  }*/




  @override
  void onClose() {
    userNameController.dispose();
    //usernameFocusNode.dispose();
    emailController.dispose();
    // emailFocusNode.dispose();
    mobileNumberController.dispose();

    passwordController.dispose();
    // passwordFocusNode.dispose();
    confirmPasswordController.dispose();
    //  confirmPasswordFocusNode.dispose();

    super.onClose();
  }


//Function called by screen
  /*Future getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path ?? "");
      getStorage.write('profile image', result.files.single.path);
      imageName = file.path.split('/').last;
      imagePathing = file.path;
      imagePath.value=imagePathing;
      getStorage.write('profile image', file.path.toString());
      imagePath=imagePathing.obs;
    } else {
      print("result image is null");
    }

  }*/


}
