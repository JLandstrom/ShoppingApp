import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/manager/session_manager.dart';
import 'package:shoptilyoudrop/model/user.dart';
import 'package:shoptilyoudrop/screens/shared/custom_appbar.dart';
import 'package:shoptilyoudrop/screens/shared/custom_drawer.dart';

class HomePage extends StatefulWidget {
  static final String PageName = "home";
  HomePage({Key key}) : super(key:key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  final User user =  SessionManager().getUserDetails();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new CustomAppBar("My Groceries"),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        _buildTile(
          Padding
            (
            padding: const EdgeInsets.all(24.0),
            child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                    (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Total Views', style: TextStyle(color: Colors.blueAccent)),
                      Text('265K', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
                    ],
                  ),
                  Material
                    (
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center
                        (
                          child: Padding
                            (
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                          )
                      )
                  )
                ]
            ),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column
              (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  Material
                    (
                      color: Colors.teal,
                      shape: CircleBorder(),
                      child: Padding
                        (
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(Icons.settings_applications, color: Colors.white, size: 30.0),
                      )
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text('General', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                  Text('Images, Videos', style: TextStyle(color: Colors.black45)),
                ]
            ),
          ),
        ),
        _buildTile(
          Padding
            (
            padding: const EdgeInsets.all(24.0),
            child: Column
              (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  Material
                    (
                      color: Colors.amber,
                      shape: CircleBorder(),
                      child: Padding
                        (
                        padding: EdgeInsets.all(16.0),
                        child: Icon(Icons.notifications, color: Colors.white, size: 30.0),
                      )
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text('Alerts', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                  Text('All ', style: TextStyle(color: Colors.black45)),
                ]
            ),
          ),
        ),
        _buildTile(
          Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Column
                (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  Row
                    (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Revenue', style: TextStyle(color: Colors.green)),
                          Text('\$16K', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0)),
                        ],
                      ),
                      DropdownButton
                        (
                          isDense: true,
                          value: actualDropdown,
                          onChanged: (String value) => setState(()
                          {
                            actualDropdown = value;
                            actualChart = chartDropdownItems.indexOf(value); // Refresh the chart
                          }),
                          items: chartDropdownItems.map((String title)
                          {
                            return DropdownMenuItem
                              (
                              value: title,
                              child: Text(title, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 14.0)),
                            );
                          }).toList()
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4.0)),
                  Sparkline
                    (
                    data: charts[actualChart],
                    lineWidth: 5.0,
                    lineColor: Colors.greenAccent,
                  )
                ],
              )
          ),
        ),
        _buildTile(
          Padding
            (
            padding: const EdgeInsets.all(24.0),
            child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                    (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Shop Items', style: TextStyle(color: Colors.redAccent)),
                      Text('173', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
                    ],
                  ),
                  Material
                    (
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center
                        (
                          child: Padding
                            (
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.store, color: Colors.white, size: 30.0),
                          )
                      )
                  )
                ]
            ),
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
        )
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 110.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(2, 220.0),
        StaggeredTile.extent(2, 110.0),
      ],
    )
    );
  }
}