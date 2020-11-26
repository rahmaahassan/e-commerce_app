import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryTile extends StatelessWidget {
  final String iconImage, categoryName;

  CategoryTile({this.iconImage, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        //add Navigator
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(right: 8),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      child: Center(
                    child: Wrap(
                      spacing: 16.0,
                      runSpacing: 16.0,
                      children: <Widget>[
                        Chip(
                          avatar: Image.asset(iconImage, fit: BoxFit.fill,),
                          clipBehavior: Clip.antiAlias,
                          label: Text(categoryName),
                        ),
                      ],
                    ),
                  ))
                ]),
          ),
        ));
  }
}
