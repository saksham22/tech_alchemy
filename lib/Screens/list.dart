import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class list extends StatefulWidget {
  final List<Widget> items;
  final double height;
  list({this.items, this.height});

  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children:[
         CarouselSlider(
            items: widget.items, options: CarouselOptions(
            height: widget.height,
            initialPage: 0,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: widget.items.map((url) {
             int index = widget.items.indexOf(url);
             return Container(
               width: 8.0,
               height: 8.0,
               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: _current == index
                     ? Color.fromRGBO(0, 0, 0, 0.9)
                     : Color.fromRGBO(0, 0, 0, 0.4),
               ),
             );
           }).toList(),
         ),
       ]
      ),
      );
  }
}
