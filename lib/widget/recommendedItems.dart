import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';
import 'package:prod_ec/screen/recommend/details/Details.dart';

class RecommendedItems extends StatelessWidget {
  final int sale;
  final double price, rating, width;
  final String title, image;

  const RecommendedItems({Key? key, required this.price, required this.rating, required this.title, required this.image, required this.sale, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => Details(title: title, price: price, image: image)),
      child: Container(
        margin: EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
        decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.white)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(image, height: 100, width: width),
            Padding(
              padding: EdgeInsets.only(top: 8.0, right: 5, left: 5),
              child: Text(title, style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5, left: 5),
              child: Text("\$ ${price.toString()}", style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5, left: 5),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: rating.toString(), style: TextStyle(color: Colors.white)),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.top,
                          child: Icon(Icons.star, size: 16.0, color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  Text("${sale.toString()} Sale", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}