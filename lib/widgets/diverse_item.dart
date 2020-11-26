import 'package:flutter/material.dart';

class DiverseItems extends StatelessWidget {
  final String diverseCategoryName,
      diverseCategoryImage;

  DiverseItems({this.diverseCategoryName, this.diverseCategoryImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //add Navigator
      onTap: () {},
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(diverseCategoryImage, fit: BoxFit.fill,)),
            //alignment: Alignment.topCenter,
            //margin: EdgeInsets.all(2),
            //width: 150,
            //height: 132,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
