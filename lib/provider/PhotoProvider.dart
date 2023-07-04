import 'package:flutter/material.dart';
import 'package:flutter_exam_/db/PhotoDBService.dart';
import 'package:flutter_exam_/model/PhotoModel.dart';

class PhotoProvider extends ChangeNotifier {
  PhotoProvider() {
    getPhoto();
  }

  bool isLoading = false;
  String error = '';
  PhotoDBService photoDBService = PhotoDBService();
  List<PhotoModel> data = [];

  Future<void> getPhoto() async {
    isLoading = true;
    notifyListeners();
    dynamic response = await photoDBService.checkbox();
    if (response is List<PhotoModel>) {
      isLoading = false;
      data = response;
      notifyListeners();
    } else {
      isLoading = false;
      error = response;
      notifyListeners();
    }
  }
}
