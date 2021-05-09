import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:tech_alchemy/Models/allEvents.dart';
import 'package:tech_alchemy/Models/checkout.dart';
import 'package:tech_alchemy/Models/eventDetail.dart';
import 'package:tech_alchemy/Screens/list.dart';
import 'package:tech_alchemy/Screens/purchase.dart';
import 'package:tech_alchemy/Widgets/allEventItem.dart';
import 'package:tech_alchemy/utilities/constants.dart';
import 'package:tech_alchemy/utilities/events.dart';
import 'home.dart';

class EventDetail extends StatefulWidget {
  final bool isPartnered;
  final String sport;
  final String name;
  final String dateTime;
  final double price;
  final int totalPrize;
  final String bookBy;
  final int ticketsSold;
  final int maxTickets;
  final String location;
  final String imageURL;
  final bool isLiked;
  final int id;

  EventDetail({Key key, this.isPartnered, this.sport, this.name, this.dateTime, this.price, this.totalPrize, this.bookBy, this.ticketsSold, this.maxTickets, this.location, this.imageURL, this.isLiked, this.id,});
  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> with SingleTickerProviderStateMixin  {
  AnimationController _animationController;
  Animation _animation;
  Animation _curve;

  bool is_Liked;
  bool detailsLoaded=false;
  EventDetailElement details;
  List<Widget> tags=[];
  list carouselSlider;
  bool carouselLoaded=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    is_Liked=widget.isLiked;
    setDetails();
    buildSimilarEventCarousel();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 3));
    _curve = CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCubic);
    _animation = Tween<double>(begin: 0.0,end: 250).animate(_curve)..addListener(() {
      setState(() {
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right:20),
      //       child: Icon(Icons.share),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(

        child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 386,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        image: DecorationImage(image: CachedNetworkImageProvider(widget.imageURL),fit: BoxFit.cover),
                      ),
                      child: Column(
                        children: [
                          Container(
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
                          Padding(
                            padding: const EdgeInsets.only(left: 21,top: 150),
                            child: Row(
                              children: [
                                widget.isPartnered?Container(
                                  height: 20,
                                  width: 79,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF02D9E7),
                                      borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Center(child: Text("Partnered",style: kpriceStyle,)),
                                ):Container(child: Text(""),),
                                SizedBox(width: 10,),
                                Container(
                                  height: 20,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Center(child: Text("${widget.sport}",style: TextStyle(fontSize:12,fontWeight: FontWeight.w600 ),)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:0,top: 14,right: 30),
                            child: Text(
                              widget.name,
                              style: knameStyle1,
                            ),
                          ),
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:20),
                                child: Row(
                                  children: [
                                    SizedBox(height: 15,width: 15, child: Icon(Icons.access_time,color: Colors.white,)),
                                    SizedBox(width: 10.5 ),
                                    Padding(
                                        padding: const EdgeInsets.only(top:8.0,left: 5),
                                        child: Text(widget.dateTime,style: kdateStyle,)
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Color(0xFF02D9E7),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                                ),
                                child: Center(child: Text("£${widget.price}",style: kpriceStyleAll,)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   height: 350,
                    //   decoration: BoxDecoration(
                    //     // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    //     image: DecorationImage(image: CachedNetworkImageProvider(widget.imageURL),fit: BoxFit.cover),
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(left: 21,top: 200),
                    //         child: Row(
                    //           children: [
                    //             widget.isPartnered?Container(
                    //               height: 20,
                    //               width: 79,
                    //               decoration: BoxDecoration(
                    //                   color: Color(0xFF02D9E7),
                    //                   borderRadius: BorderRadius.all(Radius.circular(20))),
                    //               child: Center(child: Text("Partnered",style: kpriceStyle,)),
                    //             ):Container(child: Text(""),),
                    //             SizedBox(width: 10,),
                    //             Container(
                    //               height: 20,
                    //               width: 70,
                    //               decoration: BoxDecoration(
                    //                   color: Colors.white,
                    //                   borderRadius: BorderRadius.all(Radius.circular(20))),
                    //               child: Center(child: Text("${widget.sport}",style: TextStyle(fontSize:12,fontWeight: FontWeight.w600 ),)),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(left:0,top: 14,right: 30),
                    //         child: Text(
                    //           widget.name,
                    //           style: knameStyle1,
                    //         ),
                    //       ),
                    //       SizedBox(height: 50,),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.only(left:20),
                    //             child: Row(
                    //               children: [
                    //                 SizedBox(height: 15,width: 15, child: Icon(Icons.access_time,color: Colors.white,)),
                    //                 SizedBox(width: 10.5 ),
                    //                 Padding(
                    //                     padding: const EdgeInsets.only(top:8.0,left: 5),
                    //                     child: Text(widget.dateTime,style: kdateStyle,)
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Container(
                    //             width: 60,
                    //             decoration: BoxDecoration(
                    //                 color: Color(0xFF02D9E7),
                    //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                    //             ),
                    //             child: Center(child: Text("£${widget.price}",style: kpriceStyleAll,)),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:20,top: 15),
                          child: Row(
                            children: [
                              Container(child: Text("Total prize: ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),),
                              Container(child: Text("£${widget.totalPrize}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),),
                              SizedBox(width: MediaQuery.of(context).size.width*.2,),
                              Container(
                                height: 27,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Color(0xFF9DA6B1),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:10,right: 10),
                                      child: Icon(Icons.person_add_alt,color: Colors.white,size: 16,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right:11.0),
                                      child: Text("Share Event",style: TextStyle(color: Colors.white,fontSize: 12),),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(icon: is_Liked?Icon(Icons.favorite,color: Colors.red,size: 27):Icon(Icons.favorite_border,color: Color(0xFF475464),size: 27,), onPressed: (){
                                setState(() {
                                  is_Liked=!is_Liked;
                                });
                              }),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15,left: 20),child:
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4 ),
                              child: Icon(Icons.local_activity,size: 20,),
                            ),
                            Text("${widget.ticketsSold}/${widget.maxTickets} attending total",style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xFF7555CF),
                            ),),
                          ],
                        ),
                        ),
                        SizedBox(height: 15,),
                        detailsLoaded?Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: tags,
                            ),
                            SizedBox(height: 20,),
                            Container(padding:EdgeInsets.only(left: 20),alignment:Alignment.bottomLeft,child: Text("ABOUT:",style: TextStyle(color: Color(0xFF475464),fontSize: 13),)),
                            SizedBox(height: 15,),
                            Container(padding:EdgeInsets.only(left: 20),alignment:Alignment.bottomLeft,child: Text("${details.description}",style: TextStyle(color: Color(0xFF475464),fontSize: 15),)),

                            //Animation_button

                            // Stack(
                            //   children: [
                            //     Container(
                            //       width: _animationController.value,
                            //       height: 60,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.all(Radius.circular(20)),
                            //         color: Colors.blue,
                            //       ),
                            //     ),
                            //     GestureDetector(
                            //       onTap: () {
                            //         print("gestor");
                            //           if(_animationController.isCompleted){
                            //             _animationController.reverse();
                            //
                            //           }
                            //           else{
                            //             _animationController.forward();
                            //           }
                            //
                            //           },
                            //       child: Container(
                            //         // width: _animationController.value,
                            //         height: 50,
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.all(Radius.circular(20)),
                            //           // boxShadow: [BoxShadow(
                            //           //   blurRadius: 10,
                            //           //   spreadRadius: 2,
                            //           // ),
                            //           // ],
                            //           color: Color(0xFF11D0A2),
                            //           // color: Colors.black12.withOpacity(0),
                            //         ),
                            //         child: Center(child: Text("${details.price} - I’M IN!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),)),
                            //       ),
                            //     ),
                            //   ],
                            // ),

                            GestureDetector(
                              onTap: () async{

                                setState(() {
                                  detailsLoaded=false;
                                });
                                CheckoutElement c=await getEvents().getCheckoutDataById(details.id);
                                setState(() {
                                  detailsLoaded=true;
                                });
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Purchase(checkout:c,     dateTime: details.dateTime,eventId:details.id.toString(),purchasePrice: details.price.toString(),)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top:18.0,left: 25,right: 25,),
                                child: Container(
                                  // width: _animationController.value,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    // boxShadow: [BoxShadow(
                                    //   blurRadius: 10,
                                    //   spreadRadius: 2,
                                    // ),
                                    // ],
                                    color: Color(0xFF11D0A2),
                                    // color: Colors.black12.withOpacity(0),
                                  ),
                                  child: Center(child: Text("${details.price} - I’M IN!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),)),
                                ),
                              ),
                            ),



                            SizedBox(height: 10,),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(top:20,left: 20,right: 20),
                              child: Column(
                                children: [
                                  Container(alignment: Alignment.bottomLeft, child: Text("VENUE INFORMATION:",style: TextStyle(color: Color(0xFF475464),fontSize: 13),),),
                                  SizedBox(height: 10,),
                                  Container(child: Text("${details.venueInformation}",style: TextStyle(color: Color(0xFF475464),fontWeight: FontWeight.w500,fontSize: 15),),),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(top:20,left: 20,right: 20),
                              child: Column(
                                children: [
                                  Container(alignment: Alignment.bottomLeft, child: Text("EVENT CREATED BY :",style: TextStyle(color: Color(0xFF475464),fontSize: 13),),),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.person_pin,size: 20,color: Color(0xFFDADADA),),
                                      Padding(
                                        padding: const EdgeInsets.only(left :8),
                                        child: Text("${details.eventCreator}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(top:20,left: 20,right: 20),
                              child: Column(
                                children: [
                                  Container(alignment: Alignment.bottomLeft, child: Text("LOCATION :",style: TextStyle(color: Color(0xFF475464),fontSize: 13),),),
                                  SizedBox(height: 10,),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on_rounded,size: 20,color: Color(0xFFDADADA),),
                                      Container(
                                        height: 60,
                                        width: 150,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left :8),
                                          child: Text("${details.location}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 44),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Color(0xFF7555CF)),
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                          ),
                                          child: Center(child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Text("Take Me There "),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(top:20,left: 20,right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(alignment: Alignment.bottomLeft, child: Text("CONTACT :",style: TextStyle(color: Color(0xFF475464),fontSize: 13),),),
                                  SizedBox(height: 10,),
                                  //contact@techalchemy.co or call us at +1 991-681-0200

                                  Text("Send us an email at\ncontact@techalchemy.co or call us at +1 991-681-0200",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(top:20,left: 20,right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(alignment: Alignment.bottomLeft, child: Text("TEAM INFORMATION:",style: TextStyle(color: Color(0xFF475464),fontSize: 13),),),
                                  SizedBox(height: 10,),
                                  Text("${details.teamInformation}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: Container(alignment: Alignment.bottomLeft, child: Text("SIMILAR EVENTS :",style: TextStyle(color: Color(0xFF475464),fontSize: 13),),),
                            ),
                            SizedBox(height: 40,),
                            carouselLoaded?carouselSlider:CircularProgressIndicator(backgroundColor:Colors.grey,valueColor: AlwaysStoppedAnimation(Colors.purple)),
                            SizedBox(height: 40,),

                          ],
                        ):LinearProgressIndicator(backgroundColor:Colors.grey,valueColor: AlwaysStoppedAnimation(Colors.purple)),

                      ],
                    )
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }

  setTag(){
    String s =details.tags;
    s=s.substring(1,s.length-1);
    s.split(",").forEach((element) {
      tags.add(Container(padding:EdgeInsets.all(8),decoration: khashtagDecoration,child: Center(child: Text("#${element.substring(1,element.length-1)}",style: khashTagStyle,),),));
    });
  }
  setDetails() async{
    EventDetailElement result = await getEvents().getDatById(widget.id);
    setState(() {
      details=result;
      detailsLoaded=true;
    });
    setTag();
  }


  buildSimilarEventCarousel() async{
    List<Widget> ri=[];
    List<AllEvent> al= await getEvents().getData();
    al.forEach((element) {
      if(element.sport==widget.sport){
        ri.add(AllEventItem(
          // dateTime: "",
          dateTime :  dateConvert(element.dateTime),
          name:element.name,
          ticketsSold:element.ticketsSold,
          maxTickets:element.maxTickets,
          price:element.price,
          imageURL:element.mainImage,
          totalPrize:element.totalPrize,
          bookBy:element.bookBy,
          location: element.location,
          isPartnered:element.isPartnered,
          sport: element.sport,
          id:element.id,
        ));
        print(ri.length);
      }
    });
     // ri.sort();
    setState(() {
      carouselSlider=  list(items:ri,height:400);
      carouselLoaded= true;
    });
// Navigator.push(context, MaterialPageRoute(builder: (context)=>list(items:ri)));
  }

  dateConvert(String dateTime) {
    // String s=dateTime.replaceAll('/', '-');
    var months=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var  dt =DateFormat('d/m/yyyy h:m').parse(dateTime);
    var c = DateFormat.yMEd().add_jms().format(dt);
    String hours=dateTime.split(" ")[1].substring(0,5);
    List l=c.split(" ");
    String hr=" - "+l[2].toString().substring(0,l[2].toString().length-3)+" " +l[3];
    String day =DateFormat('EEEE').format(dt).toString().substring(0,3)+', '+dt.day.toString()+' '+months[dt.month.toInt()-1]+' '+hours;
    return day;
  }
  dateConvertAMPM(String dateTime) {
    print(dateTime);
    var months=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var  dt =DateFormat('d/m/yyyy h:m').parse(dateTime);
    var c = DateFormat.yMEd().add_jms().format(dt);
    String hours=dateTime.split(" ")[1].substring(0,5);
    List l=c.split(" ");
    String hr=" - "+l[2].toString().substring(0,l[2].toString().length-3)+" " +l[3];
    String day =DateFormat('EEEE').format(dt).toString().substring(0,3)+', '+dt.day.toString()+' '+months[dt.month.toInt()-1]+' '+hr;
    return day;
  }
}
