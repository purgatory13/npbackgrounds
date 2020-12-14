import 'package:npbackgrounds/model/categories_model.dart';

String apiKey = "563492ad6f917000010000016c9e3bece3324f6e93176dd5bc0e7824";


List<CategoriesModel> getCategories(){
  List<CategoriesModel> categories = new List();
  CategoriesModel categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl="https://images.pexels.com/photos/63553/pexels-photo-63553.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  categoriesModel.categoriesName = "Grand Canyon";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl="https://images.pexels.com/photos/5909127/pexels-photo-5909127.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoriesName = "Bryce Canyon";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl="https://images.pexels.com/photos/86428/monument-valley-utah-usa-red-86428.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  categoriesModel.categoriesName = "Monument";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl="https://images.pexels.com/photos/62600/pexels-photo-62600.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  categoriesModel.categoriesName = "Arches";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return categories;
}