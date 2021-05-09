// To parse this JSON data, do
//
//     final checkout = checkoutFromJson(jsonString);

import 'dart:convert';

Checkout checkoutFromJson(String str) => Checkout.fromJson(json.decode(str));

String checkoutToJson(Checkout data) => json.encode(data.toJson());

class Checkout {
  Checkout({
    this.checkout,
  });

  List<CheckoutElement> checkout;

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
    checkout: List<CheckoutElement>.from(json["checkout"].map((x) => CheckoutElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "checkout": List<dynamic>.from(checkout.map((x) => x.toJson())),
  };
}

class CheckoutElement {
  CheckoutElement({
    this.name,
    this.dateTime,
    this.price,
    this.isPrivate,
    this.location,
    this.gameLength,
    this.paymentMethodUnsupported,
    this.mainImage,
    this.id,
  });

  String name;
  String dateTime;
  double price;
  bool isPrivate;
  String location;
  String gameLength;
  String paymentMethodUnsupported;
  String mainImage;
  int id;

  factory CheckoutElement.fromJson(Map<String, dynamic> json) => CheckoutElement(
    name: json["name"],
    dateTime: json["dateTime"],
    price: json["price"].toDouble(),
    isPrivate: json["isPrivate"],
    location: json["location"],
    gameLength: json["gameLength"],
    paymentMethodUnsupported: json["paymentMethodUnsupported"],
    mainImage: json["mainImage"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "dateTime": dateTime,
    "price": price,
    "isPrivate": isPrivate,
    "location": location,
    "gameLength": gameLength,
    "paymentMethodUnsupported": paymentMethodUnsupported,
    "mainImage": mainImage,
    "id": id,
  };
}
