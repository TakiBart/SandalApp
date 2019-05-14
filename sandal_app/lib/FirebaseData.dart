
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//Date will be send in ISO 8601 format
class Post{
  final int postID;
  final String author;
  final String body;
  final DateTime creationDate;

  Post({this.postID, this.author, this.body, this.creationDate});
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      postID: json['postID'],
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

class Image {
  final int imageID;
  final String url;
  final String author;
  final String description; //description
  final DateTime creationDate;

  Image({this.imageID, this.url, this.author, this.description, this.creationDate});

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
        imageID: json['imageID'],
        url: json['url'],
        author: json['author'],
        description: json['description'],
        creationDate: json['creationDate']
    );
  }

  Future<Image> fetchImage() async {
    final response = await http.get(""); //TODO: Fill the address
    if (response.statusCode == 200) {
      return Image.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load image');
    }
  }
}

class CalendarEvent {
  final int eventID;
  final String author;
  final String body;
  final String creationDate;
  final DateTime eventDate;

  CalendarEvent({this.eventID, this.author, this.body, this.creationDate, this.eventDate});
  factory CalendarEvent.fromJson(Map<String, dynamic> json){
      return CalendarEvent(
          eventID: json['eventID'],
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
