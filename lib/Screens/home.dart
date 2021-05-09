import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_alchemy/Models/allEvents.dart';
import 'package:tech_alchemy/Screens/Splach.dart';
import 'package:tech_alchemy/Screens/list.dart';
import 'package:tech_alchemy/Widgets/allEventItem.dart';
import 'package:tech_alchemy/Widgets/recomendedItem.dart';
import 'package:tech_alchemy/utilities/constants.dart';
import 'package:tech_alchemy/utilities/events.dart';
import 'package:intl/intl.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController;
   var ex=getEvents();
   bool isBuilt=false;
   list carouselSlider;
   List<Widget> HomeListItems=[];
  @override
  void initState() {
    // TODO: implement initState
    buildRecomendedCarosel().then((value){
      print('Async done');
      buildAllEventItems().then((value){
        print("AllEvent is done");
      });
    });

    super.initState();
    // items.add(RecomendedItem(dateTime:"Thu, 24 Sep 2020 18:30", name:"Camden Town FootBall Event", ticketsSold:9, maxTickets:22, price:11.98, imageURL:"https://i.pinimg.com/originals/a9/88/a4/a988a47e605cacc02b0bb41c85270de3.jpg", friendsAttending:5));
  }
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> ListItems=[
      BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.local_activity),label: "Ticket"),
      BottomNavigationBarItem(icon: Icon(Icons.gamepad),label: "Game"),
      BottomNavigationBarItem(icon: Icon(Icons.account_box),label: "Account"),
      BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
    ];
    return isBuilt?Scaffold(
      backgroundColor: Color(0xFFF9F6F6),
      body: Column(
        children: [
          buildHeader(),
          SizedBox(height: 5,),
          // Row(
          //   children: [
          //     SizedBox(width: MediaQuery.of(context).size.width*.1,),
          //     Text("Recommended Events",style: khomeText),
          //     SizedBox(width: MediaQuery.of(context).size.width*.35,),
          //     Text("View All",style: TextStyle(color: Color(0xFFE77460),fontWeight: FontWeight.w500,fontSize: 13,decoration: TextDecoration.underline),),
          //   ],
          // ),
          // SizedBox(height: 23,),
          Container(
            // padding: EdgeInsets.only(left: 10,right: 10),
            height: MediaQuery.of(context).size.height*.69,
            child: ListView(

              children: HomeListItems,
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            elevation: 120,
            unselectedItemColor: Color(0xFF475464),
            selectedItemColor: Color(0xFF7555CF),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: ListItems,
          ),
        ),
      ),
    ):Splach();
  }
  buildHeader(){
    return Container(
      height: 184,
      decoration: BoxDecoration(
        boxShadow:[
          BoxShadow(color: Colors.black38, spreadRadius: 10, blurRadius: 10),
        ],
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
        ),
        color: Color(0xFF7555CF),
      ),
      child: Column(
        children: [
          SizedBox(height: 50,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:18 ),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                      fontSize: 22,
                      fontFamily: "Montserrat" ,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            SizedBox(width: MediaQuery.of(context).size.width*.6,),
              Stack(
                children: [
                  Icon(Icons.notifications_none,color: Colors.white,),
                  Positioned(
                      left: 10,
                      top: 0,
                      right: 0,
                      child: Icon(Icons.brightness_1,size: 16,color: Colors.redAccent)
                  ),
                  Positioned(
                    top: 1.0,
                    right: 2.7,
                    child: Text("3",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF8063D3),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              child:  TextFormField(
                controller: searchController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.white,),
                  suffixIcon: Icon(Icons.filter_alt_rounded),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Search by Event, code, location",
                  hintStyle: TextStyle(fontSize: 14,color: Color(0xFFBFB1E9),fontWeight: FontWeight.w400
                  ),
                ),
              ),
              ),
          ),
      ],
      ),
    );
  }
  buildRecomendedCarosel() async{
    List<Widget> ri=[];
    List<AllEvent> al= await getEvents().getData();
    al.forEach((element) {
      if(element.isRecommended){
        ri.add(
            RecomendedItem(
                friendsAttending:element.friendsAttending,
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
  setState(() {
    carouselSlider=  list(items:ri,height: 160,) ;
    HomeListItems.add(Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width*.1,),
          Text("Recommended Events",style: khomeText),
          SizedBox(width: MediaQuery.of(context).size.width*.35,),
          Text("View All",style: TextStyle(color: Color(0xFFE77460),fontWeight: FontWeight.w500,fontSize: 13,decoration: TextDecoration.underline),),
        ],
      ),
    ));
    HomeListItems.add(carouselSlider);
      isBuilt=false;
  });
  }
  buildAllEventItems() async{
    List<Widget> ri=[];
    List<AllEvent> al= await getEvents().getData();
    al.forEach((element) {
        ri.add(AllEventItem(
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

    });

    setState(() {
      HomeListItems.add(Padding(
        padding: const EdgeInsets.only(left:20,top: 15),
        child: Align(alignment: Alignment.centerLeft,child: Text("All Events",style: khomeText,)),
      ));
      ri.forEach((element) {
        HomeListItems.add(element);
      });
      isBuilt=true;
    });
  }
  dateConvert(String dateTime) {
    var months=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var  dt =DateFormat('d/m/yyyy h:m').parse(dateTime);
    String hours=dateTime.split(" ")[1].substring(0,5);
    String day =DateFormat('EEEE').format(dt).toString().substring(0,3)+', '+dt.day.toString()+' '+months[dt.month.toInt()-1]+' '+hours;
    return day;
  }
}



