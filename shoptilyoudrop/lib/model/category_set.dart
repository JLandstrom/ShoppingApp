
class CategorySet{
  String name;
  List<Category> categories;

  CategorySet(this.name){
    categories = new List();
  }
}

class Category{
  String name;
  int order;

  Category(this.name, this.order);
}