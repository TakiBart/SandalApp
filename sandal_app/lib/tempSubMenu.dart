import 'package:flutter/material.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/services.dart';

import './Styles.dart';
import './colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CommentsSectionPage extends StatefulWidget{
  @override
  _CommentsListedPageState createState() => _CommentsListedPageState();
}
class _CommentsListedPageState extends State<CommentsSectionPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sekcja komentarzy"),
      ),

      body: StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData)
            return Text("Proszę czekać");
          return ListView.builder(
            itemExtent: 100,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>_buildListSingleItem(context, snapshot.data.documents[index]),
          );
        }
      )
    );
  }
  Widget _buildListSingleItem(BuildContext context, DocumentSnapshot document){
    return ListTile(
        title: Column(
            children: <Widget>[
              Expanded(
                  child: Text(
                      document.data['author'] + ": "+ document.data['title'],
                      style:Theme.of(context).textTheme.headline
                  )
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      document.data['body'])
              ),
            ]),
    onTap: () =>{
      Navigator.push((context), MaterialPageRoute(builder: (context) => _CommentDetailsPage(document['title'],document['author'],document['body'])))
    },);
  }
}
class _CommentDetailsPage extends StatelessWidget{
  String title;
  String author;
  String body;

  _CommentDetailsPage(String title, String author, String body){
    this.title=title;
    this.author=author;
    this.body=body;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body:
        Container(
          child: Column(
            children: <Widget>[
              Text(author),
              Text(body),
            ],
          ),
      )

    );
    // TODO: implement build
    // arrow to get back to listed state
//    return null;
  }

}

class CalendarSectionPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CalendarGeneralPageState();

}
class _CalendarGeneralPageState extends State<CommentsSectionPage> {
  DeviceCalendarPlugin _deviceCalendarPlugin;

  List<Calendar> _calendars;
  Calendar _selectedCalendar;
  List<Event> _calendarEvents;

  _CalendarGeneralPageState() {
    _deviceCalendarPlugin = new DeviceCalendarPlugin();
  }

  @override
  initState() {
    super.initState();
    _retrieveCalendars();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome to Device Calendar Example'),
      ),
      body: new Column(
        children: <Widget>[
          new ConstrainedBox(
            constraints: new BoxConstraints(maxHeight: 150.0),
            child: new ListView.builder(
              itemCount: _calendars?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return new GestureDetector(
                  onTap: () async {
                    await _retrieveCalendarEvents(_calendars[index].id);
                    setState(() {
                      _selectedCalendar = _calendars[index];
                    });
                  },
                  child: new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          flex: 1,
                          child: new Text(
                            _calendars[index].name,
                            style: new TextStyle(fontSize: 25.0),
                          ),
                        ),
                        new Icon(_calendars[index].isReadOnly
                            ? Icons.lock
                            : Icons.lock_open)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Container(
              decoration: new BoxDecoration(color: Colors.white),
              child: new ListView.builder(
                itemCount: _calendarEvents?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return new EventItem(
                      _calendarEvents[index], _deviceCalendarPlugin, () async {
                    await _retrieveCalendarEvents(_selectedCalendar.id);
                  });
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: !(_selectedCalendar?.isReadOnly ?? true)
          ? new FloatingActionButton(
        onPressed: () async {
          final now = new DateTime.now();
          final eventToCreate = new Event(_selectedCalendar.id);
          eventToCreate.title =
          "Event created with Device Calendar Plugin";
          eventToCreate.start = now;
          eventToCreate.end = now.add(new Duration(hours: 1));
          final createEventResult = await _deviceCalendarPlugin
              .createOrUpdateEvent(eventToCreate);
          if (createEventResult.isSuccess &&
              (createEventResult.data?.isNotEmpty ?? false)) {
            _retrieveCalendarEvents(_selectedCalendar.id);
          }
        },
        child: new Icon(Icons.add),
      )
          : new Container(),
    );
  }

  void _retrieveCalendars() async {
    try {
      var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
      if (permissionsGranted.isSuccess && !permissionsGranted.data) {
        permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
        if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
          return;
        }
      }

      final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
      setState(() {
        _calendars = calendarsResult?.data;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future _retrieveCalendarEvents(String calendarId) async {
    try {
      final startDate = new DateTime.now().add(new Duration(days: -30));
      final endDate = new DateTime.now().add(new Duration(days: 30));
      final retrieveEventsParams =
      new RetrieveEventsParams(startDate: startDate, endDate: endDate);
      final eventsResult = await _deviceCalendarPlugin.retrieveEvents(
          calendarId, retrieveEventsParams);

      setState(() {
        _calendarEvents = eventsResult?.data;
      });
    } catch (e) {
      print(e);
    }
  }
}

class EventItem extends StatelessWidget {
  final Event _calendarEvent;
  final DeviceCalendarPlugin _deviceCalendarPlugin;

  final Function onDeleteSucceeded;

  final double _eventFieldNameWidth = 75.0;

  EventItem(this._calendarEvent, this._deviceCalendarPlugin,
      this.onDeleteSucceeded);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new ListTile(
              title: new Text(_calendarEvent.title ?? ''),
              subtitle: new Text(_calendarEvent.description ?? '')),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              children: <Widget>[
                new Align(
                  alignment: Alignment.topLeft,
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        width: _eventFieldNameWidth,
                        child: new Text('All day?'),
                      ),
                      new Text(
                          _calendarEvent.allDay != null && _calendarEvent.allDay
                              ? 'Yes'
                              : 'No'),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 10.0,
                ),
                new Align(
                  alignment: Alignment.topLeft,
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        width: _eventFieldNameWidth,
                        child: new Text('Location'),
                      ),
                      new Expanded(
                        child: new Text(
                          _calendarEvent?.location ?? '',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 10.0,
                ),
                new Align(
                  alignment: Alignment.topLeft,
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        width: _eventFieldNameWidth,
                        child: new Text('Attendees'),
                      ),
                      new Expanded(
                        child: new Text(
                          _calendarEvent?.attendees
                              ?.where((a) => a.name?.isNotEmpty ?? false)
                              ?.map((a) => a.name)
                              ?.join(', ') ??
                              '',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new ButtonTheme.bar(
            child: new ButtonBar(
              children: <Widget>[
                new IconButton(
                  onPressed: () async {
                    final deleteResult =
                    await _deviceCalendarPlugin.deleteEvent(
                        _calendarEvent.calendarId, _calendarEvent.eventId);
                    if (deleteResult.isSuccess && deleteResult.data) {
                      onDeleteSucceeded();
                    }
                  },
                  icon: new Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CalendarDayDetailsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}

class MyTempPage extends StatefulWidget {
  MyTempPage(
      {Key key,
      this.tempId = 'tempId',
      this.tempName = 'tempName',
      this.tempIcon = Icons.not_interested,
      this.tempColor = Colors.purple})
      : super(key: key);

  final tempId;
  final tempName;
  final tempIcon;
  final tempColor;

  @override
  _MyTempPageState createState() => _MyTempPageState(
        tempId: tempId,
        tempName: tempName,
        tempIcon: tempIcon,
        tempColor: tempColor,
      );
}

class _MyTempPageState extends State<MyTempPage> {
  _MyTempPageState({this.tempId, this.tempName, this.tempIcon, this.tempColor});

  int _counter = 0;
  final String tempId;
  final String tempName;
  final tempIcon;
  final tempColor;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tempName,
          style: Style.titleTextStyle,
        ),
        iconTheme: IconThemeData(
          color: MyColors.appbarIconTheme,
        ),
      ),
      body: Container(
        color: Colors.indigoAccent,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: Style.headerTextStyle,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              Text(
                'id = $tempId',
                style: Style.commonTextStyle,
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Icon(
                  tempIcon,
                  color: tempColor,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
