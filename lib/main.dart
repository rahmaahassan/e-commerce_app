import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/favorite.dart';
import 'screens/home.dart';
import 'screens/notification.dart';
import 'screens/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'اسم التطبيق',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF020B2D),
        accentColor: Color(0xFF494545),
        buttonColor: Color(0xFF222B45),
        hoverColor: Color(0xFF195C1E),
      ),
      home: AppHomePage(),
    );
  }
}

class AppHomePage extends StatefulWidget {

  @override
  AppHomePageState createState() {
    return new AppHomePageState();
  }
}

class AppHomePageState extends State<AppHomePage> {
  int _currentIndex = 0;
  List<Widget> _children = [];
  List<Widget> _appBars = [];

  _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    _children.add(HomeTab());
    _children.add(FavoriteTab());
    _children.add(NotificationTab());
    _children.add(SettingsTab());

    _appBars.add(_buildAppBar());
    _appBars.add(_buildAppBarOne('المفضلة'));
    _appBars.add(_buildAppBarOne('الاشعارات'));
    _appBars.add(_buildAppBarOne('الاعدادات'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_currentIndex],
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5), topLeft: Radius.circular(5)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 1,
              offset: Offset(0, 6), // changes position of shadow
            ),
          ],
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  //add Navigator
                  onTap: () {
                    _onTabTapped(0);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: _currentIndex == 0 ? Theme.of(context).primaryColor : Colors.grey.shade400,
                      ),
                      Text('الرئيسية', style: TextStyle(
                        color: _currentIndex == 0 ? Theme.of(context).primaryColor : Colors.grey.shade400,
                      ),),
                    ],
                  ),
                ),
                InkWell(
                  //add Navigator
                  onTap: () {
                    _onTabTapped(1);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        _currentIndex == 1 ? 'assets/images/favorite_col.png' : 'assets/images/favorite.png',
                        width: 22,
                      ),
                      Text('المفضلة', style: TextStyle(
                        color: _currentIndex == 1 ? Theme.of(context).primaryColor : Colors.grey.shade400,
                      ),),
                    ],
                  ),
                ),
                InkWell(
                  //add Navigator
                  onTap: () {
                    _onTabTapped(2);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        _currentIndex == 2 ? 'assets/images/notification_col.png' : 'assets/images/notification.png',
                        width: 22,
                      ),
                      Text('الاشعارات', style: TextStyle(
                        color: _currentIndex == 2 ? Theme.of(context).primaryColor : Colors.grey.shade400,
                      ),),
                    ],
                  ),
                ),
                InkWell(
                  //add Navigator
                  onTap: () {
                    _onTabTapped(3);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        _currentIndex == 3 ? 'assets/images/settings_col.png' : 'assets/images/settings.png',
                        width: 25,
                      ),
                      Text('الاعدادات', style: TextStyle(
                        color: _currentIndex == 3 ? Theme.of(context).primaryColor : Colors.grey.shade400,
                      ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }

  Widget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 90),
      child: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Container(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                      child: Container(
                        height: 30,
                        width: 250,
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0,
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
                                      padding: EdgeInsets.symmetric(vertical: 2),
                                      icon: Icon(Icons.search_sharp),
                                      onPressed: () {},
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 22, vertical: 5)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                        //color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    'تصفح الاماكن بسرعة',
                    style: TextStyle(
                      fontSize: 7.2,
                      //color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 37,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildAppBarOne(String title) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 50),
      child: AppBar(
        bottom: PreferredSize(child: Container(color: Colors.grey.shade200, height: 1.0,), preferredSize: Size.fromHeight(1.0)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.only(top: 15),
              child: Text(title, textAlign: TextAlign.right,style: TextStyle(color: Colors.black, fontSize: 16,))),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.arrow_forward,
                color: Color(0xFF020B2D),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
