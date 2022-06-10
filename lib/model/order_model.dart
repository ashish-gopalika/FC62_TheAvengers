class OrderModel{
  String? uid;
  String? userUid;
  List<String>? products;
  List<String>? quantity;
  String? time;

  OrderModel({this.uid,this.products,this.quantity,this.userUid,this.time});

  //data from server
  factory OrderModel.fromMap(map){
    return OrderModel(
      uid: map['uid'],
      userUid: map['userUid'],
      time: map['time'],
      quantity: map['quantity'] is Iterable ? List.from(map['quantity']) : null,
      products: map['products'] is Iterable ? List.from(map['products']) : null,
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'userUid': userUid,
      'quantity': quantity,
      'products': products,
      'time': time,
    };
  }
}