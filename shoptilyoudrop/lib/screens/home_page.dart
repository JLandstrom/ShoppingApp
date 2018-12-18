import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shoptilyoudrop/app_state_container.dart';
import 'package:shoptilyoudrop/routes.dart';
import 'package:shoptilyoudrop/screens/shared/custom_appbar.dart';
import 'package:shoptilyoudrop/screens/shared/custom_drawer.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key:key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

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
        children : <Widget>[
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
                        Text('New shopping list', style: TextStyle(color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w500)),
                        Text('Create shopping list',  style: TextStyle(color: Colors.black45)),
                      ],
                    ),
                    Material
                      (
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Row
                          (
                            children: <Widget>[
                              Padding
                              (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.shopping_cart, color: Colors.white, size: 60.0),
                              )
                            ]
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
                          child: Icon(Icons.category, color: Colors.white, size: 50.0),
                        )
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Text('Categories', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22.0)),
                    Text('Configure store categories', style: TextStyle(color: Colors.black45)),
                  ]
              ),
            ),
            onTap: () => _navigate(Routes.categoriesOverview)
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
                        color: Colors.lightGreenAccent,
                        shape: CircleBorder(),
                        child: Padding
                          (
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.people, color: Colors.white, size: 50.0),
                        )
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Text('Contributors', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22.0)),
                    Text('Add contributor ', style: TextStyle(color: Colors.black45)),
                  ]
              ),
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
                        Text('My shopping lists', style: TextStyle(color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w500)),
                        Text('Handle saved shopping lists',  style: TextStyle(color: Colors.black45)),
                      ],
                    ),
                    Material
                      (
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(24.0),
                        child: Row
                          (
                            children: <Widget>[
                              Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.list, color: Colors.white, size: 60.0),
                              )
                            ]
                        )
                    )
                  ]
              ),
            ),
          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 150.0),
          StaggeredTile.extent(1, 230.0),
          StaggeredTile.extent(1, 230.0),
          StaggeredTile.extent(2, 150.0),
        ],
      )
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }

  _navigate(String route) {
    Navigator.of(context).pushNamed(route);
  }
}