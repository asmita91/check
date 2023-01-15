import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/UserModel.dart';
import '../repositories/authenti_repository.dart';
import '../services/firebase_service.dart';

class AuthViewModel with ChangeNotifier {
  User? _user = FirebaseService.firebaseAuthe.currentUser;

  User? get user => _user;

  UserModel? _loggedInUser;
  UserModel? get loggedInUser => _loggedInUser;

  Future<void> login(String email, String password) async {
    try {
      var response = await AuthentiRepository().login(email, password);
      _user = response.user;
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await AuthentiRepository().resetPassword(email);
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> register(UserModel user) async {
    try {
      var response = await AuthentiRepository().register(user);
      _user = response!.user;
      _loggedInUser = await AuthentiRepository().getUserDetail(_user!.uid);
      notifyListeners();
    } catch (err) {
      AuthentiRepository().logout();
      rethrow;
    }
  }

  // Future<void> checkLogin() async {
  //   try {
  //     _loggedInUser = await AuthentiRepository().getUserDetail(_user!.uid);
  //     notifyListeners();
  //   } catch (err) {
  //     _user = null;
  //     AuthentiRepository.logout();
  //     rethrow;
  //   }
  // }

  Future<void> logout() async {
    try {
      await AuthentiRepository().logout();
      _user = null;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
