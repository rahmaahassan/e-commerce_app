import 'package:flutter/material.dart';

class FamousItems extends StatelessWidget {
  final String famousItemName,
  famousItemImage,
  famousItemSubtitle;

  FamousItems({this.famousItemName, this.famousItemImage, this.famousItemSubtitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                child: Image.asset(famousItemImage, fit: BoxFit.fill,)),
            //alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 132,
          ),
          Positioned(
            bottom: 0,
            left: 88,
            right: 10,
            top: 111,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomRight:  Radius.circular(5)),
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
                    famousItemName,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8.0,
                    ),
                  ),
                  Text(
                    //هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع. ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النص العربى أن يوفر على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم فيظهر بشكل لا يليق. هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.
                    famousItemSubtitle,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 4.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
