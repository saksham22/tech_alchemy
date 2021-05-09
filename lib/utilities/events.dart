import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:tech_alchemy/Models/allEvents.dart';
import 'package:tech_alchemy/Models/checkout.dart';
import 'package:tech_alchemy/Models/eventDetail.dart';

class getEvents {
  Future getData() async {
    // 786785e9-1b74-430a-80d9-aae49678954f
    var urL= Uri.parse("https://api.sheety.co/bdcbafbc1f4197dda178b9e69f6ccee9/techAlchemyDeveloperTest1/allEvents");
    http.Response r = await http.get(urL,headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 786785e9-1b74-430a-80d9-aae49678954f',
    });
    String data='';
    var decode;
    if(r.statusCode==200){
      data=r.body;
      // print(data);
      var decode=allEventsFromJson(data);
      print(decode.allEvents);

      return decode.allEvents;
    }
    else{
      throw Exception('getting Error ${r.body}');
      }
    }

  Future<EventDetailElement> getDatById(int id) async {
    // 786785e9-1b74-430a-80d9-aae49678954f
    var urL= Uri.parse("https://api.sheety.co/bdcbafbc1f4197dda178b9e69f6ccee9/techAlchemyDeveloperTest1/eventDetails");
    http.Response r = await http.get(urL,headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 786785e9-1b74-430a-80d9-aae49678954f',
    });
    String data='';
    var decode;
    EventDetailElement result;
    if(r.statusCode==200){
      data=r.body;
      var decode=eventDetailFromJson(data);
      decode.eventDetails.forEach((element) {
        if(element.id ==id){
          print(element.tags);
          result= element;
        }
      }
      );
      return result;
    }
    else{
      throw Exception('getting Error ${r.body}');
    }
  }

  Future<CheckoutElement > getCheckoutDataById(int id) async {
    // 786785e9-1b74-430a-80d9-aae49678954f
    var urL= Uri.parse("https://api.sheety.co/bdcbafbc1f4197dda178b9e69f6ccee9/techAlchemyDeveloperTest1/checkout");
    http.Response r = await http.get(urL,headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 786785e9-1b74-430a-80d9-aae49678954f',
    });
    String data='';
    var decode;
    CheckoutElement result;
    if(r.statusCode==200)
    {
      data=r.body;
      var decode=checkoutFromJson(data);
      decode.checkout.forEach((element) {
        if(element.id ==id){
          result= element;
        }
      }
      );
      return result;
    }
    else
    {
      throw Exception('getting Error ${r.body}');
    }
  }

}
