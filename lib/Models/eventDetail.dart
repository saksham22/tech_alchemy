// To parse this JSON data, do
//
//     final eventDetail = eventDetailFromJson(jsonString);

import 'dart:convert';

EventDetail eventDetailFromJson(String str) => EventDetail.fromJson(json.decode(str));

String eventDetailToJson(EventDetail data) => json.encode(data.toJson());

class EventDetail {
  EventDetail({
    this.eventDetails,
  });

  List<EventDetailElement> eventDetails;

  factory EventDetail.fromJson(Map<String, dynamic> json) => EventDetail(
    eventDetails: List<EventDetailElement>.from(json["eventDetails"].map((x) => EventDetailElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "eventDetails": List<dynamic>.from(eventDetails.map((x) => x.toJson())),
  };
}

class EventDetailElement {
  EventDetailElement({
    this.name,
    this.dateTime,
    this.bookBy,
    this.ticketsSold,
    this.maxTickets,
    this.friendsAttending,
    this.price,
    this.isPartnered,
    this.sport,
    this.totalPrize,
    this.location,
    this.description,
    this.venueInformation,
    this.eventCreator,
    this.teamInformation,
    this.tags,
    this.mainImage,
    this.id,
  });

  String name;
  String dateTime;
  String bookBy;
  int ticketsSold;
  int maxTickets;
  int friendsAttending;
  double price;
  bool isPartnered;
  String sport;
  int totalPrize;
  String location;
  String description;
  String venueInformation;
  String eventCreator;
  String teamInformation;
  String tags;
  String mainImage;
  int id;

  factory EventDetailElement.fromJson(Map<String, dynamic> json) => EventDetailElement(
    name: json["name"],
    dateTime: json["dateTime"],
    bookBy: json["bookBy"],
    ticketsSold: json["ticketsSold"],
    maxTickets: json["maxTickets"],
    friendsAttending: json["friendsAttending"],
    price: json["price"].toDouble(),
    isPartnered: json["isPartnered"],
    sport: json["sport"],
    totalPrize: json["totalPrize"],
    location: json["location"],
    description: json["description"],
    venueInformation: json["venueInformation"],
    eventCreator: json["eventCreator"],
    teamInformation: json["teamInformation"],
    tags: json["tags"],
    mainImage: json["mainImage"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "dateTime": dateTime,
    "bookBy": bookBy,
    "ticketsSold": ticketsSold,
    "maxTickets": maxTickets,
    "friendsAttending": friendsAttending,
    "price": price,
    "isPartnered": isPartnered,
    "sport": sport,
    "totalPrize": totalPrize,
    "location": location,
    "description": description,
    "venueInformation": venueInformation,
    "eventCreator": eventCreator,
    "teamInformation": teamInformation,
    "tags": tags,
    "mainImage": mainImage,
    "id": id,
  };
}

// enum Sport { FOOTBALL, RUGBY_UNION }
//
// final sportValues = EnumValues({
//   "Football": Sport.FOOTBALL,
//   "Rugby Union": Sport.RUGBY_UNION
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
