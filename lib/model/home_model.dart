import 'dart:math';
import 'package:flutter/material.dart';
import 'package:picture_lib/model/entity/result_entity.dart';

///首页信息处理类
class HomeModel extends ChangeNotifier {
  List<Result> _allPictureList = List<Result>();
  List<Result> _resultList = List<Result>();

  List<Result> get resultList => _resultList;
  List<Result> get allPictureList => _allPictureList;

  saveAllPictureList(ResultEntity resultEntity) {
    _allPictureList.clear();
    _allPictureList.addAll(resultEntity?.results);
    notifyListeners();
  }

  saveHomePictureList() {
    _resultList.clear();
    int random = Random().nextInt(_allPictureList.length);
    _resultList.add(_allPictureList[random]);
    _allPictureList.removeAt(random);
    notifyListeners();
  }

  clearHomePictureList() {
    _resultList.clear();
    notifyListeners();
  }

  clearAllPictureList() {
    _allPictureList.clear();
    notifyListeners();
  }
}
