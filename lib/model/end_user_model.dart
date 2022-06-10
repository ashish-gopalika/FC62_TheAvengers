class EndUserModel{
  String? uid;
  String? email;
  String? name;
  String? phoneNumber;
  List<String>? addresses;
  List<String>? orders;
  List<String>? cart;

  EndUserModel({this.uid,this.email,this.name,this.orders,this.phoneNumber,this.addresses,this.cart});

  //data from server
  factory EndUserModel.fromMap(map){
    return EndUserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      cart: map['cart'] is Iterable ? List.from(map['cart']) : null,
      addresses: map['addresses'] is Iterable ? List.from(map['addresses']) : null,
      orders: map['orders'] is Iterable ? List.from(map['orders']) : null,
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'addresses': addresses,
      'cart': cart,
      'orders': orders,
    };
  }

}