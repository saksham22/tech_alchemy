import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
class Splach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF7555CF),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 123,
              width: 123,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white
              ),
              child: Container(
                width: 87.81,
                height: 79.02,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                    )
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom:99),
              child: Icon(
                Icons.refresh,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                "© 2020 Are you in App. All rights reserved.",
                style: TextStyle(
                    fontFamily: "Montserrat" ,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
