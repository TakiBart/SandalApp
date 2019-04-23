import 'package:flutter/material.dart';
import './tempSubMenu.dart' as tempSubMenu;
import './mainMenuList.dart' as mainMenuItemsList;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DA Sł',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'DA Sandał'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: new GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
//              childAspectRatio: 0.5,
            ),
            padding: const EdgeInsets.all(10.0),
            itemCount: mainMenuItemsList.list.length,
            itemBuilder: (BuildContext context, int index) {
              return new GridTile(
                child: new Container(
                  // TODO: Change sizes not to be hardcoded #2
                  //height: 300.0,
                  child: new GestureDetector(
                    child:// new Column(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: [
//                        new SizedBox(
//                          // TODO: #2
//                          //height: 50.0,
//                          //width: 100.0,
//                          child: new Row(
//                            children: <Widget>[
                              new Stack(
                                children: <Widget>[
                                  new SizedBox(
                                    child: new Container(
                                      child: new CircleAvatar(
                                        backgroundColor: mainMenuItemsList
                                            .list[index]['color'],
                                        // TODO: #2
                                        //radius: 30.0,
                                        child: new Icon(
                                            mainMenuItemsList
                                                .list[index]['icon'],
                                            // TODO: #2
                                            //size: 30.0,
                                            color: Colors.white,
                                        ),

                                      ),
                                      padding: const EdgeInsets.only(
                                        // TODO: #2
                                          left: 5.0, right: 5.0
                                      ),
                                    ),
                                  ),
                                ],
                              ),
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (_) =>
                              new tempSubMenu.MyTempPage(
                                tempId: mainMenuItemsList.list[index]['id'],
                                tempName: mainMenuItemsList.list[index]['name'],
                                tempIcon: mainMenuItemsList.list[index]['icon'],
                                tempColor: mainMenuItemsList.list[index]['color'],
                              )
                        )
                      );
                    },
                  ),
                ),
              );
            }
          ),
      ),
    );
  }
}
