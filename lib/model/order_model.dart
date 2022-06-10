class OrderModel{
  String? uid;
  String? productUid;
  String? productName;
  String? image;
  String? price;
  String? quantity;
  String? time;

  OrderModel({this.uid,this.productName,this.quantity,this.productUid,this.time,this.image,this.price});

  //data from server
  factory OrderModel.fromMap(map){
    return OrderModel(
      uid: map['uid'],
      productUid: map['userUid'],
      time: map['time'],
      image: map['image'],
      quantity: map['quantity'],
      productName: map['productName'],
      price: map['price']
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'userUid': productUid,
      'quantity': quantity,
      'productName': productName,
      'time': time,
      'image': image,
      'price': price,
    };
  }
}