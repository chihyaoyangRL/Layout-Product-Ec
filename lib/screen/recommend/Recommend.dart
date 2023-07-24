import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';
import 'package:prod_ec/widget/recommendedItems.dart';
import 'package:prod_ec/screen/recommend/RecommendController.dart';

class Recommend extends StatefulWidget {
  const Recommend({Key? key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  final RecommendController controller = Get.put(RecommendController());
  List<String> recommenderTitle = ['tWatch 3541', 'Câmera', 'mobi'.tr, 'clothes'.tr, 'sport'.tr, 'books'.tr, 'Tgs3aa', 'Tgs5aa', 'Tgsa2a', 'Tgs5aa'];
  List<double> recommenderPrice = [320000.00, 250.00, 40.0, 30.0, 21.1, 5.49, 54.1, 3.54, 54.6, 98.1];
  List<double> recommenderRating = [7.0, 5.0, 9.0, 4.0, 5.0, 3.0, 1.0, 5.0, 8.0, 9.0];
  List<int> recommenderSale = [400, 500, 400, 300, 211, 549, 541, 354, 546, 981];
  List<String> recommenderImage = [
    'https://purepng.com/public/uploads/large/apple-watch-pcq.png',
    'https://www.canon.pt/media/eos_range_tcm121-1266213.png',
    'https://i.pinimg.com/originals/c8/8d/d5/c88dd5c5aa37fc061575796502e3f3c8.png',
    'https://a4.vnda.com.br/saintstudio/2019/07/16/1851-t-shirt-lisa-preta-2602.png?v=1563291989',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/1200px-Sport_balls.svg.png',
    'https://emojipedia-us.s3.amazonaws.com/source/skype/289/books_1f4da.png',
    'https://purepng.com/public/uploads/large/apple-watch-pcq.png',
    'https://purepng.com/public/uploads/large/apple-watch-pcq.png',
    'https://purepng.com/public/uploads/large/apple-watch-pcq.png',
    'https://purepng.com/public/uploads/large/apple-watch-pcq.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('recommend'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.change(),
            icon: Icon(Icons.filter_list_outlined, color: Colors.white),
          )
        ],
      ),
      body: Obx(() => GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (controller.stateGri.value ? 2 : 1), mainAxisSpacing: 0, crossAxisSpacing: 0),
            children: List.generate(10, (index) => RecommendedItems(
                width: Get.width,
                title: recommenderTitle[index],
                price: recommenderPrice[index],
                rating: recommenderRating[index],
                sale: recommenderSale[index],
                image: recommenderImage[index],
              ),
            ),
          )),
    );
  }
}