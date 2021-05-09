import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:tech_alchemy/Models/allEvents.dart';
import 'package:tech_alchemy/Models/eventDetail.dart';


class postPurchase{
  // final String dateTime;
  // final String eventId;
  // final String PaymentType;
  // final String purchasePrice;
  // postPurchase(this.purchasePrice, {this.dateTime, this.eventId, this.PaymentType, });
  Future postData(
      {String dateTime,
      String eventId,
      String PaymentType,
      String purchasePrice}) async {
    var urL= Uri.parse("https://api.sheety.co/bdcbafbc1f4197dda178b9e69f6ccee9/techAlchemyDeveloperTest1/purchase");
    http.Response r = await http.post(urL,headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 786785e9-1b74-430a-80d9-aae49678954f',
    },
      body: jsonEncode({
        "purchase":{
          "dateTime": dateTime,
          "purchaseAmount": purchasePrice,
          "paymentMethodType": PaymentType,
          "eventId": eventId,
        },
      }),
    );
    String data='';
    var decode;
    if(r.statusCode==200){
      data=r.body;
      print("Post Sucessfull");
    }
    else{
      throw Exception('getting Error ${r.statusCode} \n ${r.body}');
    }
  }
}
