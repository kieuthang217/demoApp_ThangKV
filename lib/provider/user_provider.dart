import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_widget/models/user.dart';
import 'package:text_widget/sql/db_helper.dart';

class UserProvider with ChangeNotifier {
  DbHelper dbHelper = DbHelper();


  late Future<List<User>> _user;
  Future<List<User>> get user => _user;

  Future<List<User>> getData() async{
    _user = dbHelper.getCartList();
    return _user;
  }










}