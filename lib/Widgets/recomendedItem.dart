import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tech_alchemy/utilities/constants.dart';
import 'package:tech_alchemy/Screens/Events_Details.dart';

class RecomendedItem extends StatelessWidget {

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


  // final String dateTime;
  // final String name;
  // final int ticketsSold;
  // final int maxTickets;
  // final double price;
  // final String imageURL;
  final int friendsAttending;
  RecomendedItem({this.dateTime, this.name, this.ticketsSold, this.maxTickets, this.price, this.imageURL, this.friendsAttending, this.isPartnered, this.sport, this.totalPrize, this.bookBy, this.location, this.id});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetail(
            isPartnered:isPartnered,
            sport:sport,
            name:name,
            dateTime:dateTime,
            price:price,
            totalPrize:totalPrize,
            bookBy:bookBy,
            ticketsSold:ticketsSold,
            maxTickets:maxTickets,
            location:location,
            imageURL:imageURL,
            isLiked:false,
            id:id,
          )));
      },
      child: Container(
        height: 160,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          image: DecorationImage(image: CachedNetworkImageProvider(imageURL),fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(height: 21,),
            Row(
              children: [
                SizedBox(width: 21.5 ),
                SizedBox(height: 15,width: 15, child: Icon(Icons.access_time,color: Colors.white,)),
                SizedBox(width: 10.5 ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text(dateTime,style: kdateStyle,),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:20,top: 14,right: 30),
              child: Text(
                  name,
                style: knameStyle,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:21,top: 45,right: 18,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   height: 26,
                   width: 65,
                   decoration:kticketFriendsBox,
                   child:Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(2.0),
                         child: Icon(Icons.local_activity,color: Colors.white,size: 12,),
                       ),
                       Text("$ticketsSold/$maxTickets",style: kticketStyle,)
                     ],
                   )
                 ),
                 Container(
                   height: 26,
                   width: 117,
                   decoration: kticketFriendsBox,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                         width: 25,
                         child: Stack(
                           children: [
                             Positioned(
                               left:8 ,
                               child: Container(

                                 height: 14.15,
                                 width: 14.15,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(image: AssetImage('assets/f1.png'),fit: BoxFit.cover),
                                   color: Colors.black,
                                 border: Border.all(color: Colors.white),
                                 shape: BoxShape.circle,

                               ),
                               ),
                             ),
                             Positioned(

                               child: Container(
                                 height: 14.15,
                                 width: 14.15,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(image: AssetImage('assets/img.png'),fit: BoxFit.cover),

                                   color: Colors.black,
                                   border: Border.all(color: Colors.white),
                                   shape: BoxShape.circle,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),

                       Padding(
                         padding: const EdgeInsets.only(left:4.0),
                         child: Text("+$friendsAttending friends",style: kfriendsStyle,),
                       )
                     ],
                   ),
                 ),
                 Container(
                   height: 26,
                   width: 60,
                   decoration: BoxDecoration(
                     color: Color(0xFF02D9E7),
                     borderRadius: BorderRadius.all(Radius.circular(20)),

                   ),
                   child: Center(
                     child: Text(
                       "£$price",
                        style: kpriceStyle,
                     ),
                   ),
                 ),
               ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}
