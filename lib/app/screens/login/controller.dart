import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:safe_store/app/common/page_routes.dart';
import 'package:safe_store/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool showPass = false.obs;

  onShowPassPressed() {
    if (showPass.value) {
      showPass.value = false;
    } else {
      showPass.value = true;
    }
  }

  signup() async {
    String name = nameController.text;
    String email = emailController.text;
    String pass = passwordController.text;

    if (name.isEmpty || email.isEmpty || pass.isEmpty) {
      Get.snackbar('Empty fields', 'Please complete all fields');
      return;
    } //
    else if(!GetUtils.isEmail(email)){
      Get.snackbar('Wrong email', 'Please enter the correct email');
      return;
    }//
    else if(pass.length < 8){
      Get.snackbar('Wrong password', 'Your password must be longer than 8 characters');
      return;
    }
    else {
      http.Response response = await http.post(
        Uri.parse('${serverAddress}user'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": pass,
        }),
      );
      if(response.body == 'Duplicate email'){
        Get.snackbar('Duplicate email', 'This email has already been registered');
        return;
      }//
      else if(response.statusCode >= 200 && response.statusCode < 300){
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setInt('id', jsonDecode(response.body)['id']);
        pref.setString('name', jsonDecode(response.body)['name']);
        pref.setString('email', jsonDecode(response.body)['email']);
        pref.setString('role', jsonDecode(response.body)['role']);
        Get.offAllNamed(PageRoutes.INTRO);
      }//
      else{
        Get.snackbar('Bad request', 'The server has encountered a problem');
      }
    }
  }

  login() async {
    String email = emailController.text;
    String pass = passwordController.text;

    if (email.isEmpty || pass.isEmpty) {
      Get.snackbar('Empty fields', 'Please complete all fields');
      return;
    } //
    else if(!GetUtils.isEmail(email)){
      Get.snackbar('Wrong email', 'Please enter the correct email');
      return;
    }//
    else if(pass.length < 8){
      Get.snackbar('Wrong password', 'Your password must be longer than 8 characters');
      return;
    }
    else {
      http.Response response = await http.post(
        Uri.parse('${serverAddress}user/login'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name":"",
          "email": email,
          "password": pass,
        }),
      );
      if(response.statusCode >= 200 && response.statusCode < 300){
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setInt('id', jsonDecode(response.body)['id']);
        pref.setString('name', jsonDecode(response.body)['name']);
        pref.setString('email', jsonDecode(response.body)['email']);
        pref.setString('role', jsonDecode(response.body)['role']);
        if(pref.getString('role') == 'admin'){
          Get.offAllNamed(PageRoutes.ADMINHOME);
        }//
        else {
          Get.offAllNamed(PageRoutes.HOME);
        }
      }//
      else{
        Get.snackbar('Error', 'The email or password is incorrect!');
        print(response.body);
      }
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
