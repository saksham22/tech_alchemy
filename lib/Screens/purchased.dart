import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tech_alchemy/utilities/postRequest.dart';
class Purchased extends StatelessWidget {
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
      body: Stack(
        children: [
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
              child: Padding(
                padding: const EdgeInsets.only(left:25.0,right: 25),
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
                   Center(child: Icon(Icons.check_circle_rounded,size: 68,color: Color(0xFF11D0A2),),),
                    Text("Thank you !",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                    SizedBox(height: 20),

                    Text("Your your payment was made successfully!",style:
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF475464)),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    Text("Your booking ID",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF475464)),
                    ),
                    Text("#33475490",style: TextStyle(
                        color: Color(0xFF11D0A2),
                        fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    Text("You will need this booking ID to enter inside the event. You can view this code inside your profile / booked events",style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF475464)),
                    )

                  ],
                ),
              ),

            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top:18.0,left: 25,right: 25,),
                child: GestureDetector(
                  onTap: ()async{
                    Navigator.pop(context);
                    Navigator.pop(context);
                    // Navigator.pop(context);
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
                      color:  Color(0xFF7555CF),
                    ),
                    child: Center(child: Text("CLOSE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),)),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
