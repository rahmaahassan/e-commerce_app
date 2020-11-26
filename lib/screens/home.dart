import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:food_project/helper/data.dart';
import 'package:food_project/models/category_model.dart';
import 'package:food_project/models/item_model.dart';
import 'package:food_project/widgets/category_tile.dart';
import 'package:food_project/widgets/diverse_item.dart';
import 'package:food_project/widgets/famous_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController = ScrollController();
  Color appBarBackground;
  double topPosition;

  List<CategoryModel> categories = List<CategoryModel>();
  List<FamousItemModel> famousItem = List<FamousItemModel>();
  List<DiverseCategoryModel> diverseItem = List<DiverseCategoryModel>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    famousItem = getFamousItem();
    diverseItem = getDiverseCategoryItem();

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Container(
                height: 120,
                child: Swiper(
                  autoplay: true,
                  loop: true,
                  curve: Curves.easeIn,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 22),
                      child: Image.asset('assets/images/background.png',
                          fit: BoxFit.fill,),
                    );
                  },
                  itemCount: 3,
                  pagination: SwiperPagination(
                    margin: const EdgeInsets.only(),
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.grey.shade100,
                        activeColor: Theme.of(context).primaryColor,
                      )
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: EdgeInsets.all(3),
                  height: 60,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        iconImage: categories[index].iconImage,
                        categoryName: categories[index].categoryName,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 11),
              Padding(
                padding: const EdgeInsets.only(top: 0, right: 22, left: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      //add Navigator
                      onTap: (){},
                      child: Text(
                        'تغيير المنطقة',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                        ),
                      ),
                    ),
                    Text(
                      'اشهر الأماكن و الخدمات في أربيل',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).hoverColor,
                height: 1,
                endIndent: 11.5,
                indent: 315,
                thickness: 1.5,
              ),
              SizedBox(height: 10),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: double.infinity,
                  height: 132,
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: famousItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FamousItems(
                        famousItemImage: famousItem[index].famousItemImage,
                        famousItemName: famousItem[index].famousItemName,
                        famousItemSubtitle: famousItem[index].famousItemSubtitle,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(top: 3, right: 10, left: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      //add Navigator
                      onTap: (){},
                      child: Text(
                        'مشاهدة المزيد',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey
                        ),
                      ),
                    ),
                    Text(
                      'الاقسام المتنوعة في أربيل',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).hoverColor,
                height: 1,
                endIndent: 11.5,
                indent: 320,
                thickness: 1.5,
              ),
              Expanded(
                child: Container(
                  height: 2,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(top: 10),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: diverseItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DiverseItems(
                        diverseCategoryImage: diverseItem[index].diverseCategoryImage,
                        diverseCategoryName: diverseItem[index].diverseCategoryName,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

Widget _buildAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 100),
    child: Container(
      decoration: BoxDecoration(color: Colors.transparent),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 44, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  //width: 250,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12,),
                        child: Material(
                          color: Colors.white,
                          elevation: 1,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              cursorColor: Colors.grey.shade400,
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 12,
                              ),
                              decoration: InputDecoration(
                                  hintText: 'إبحث في مكان',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 12,
                                  ),
                                  prefixIcon: Material(
                                    elevation: 0,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: Colors.transparent,
                                    child: IconButton(
                                      icon: Icon(Icons.search_outlined),
                                      onPressed: () {},
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'اسم التطبيق',
                    style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    'تصفح الاماكن بسرعة',
                    style: TextStyle(
                      fontSize: 7,
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Image.asset('assets/images/logo.png',width: 37,),
            ],
          ),
        ),
      ),
    ),
  );
}
