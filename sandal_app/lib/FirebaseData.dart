
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//Date will be send in ISO 8601 format
class Post{

  final String author;
  final String title;
  final String body;
  final DateTime creationDate;

  Post({ this.author, this.title, this.body, this.creationDate});
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      title: json['title'],
      author: json['author'],
      body: json['body'],
      creationDate: json['creationDate']
    );
  }
  Future<Post> fetchPost() async{
    final response = await http.get(""); //TODO: Fill the address
    if(response.statusCode == 200){
      return Post.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load post');
    }
  }
}

class CustomImage {
  final String url;
  final String author;
  final DateTime creationDate;

  CustomImage({ this.url, this.author, this.creationDate});

  factory CustomImage.fromJson(Map<String, dynamic> json){
    return CustomImage(
        url: json['url'],
        author: json['author'],
        creationDate: json['creationDate']
    );
  }

  Future<CustomImage> fetchImage() async {
    final response = await http.get(""); //TODO: Fill the address
    if (response.statusCode == 200) {
      return CustomImage.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load image');
    }
  }
}

class CalendarEvent {
  final String author;
  final String body;
  final String creationDate;
  final DateTime eventDate;

  CalendarEvent({this.author, this.body, this.creationDate, this.eventDate});
  factory CalendarEvent.fromJson(Map<String, dynamic> json){
      return CalendarEvent(
          author: json['author'],
          body: json['body'],
          creationDate: json['creationDate'],
          eventDate: json['eventDate']
     );
  }
  Future<CalendarEvent> fetchCalendarEvent() async{
    final response = await http.get(""); //TODO: Fill the address
    if(response.statusCode == 200){
        return CalendarEvent.fromJson(json.decode(response.body));
      }
    else{
      throw Exception('Failed to load event');
    }

  }
}
