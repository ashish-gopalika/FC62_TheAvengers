import 'package:enduserapp/model/address_model.dart';
import 'package:flutter/material.dart';
import 'end_user_model.dart';

class UserData extends ChangeNotifier {
  static EndUserModel endUserModel = EndUserModel();
  static List<AddressModel> addressList = [];


}