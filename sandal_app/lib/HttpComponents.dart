import 'package:flutter/material.dart';
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

class Image{
  final int imageID;
  final String url;
  final String author;
  final String body; //description
  final DateTime creationDate;

  Image({this.imageID, this.url, this.author, this.body, this.creationDate});
  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
        imageID: json['imageID'],
        url: json['url'],
        author: json['author'],
        body: json['body'],
        creationDate: json['creationDate']
    );
  }

}

class CalendarEvent {
  final int eventID;
  final String author;
  final String body;
  final String creationDate;
  final String eventDate;

  CalendarEvent({this.eventID, this.author, this.body, this.creationDate,
    this.eventDate});
  factory CalendarEvent.fromJson(Map<String, dynamic> json){
    return CalendarEvent(
      eventID: json['eventID'],
      author: json['author'],
      body: json['body'],
      creationDate: json['creationDate'],
      eventDate: json['eventDate']
    );
  }

}