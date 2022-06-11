import 'package:flutter/material.dart';
class AddressModel {
  final String name;
  final String phoneNumber;
  final String pinCode;
  final String houseName;
  final String area;
  final String landmark;
  final String town;
  final String state;
  final String country;

  AddressModel({
    required this.name,
    required this.phoneNumber,
    required this.pinCode,
    required this.houseName,
    required this.area,
    required this.landmark,
    required this.town,
    required this.state,
    required this.country,
  });


  factory AddressModel.fromMap(map){
    return AddressModel(
        name: map['name'],
        phoneNumber: map['phoneNumber'],
        pinCode: map['pinCode'],
        houseName: map['houseName'],
        area: map['area'],
        landmark: map['landmark'],
        town: map['town'],
        state: map['state'],
      country: map['country'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'phoneNumber': phoneNumber,
      'pinCode': pinCode,
      'houseName': houseName,
      'area': area,
      'landmark': landmark,
      'town': town,
      'state': state,
      'country': country,
    };
  }


}