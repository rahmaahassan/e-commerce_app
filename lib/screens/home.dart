import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:food_project/helper/data.dart';
import 'package:food_project/models/category_model.dart';
import 'package:food_project/models/item_model.dart';
import 'package:food_project/widgets/category_tile.dart';
import 'package:food_project/widgets/famous_item.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  double topPosition;


  List<CategoryModel> categories = List<CategoryModel>();
  List<FamousItemModel> famousItem = List<FamousItemModel>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    famousItem = getFamousItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: [
            Container(
              height: 150,
              child: Swiper(
                autoplay: true,
                loop: true,
                curve: Curves.easeIn,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 22),
                    child: Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.fill,
                    ),
                  );
                },
                itemCount: 3,
                pagination: SwiperPagination(
                    margin: const EdgeInsets.only(),
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.grey.shade100,
                      activeColor: Theme.of(context).primaryColor,
                    )),
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
                    onTap: () {},
                    child: Text(
                      'تغيير المنطقة',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
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
                    onTap: () {},
                    child: Text(
                      'مشاهدة المزيد',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
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
                    padding: EdgeInsets.only(left: 0, right: 0),
                    margin: EdgeInsets.only(top: 10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey,
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset('assets/images/res.jpg', fit: BoxFit.fill,)),
                                    //alignment: Alignment.topCenter,
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    width: 167,
                                    height: 85,
                                  ),
                                  Positioned(
                                    bottom: 65,
                                    left: 111,
                                    right: 10,
                                    top: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(5), topRight:  Radius.circular(5)),
                                        color: Colors.black54,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        //vertical: ,
                                        horizontal: 10.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'مطاعم',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey,
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset('assets/images/res_coffee.jpg', fit: BoxFit.fill,)),
                                    //alignment: Alignment.topCenter,
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    width: 167,
                                    height: 85,
                                  ),
                                  Positioned(
                                    bottom: 65,
                                    left: 111,
                                    right: 10,
                                    top: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(5), topRight:  Radius.circular(5)),
                                        color: Colors.black54,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        //vertical: ,
                                        horizontal: 10.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'كافيهات',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey,
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset('assets/images/hotels.jpeg', fit: BoxFit.fill,)),
                                    //alignment: Alignment.topCenter,
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    width: 167,
                                    height: 85,
                                  ),
                                  Positioned(
                                    bottom: 65,
                                    left: 111,
                                    right: 10,
                                    top: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(5), topRight:  Radius.circular(5)),
                                        color: Colors.black54,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        //vertical: ,
                                        horizontal: 10.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'فنادق',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey,
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset('assets/images/library.png', fit: BoxFit.fill,)),
                                    //alignment: Alignment.topCenter,
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    width: 167,
                                    height: 85,
                                  ),
                                  Positioned(
                                    bottom: 65,
                                    left: 111,
                                    right: 10,
                                    top: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(5), topRight:  Radius.circular(5)),
                                        color: Colors.black54,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        //vertical: ,
                                        horizontal: 10.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'مكتبات',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey,
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset('assets/images/barber.jpg', fit: BoxFit.fill,)),
                                    //alignment: Alignment.topCenter,
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    width: 167,
                                    height: 85,
                                  ),
                                  Positioned(
                                    bottom: 65,
                                    left: 111,
                                    right: 10,
                                    top: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(5), topRight:  Radius.circular(5)),
                                        color: Colors.black54,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        //vertical: ,
                                        horizontal: 10.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'حلاق',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey,
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset('assets/images/mobiles.jpg', fit: BoxFit.fill,)),
                                    //alignment: Alignment.topCenter,
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    width: 167,
                                    height: 85,
                                  ),
                                  Positioned(
                                    bottom: 65,
                                    left: 111,
                                    right: 10,
                                    top: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(5), topRight:  Radius.circular(5)),
                                        color: Colors.black54,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        //vertical: ,
                                        horizontal: 10.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'هواتف',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                          ),

                        ],
                      ),
                    )
                )
            ),
          ],
        ),
      );
  }
}
