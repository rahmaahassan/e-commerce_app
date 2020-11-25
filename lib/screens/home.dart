import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(context),
          _buildSlider(),
          //_buildCategory(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('الاعدادات')),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('الاشعارات')),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars),
              title: Text('المفضلة')),
          BottomNavigationBarItem(icon: Icon(Icons.home),
              title: Text('الرئيسية')),

        ],
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).primaryColor,
        onTap: onTabTapped,
      ),
    );
  }
}

SliverAppBar _buildAppBar(BuildContext context) {
  return SliverAppBar(
    backgroundColor: Colors.transparent,
    title: ListTile(
      title: Text(
        'اسم التطبيق',
        style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      ),
      subtitle: Text(
        'تصفح الاماكن بسرعة',
        style: TextStyle(
          fontSize: 9,
          color: Theme.of(context).primaryColor,
        ),
        textAlign: TextAlign.right,
      ),
    ),
    expandedHeight: 65,
    floating: true,
    actions: [
      Image.asset('assets/images/logo.png'),
    ],
    flexibleSpace: Container(
      //height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(right: 160, top: 50),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  textDirection: TextDirection.rtl,
                  cursorColor: Colors.grey,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      hintText: 'إبحث في مكان',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.transparent,
                        child: IconButton(
                          icon: Icon(Icons.search_outlined),
                          onPressed: () {},
                          color: Colors.grey,
                        ),
                      ),
                      //border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildSlider() {
  return SliverToBoxAdapter(
    child: Stack(
      children: <Widget>[
        Container(
          height: 200,
          child: Swiper(
            autoplay: true,
            loop: true,
            curve: Curves.easeIn,
            itemBuilder: (BuildContext context, int index){
              return Image.asset('assets/images/background.png', fit: BoxFit.fill);
            },
            itemCount: 3,
            pagination: new SwiperPagination(
                margin: EdgeInsets.only(right: 25.0),
                builder: DotSwiperPaginationBuilder(
                  color: Colors.white,
                  activeColor:Colors.green,
                )
            ),
          ),
        ),
        Positioned(
          height: 80,
          bottom: 70,
          right: 3,
          left: 65,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'اسم التطبيق',
                    style: TextStyle(
                        fontSize: 33,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    'تصفح الاماكن بسرعة',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(width: 15,),
              Image.asset(
                'assets/images/logo_empty.png',
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}



/*Widget _categoryList(BuildContext context){
  return InkWell(
    onTap: () {},
    child: Row(
      children: [
        Card(
          child: ListTile(
            trailing: Icon(Icons.fastfood),
            title: Text(
              'طعام',
            ),
          ),
        )
      ],
    ),
  );
}*/