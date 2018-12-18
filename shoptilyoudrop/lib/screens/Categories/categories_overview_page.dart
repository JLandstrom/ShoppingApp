import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/app_state_container.dart';
import 'package:shoptilyoudrop/model/category_set.dart';
import 'package:shoptilyoudrop/screens/shared/custom_appbar.dart';
import 'package:shoptilyoudrop/screens/shared/custom_drawer.dart';

class CategoriesOverviewPage extends StatefulWidget{

  @override
  CategoriesOverviewState createState() => new CategoriesOverviewState();
}

class CategoriesOverviewState extends State<CategoriesOverviewPage>{
  List<CategoryCard> _categroySets = new List();
  bool _showModal = false;

  @override
  void initState() {
    var cat1 = new CategorySet("Maxi Borås");
    cat1.categories.add(new Category("Bröd",1));
    cat1.categories.add(new Category("Kött och ost",2));
    cat1.categories.add(new Category("Grönsaker",3));
    cat1.categories.add(new Category("Övrigt", 4));
    _categroySets.add(new CategoryCard(cat1, _getColor(), _deleteCategory, _showDialog));
    _categroySets.add(new CategoryCard(cat1, _getColor(), _deleteCategory, _showDialog));
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new CustomAppBar("Categories"),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addCategory,
        child: new Icon(Icons.add, color: Colors.white, size: 35.0)
      ),
      body: _showList()
    );
  }

  Widget _showList(){
    return new Container(
        child:
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index){ return _categroySets[index];},
              itemCount: _categroySets.length,
            )
          )

      );
  }
  void onStuff(int i, int e){

  }
  void _addCategory(){
    setState(
        (){
          var cat1 = new CategorySet("Empty");
          _categroySets.add(new CategoryCard(cat1, _getColor(), _deleteCategory, _showDialog));
        }
    );
  }

  void _deleteCategory(CategoryCard card){
    setState(
            (){
          _categroySets.remove(card);
        }
    );
  }

  Future<Null> _showDialog(Category category, bool isEdit) async {
    CategorySet categorySet = await showDialog<CategorySet>(
      context: context,
      builder: (BuildContext context){
        return new SimpleDialog(
          title: new Text(isEdit ? "Edit" : "Add new"),
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Name of Store",
                  hintText: "Enter name of store"
                ),
                keyboardType: TextInputType.text,
              ),
            )
          ]
        );
      }
    );
    setState(() {

    });
  }

  Color _getColor(){
    return Colors.green[300];
  }
}

class CategoryCard extends StatelessWidget{
  final Color _color;
  final CategorySet _categorySet;
  final Function _deleteCallback;
  final Function _editCallback;
  CategoryCard(this._categorySet, this._color, this._deleteCallback, this._editCallback);

  @override
  Widget build(BuildContext context){
    return new Card(
      child: new Row(
        children: <Widget>[
          new Container(
            height: 80.0,
            width: 40.0,
            decoration: new BoxDecoration(
              color: _color,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(4.0),
                bottomLeft: const Radius.circular(4.0),
              )
            ),
            child: new Center(
                child: new Text(_categorySet.categories.length.toString(), style: new TextStyle(color:Colors.white, fontSize: 30.0))
            )
          ),
          new Expanded(
            child: new Padding(
              padding: EdgeInsets.all(10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(_categorySet.name, style: new TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                  new Text(_categorySet.categories.length.toString() + " categories", style: new TextStyle(fontSize: 14.0, color: Colors.grey[600]))
                ],
              )
            )
          ),
          new IconButton(
            icon: new Icon(Icons.edit, size:35.0),
              onPressed: () async { await _editCallback(_categorySet, true);}
          ),
          new IconButton(
              icon: new Icon(Icons.delete, color: Colors.red, size:35.0),
              onPressed: (){ _deleteCallback(this);}
          )
        ]
      )
    );
  }
}