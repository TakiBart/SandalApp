import 'package:flutter/material.dart';

import './mainMenuList.dart' as mainMenuItemsList;
import './TextStyles.dart';

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
        title: Text(widget.title,
                style: Style.titleTextStyle,
        ),
      ),
      body: Center(
        child: new GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
//              childAspectRatio: 0.5,
            ),
            padding: const EdgeInsets.all(20.0),
            itemCount: mainMenuItemsList.list.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                  // TODO: Change sizes not to be hardcoded #2
                  child: GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        backgroundColor: mainMenuItemsList.list[index]['color'],
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return new Icon(
                              mainMenuItemsList
                                  .list[index]['icon'],
                              // TODO: #2
                              size: 0.7 * constraints.maxHeight,

                              color: Colors.white,
                            );
                          },
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: mainMenuItemsList.list[index]['builder'],

                          )
                      );
                    },
                  ),
              );
            }
        ),
      ),
    );
  }
}
