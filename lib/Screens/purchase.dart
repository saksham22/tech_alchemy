import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_alchemy/Models/checkout.dart';
import 'package:tech_alchemy/Screens/purchased.dart';
import 'package:tech_alchemy/utilities/constants.dart';
import 'package:tech_alchemy/utilities/postRequest.dart';
class Purchase extends StatefulWidget {
  final String dateTime;
  final String eventId;
  final String purchasePrice;
  final CheckoutElement checkout;
  Purchase({this.dateTime, this.eventId, this.purchasePrice, this.checkout});

  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  bool visa=true;
  bool mastercard=true;
  bool paypal=true;
  double visaOntap=0;
  double mcOntap=0;
  double paypalOntap=0;
  String selected="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSupportedPayment(widget.checkout.paymentMethodUnsupported);
  }
  @override
  Widget build(BuildContext context) {
    String PaymentType;
    return Scaffold(
      // appBar: AppBar(
      //
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right:20),
      //       child: Icon(Icons.share),
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top:20),
            //     child: Container(
            //       height: 20,
            //       width: MediaQuery.of(context).size.width*1,
            //       decoration: BoxDecoration(
            //           color: Colors.white
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Icon(Icons.arrow_back,color: Colors.white,),
            //           Icon(Icons.share,color: Colors.white,size: 40,),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: MediaQuery.of(context).size.height*.4,
                decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/image.png'),fit: BoxFit.fill),

            ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(.1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top:20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){Navigator.pop(context);}),

                          Icon(Icons.share,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height*.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 5,
                        width: 37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: ,
                      children: [

                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Icon(Icons.arrow_back),
                              SizedBox(width: 20),
                              Text("Purchase",style: TextStyle(fontWeight:FontWeight.w500,fontSize: 18),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(Icons.adjust_rounded),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 278,
                      width: 327,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            // rgba(117, 85, 207, 0)
                            Color(0xFF7555CF),
                            Color(0xFF7655cf),
                          ],
                        ),
                        // color:Color(background: linear-gradient(136.85deg, #7555CF 38.31%,  198.35%);),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Row(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(right:10),
                               child: Container(width:177,child: Text(widget.checkout.name,style: knameStyle,)),
                             ),
                             widget.checkout.isPrivate?Container(padding: EdgeInsets.only(top: 5,bottom: 5,left: 7,right: 7),decoration:ShapeDecoration(color: Color(0xFFFF3FD5),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))) ,child: Text("PRIVATE",style: knameStyle),):Container(),
                           ],
                         ),
                       ),
                       Row(
                         children: [

                           SizedBox(width: 21.5 ),
                           SizedBox(height: 15,width: 15, child: Icon(Icons.access_time,color: Colors.white,)),
                           SizedBox(width: 10.5 ),
                           Padding(
                             padding: const EdgeInsets.only(top:8.0),
                             child: Text(dateConvert(widget.dateTime,widget.checkout.gameLength),style: kdateStyle1,),
                           ),
                         ],
                       ),
                       SizedBox(height: 15 ),
                       Row(
                         children: [
                           SizedBox(width: 21.5 ),
                           Icon(Icons.location_on_outlined,color: Colors.white,),
                           Padding(
                             padding: const EdgeInsets.only(left :8),
                             child: Text("${widget.checkout.location.split(',')[0].toString()+','+widget.checkout.location.split(',')[1]}",style: kdateStyle1,),
                           ),

                         ],
                       ),
                      SizedBox(height: 10,),
                       Stack(
                         alignment: Alignment.center,

                         children:[

                           Align(
                             alignment: Alignment.centerLeft,
                             child: Container(
                               width: 8,
                               height: 15,
                               decoration: BoxDecoration(
                                 borderRadius:BorderRadius.only(topRight: Radius.circular(100),bottomRight: Radius.circular(100)),
                                 color: Colors.white,
                               ),),
                           ),
                           DottedLine(
                             dashColor: Colors.white,
                             dashLength: 8,
                           ),
                           Align(
                             alignment: Alignment.centerRight,
                             child: Container(
                               width: 8,
                               height: 15,
                               decoration: BoxDecoration(
                                 borderRadius:BorderRadius.only(topLeft: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                 color: Colors.white,
                               ),),
                           ),

                         ]
                       ),
                       SizedBox(height:25,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Text("Total Price",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),),
                           Text("£${widget.checkout.price}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25),),
                         ],
                       ),
                       SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.only(right: 20),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text("(including 10% booking fee)",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.white),)
                           ],
                         ),
                       ),


                     ],
                   ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:25,top: 15,bottom: 15),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Choose your payment method",
                          style: TextStyle(
                            color: Color(0xFF353B48),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20,top: 5,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          visa?GestureDetector(
                            onTap:(){
                              setState(() {
                                if(selected=='mc'||selected=='paypal'||selected==""){
                                  selected='visa';
                                }
                              });
                            },
                            child: ImageFiltered(
                              imageFilter: selected=='visa'?ImageFilter.blur(sigmaY: 0,sigmaX: 0):ImageFilter.blur(sigmaY: 3,sigmaX: 3),
                              child: Container(
                                height: 80,
                                width: 102,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height:15,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("assets/img_visa.png")),
                                        ),
                                      ),
                                    ),
                                    Icon(selected=='visa'?Icons.check_circle_rounded:Icons.check_circle_outline,color: selected=='visa'?Color(0xFF02D9E7):Color(0xFFB6B4B4),),
                                  ],
                                ),

                              ),
                            ),
                          ):Container(),
                          mastercard?GestureDetector(
                            onTap:(){
                                setState(() {
                                  // if(selected=='mc'){
                                  //   // selected="";
                                  // }
                                   if(selected=='visa'||selected=='paypal'||selected==""){
                                    selected='mc';
                                  }
                                  // else selected='mc';
                                });
                            },
                            child: ImageFiltered(
                              imageFilter: selected=='mc'?ImageFilter.blur():ImageFilter.blur(sigmaX: 3,sigmaY: 3),
                              child: Container(
                                height: 80,
                                width: 102,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height:15,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("assets/img_master.png")),
                                        ),
                                      ),
                                    ),
                                    Icon(selected=='mc'?Icons.check_circle_rounded:Icons.check_circle_outline,color: selected=='mc'?Color(0xFF02D9E7):Color(0xFFB6B4B4),),
                                  ],
                                ),

                              ),
                            ),
                          ):Container(),
                          paypal?GestureDetector(
                            onTap: (){
                              setState(() {
                                if(selected=='mc'||selected=='visa'||selected==""){
                                  selected='paypal';
                                }
                              });
                            },
                            child: ImageFiltered(
                              imageFilter: selected=='paypal'?ImageFilter.blur():ImageFilter.blur(sigmaX: 3,sigmaY: 3),
                              child: Container(
                                height: 80,
                                width: 102,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height:15,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("assets/image 20.png")),
                                        ),
                                      ),
                                    ),
                                    Icon(selected=='paypal'?Icons.check_circle_rounded:Icons.check_circle_outline,color: selected=='paypal'?Color(0xFF02D9E7):Color(0xFFB6B4B4),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ):Container(),
                        ],
                      ),
                    ),

                  ],
                ),

              ),
            ),
            Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top:18.0,left: 25,right: 25,bottom: 15),
                child: GestureDetector(
                  onTap: ()async{
                    if(selected!="") {
                      await postPurchase().postData(
                          dateTime: widget.dateTime,
                          eventId: widget.eventId,
                          PaymentType: selected,
                          purchasePrice: widget.purchasePrice);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Purchased()));
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Purchased()));
                    }
                    else{
                      return showDialog(context: context, builder: (c){
                        return SimpleDialog(title: Text("Please Select Payment"),
                          children: [
                            SimpleDialogOption(
                              child: Center(child: Text("OK")),
                              onPressed: (){Navigator.pop(c);},

                            ),
                          ],
                        );
                      }
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                      ],
                      color: Color(0xFF11D0A2),
                    ),
                    child: Center(child: Text("${widget.purchasePrice} - I’M IN!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getSupportedPayment(String payment) {
    setState(() {
      visa=!payment.contains('Visa');
      mastercard=!payment.contains('MasterCard');
      paypal=!payment.contains('PayPal');
    });
    print(payment.contains('MasterCard'));
  }
}

dateConvert(String dateTime, String gameLength) {
  // String s=dateTime.replaceAll('/', '-');
  var months=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  var  dt =DateFormat('d/m/yyyy hh:mm').parse(dateTime);
  var c = DateFormat.yMEd().add_jms().format(dt);
  List l=c.split(" ");
  String hours=dateTime.split(" ")[1].substring(0,5);
  String hr=" - "+l[2].toString().substring(0,l[2].toString().length-3)+" " +l[3];
  // hr = hr.substring(0,hr.length-2);
  Duration d = parseDuration(gameLength);
  var dt1 = dt.add(d);
  var c1 = DateFormat.yMEd().add_jms().format(dt1);
  List l1 =c1.split(" ");
  String untill = l1[2].toString().substring(0,l1[2].toString().length-3)+" " +l1[3];
  String day =DateFormat('EEEE').format(dt).toString().substring(0,3)+', '+months[dt.month.toInt()-1]+" "+dt.day.toString()+' '+hr+" until "+untill;
  // print(day);
  return day;
}

Duration parseDuration(String s) {
  int hours = 0;
  int minutes = 0;
  int micros;
  List<String> parts = s.split(':');
  if (parts.length > 2) {
    hours = int.parse(parts[parts.length - 3]);
  }
  if (parts.length > 1) {
    minutes = int.parse(parts[parts.length - 2]);
  }
  micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
  return Duration(hours: hours, minutes: minutes, microseconds: micros);
}
