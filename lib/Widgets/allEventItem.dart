import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_alchemy/Screens/Events_Details.dart';
import 'package:tech_alchemy/utilities/constants.dart';
import 'package:tech_alchemy/utilities/events.dart';


class AllEventItem extends StatefulWidget {
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
  final int id;
  AllEventItem({this.isPartnered, this.sport, this.name, this.dateTime, this.price, this.totalPrize, this.bookBy, this.ticketsSold, this.maxTickets, this.location,this.imageURL, this.id});

  @override
  _AllEventItemState createState() => _AllEventItemState();
}

class _AllEventItemState extends State<AllEventItem> {
  bool isLiked=false;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onDoubleTap: (){setState(() {
        isLiked=!isLiked;
      });},
      onTap: ()async {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetail(
       isPartnered:widget.isPartnered,
       sport:widget.sport,
       name:widget.name,
       dateTime:widget.dateTime,
       price:widget.price,
       totalPrize:widget.totalPrize,
       bookBy:widget.bookBy,
       ticketsSold:widget.ticketsSold,
       maxTickets:widget.maxTickets,
      location:widget.location,
      imageURL:widget.imageURL,
      isLiked:isLiked,
      id:widget.id,
      )
        )
        );
        },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 6)],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  image: DecorationImage(image: CachedNetworkImageProvider(widget.imageURL),fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 21,top: 35),
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
                      padding: const EdgeInsets.only(left:20,top: 14,right: 30),
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20,top: 15),
                    child: Row(
                      children: [
                       Container(child: Text("Total prize: ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),),
                       Container(child: Text("£${widget.totalPrize}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),),
                        SizedBox(width: 60),
                        Icon(Icons.share,size: 18,),
                        IconButton(icon: isLiked?Icon(Icons.favorite,color: Colors.red,size: 20):Icon(Icons.favorite_border,color: Color(0xFF475464),size: 20,), onPressed: (){
                          setState(() {
                            isLiked=!isLiked;
                          });
                        }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(Icons.av_timer_outlined,size: 20,),
                        SizedBox(width: 5,),
                        Text("Time left to Book: ",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.w500,fontSize: 14),),
                        Text("3 hours",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),)

                        // Text("${timeLeft(widget.dateTime,widget.bookBy)} hours",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),)
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
                  Padding(padding: EdgeInsets.only(top: 15,left: 20),child:
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4 ),
                        child: Icon(Icons.location_on_rounded,size: 20,),
                      ),
                      Text("${widget.location.substring(0,20)}",style: TextStyle(
                        color: Color(0xFF475464),
                      ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:30),
                        child: Text("1km"),
                      ),
                    ],
                  ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  timeLeft(String dateTime,String bookBy ) {
    var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var  dt = DateFormat('d/m/yyyy h:m').parse(dateTime);
    var bb = DateFormat('d/m/yyyy h:m').parse(bookBy);
    var diff = bb.difference(dt);
    String result = diff.abs().inHours.toString()[0];
    // String hours = dateTime.split(" ")[1].substring(0,5);
    // String day = DateFormat('EEEE').format(dt).toString().substring(0,3)+', '+dt.day.toString()+' '+months[dt.month.toInt()-1]+' '+hours;
    return result;

  }
}
