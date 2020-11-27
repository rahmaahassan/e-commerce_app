import 'package:food_project/models/category_model.dart';
import 'package:food_project/models/item_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "طعام";
  categoryModel.iconImage = 'assets/images/food.png';
  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "موضة";
  categoryModel.iconImage = 'assets/images/moda.png';
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "تسوق";
  categoryModel.iconImage = 'assets/images/shoping.png';
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "رياضة";
  categoryModel.iconImage = 'assets/images/sport.png';
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "بنوك";
  categoryModel.iconImage = 'assets/images/business.png';
  category.add(categoryModel);

  return category;

}

List<FamousItemModel> getFamousItem() {
  List<FamousItemModel> item = new List<FamousItemModel>();
  FamousItemModel famousItems = new FamousItemModel();

  //1
  famousItems = new FamousItemModel();
  famousItems.famousItemName = 'مطعم كنتاكي';
  famousItems.famousItemSubtitle = 'هذا النص هو مثال لنص يمكن..';
  famousItems.famousItemImage = 'assets/images/KFC.png';
  item.add(famousItems);

  //2
  famousItems = new FamousItemModel();
  famousItems.famousItemName = 'قهوة تروبيكانا';
  famousItems.famousItemSubtitle = 'هذا النص هو مثال لنص يمكن..';
  famousItems.famousItemImage = 'assets/images/coffee.jpg';
  item.add(famousItems);

  //3
  famousItems = new FamousItemModel();
  famousItems.famousItemName = 'منازل';
  famousItems.famousItemSubtitle = 'هذا النص هو مثال لنص يمكن..';
  famousItems.famousItemImage = 'assets/images/home.jpg';
  item.add(famousItems);


  return item;

}