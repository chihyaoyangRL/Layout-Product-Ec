import 'Tab1Controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';
import 'package:prod_ec/widget/iconButton.dart';
import 'package:prod_ec/model/Posts_model.dart';
import 'package:prod_ec/widget/titleWidgets.dart';
import 'package:prod_ec/widget/categoryWidget.dart';
import 'package:prod_ec/utlis/PopupMenuWidget.dart';
import 'package:prod_ec/widget/recommendedItems.dart';
import 'package:prod_ec/screen/home/homeController.dart';
import 'package:prod_ec/screen/promotion/promotion.dart';
import 'package:prod_ec/screen/recommend/Recommend.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  final Tab1Controller controller = Get.put(Tab1Controller());

  List<String> imagePath = [
    'https://www.canon.pt/media/eos_range_tcm121-1266213.png',
    'https://i.pinimg.com/originals/c8/8d/d5/c88dd5c5aa37fc061575796502e3f3c8.png',
    'https://a4.vnda.com.br/saintstudio/2019/07/16/1851-t-shirt-lisa-preta-2602.png?v=1563291989',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/1200px-Sport_balls.svg.png',
    'https://emojipedia-us.s3.amazonaws.com/source/skype/289/books_1f4da.png',
    'https://bphealthcare.com/new/wp-content/uploads/health.png'
  ];
  List<String> categoryTitle = ['camera'.tr, 'mobi'.tr, 'clothes'.tr, 'sport'.tr, 'books'.tr, 'health'.tr];
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
  void initState() {
    super.initState();
    controller.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1EC687),
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.searchController.value,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  filled: true,
                  hintText: 'searchHint'.tr,
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor), borderRadius: const BorderRadius.all(Radius.circular(30.0))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor), borderRadius: const BorderRadius.all(Radius.circular(30.0))),
                  prefixIcon: Container(child: Icon(Icons.search, color: Colors.grey)),
                  suffixIcon: ElevatedButton(
                    onPressed: () => print('Search'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25))),
                    ),
                    child: Text('search'.tr),
                  ),
                ),
              ),
            ),
            PopupMenuButton<String>(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Color(0xff7ed6df),
              padding: EdgeInsets.zero,
              elevation: 0,
              icon: Icon(Icons.shopping_cart_rounded),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuWidget(
                    height: 40.0,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.shopping_cart_rounded, color: Color(0xff223A54)),
                          onPressed: () => Get.back(),
                        ),
                        Text('|'),
                        IconButton(
                          icon: Icon(Icons.cleaning_services_outlined, color: Color(0xff223A54)),
                          onPressed: () => Get.back(),
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: Get.width,
            color: Colors.white,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              color: Colors.greenAccent,
              child: GridView(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10, crossAxisSpacing: 25, crossAxisCount: 4),
                children: [
                  CustomIconButton(
                    icon: Icons.camera_alt,
                    title: 'camera'.tr,
                    onPressed: () => print('câmera'),
                  ),
                  CustomIconButton(
                    icon: Icons.chair,
                    title: 'mobi'.tr,
                    onPressed: () => print('Mobiliária'),
                  ),
                  CustomIconButton(
                    icon: Icons.headphones,
                    title: 'foneO'.tr,
                    onPressed: () => print('Fone de ouvido'),
                  ),
                  CustomIconButton(
                    icon: Icons.videogame_asset,
                    title: 'gaming'.tr,
                    onPressed: () => print('Jogos'),
                  ),
                  CustomIconButton(
                    icon: FontAwesomeIcons.tshirt,
                    title: 'clothes'.tr,
                    onPressed: () => print('Roupas'),
                  ),
                  CustomIconButton(
                    icon: Icons.healing,
                    title: 'health'.tr,
                    onPressed: () => print('Saúde'),
                  ),
                  CustomIconButton(
                    icon: Icons.computer,
                    title: 'computer'.tr,
                    onPressed: () => print('Computador'),
                  ),
                  CustomIconButton(
                    icon: FontAwesomeIcons.tools,
                    title: 'equipment'.tr,
                    onPressed: () => print('Equipamento'),
                  ),
                  CustomIconButton(
                    icon: FontAwesomeIcons.running,
                    title: 'sport'.tr,
                    onPressed: () => print('Esporte'),
                  ),
                  CustomIconButton(
                    icon: Icons.book,
                    title: 'books'.tr,
                    onPressed: () => print('Livros'),
                  ),
                ],
              ),
            ),
          ),
          CustomTitleWidget(title: 'week_promotion'.tr, subtitle: 'view_all'.tr, onPressed: () => Get.to(() => Promotion())),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            color: Colors.greenAccent,
            child: SizedBox(
              height: 200,
              child: FutureBuilder<List<dynamic>>(
                future: controller.posts.value,
                builder: (context, snapshot) => list(context, snapshot),
              ),
            ),
          ),
          CustomTitleWidget(
            title: 'category'.tr,
            subtitle: 'view_all'.tr,
            onPressed: () {
              final HomeController homeController = Get.put(HomeController());
              homeController.selectedIndex.value = 1;
            },
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            color: Colors.greenAccent,
            child: SizedBox(
              height: 200,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 0, crossAxisSpacing: 0),
                children: List.generate(6, (index) => CustomCategoryWidget(imagePath: imagePath[index], title: categoryTitle[index])),
              ),
            ),
          ),
          CustomTitleWidget(title: 'recommend'.tr, subtitle: 'view_all'.tr, onPressed: () => Get.to(() => Recommend())),
          Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              color: Colors.greenAccent,
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => RecommendedItems(
                    width: 150,
                    title: recommenderTitle[index],
                    price: recommenderPrice[index],
                    rating: recommenderRating[index],
                    sale: recommenderSale[index],
                    image: recommenderImage[index],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget list(context, snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Center(child: CircularProgressIndicator());
      case ConnectionState.active:
      case ConnectionState.done:
        if (snapshot.data != null && !snapshot.data.isEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              Posts posts = List<Posts>.from(snapshot.data!)[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(color: Color(0xff7da5f5), borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: FittedBox(child: Text(posts.title, style: TextStyle(color: Colors.white)))),
                          Flexible(child: FittedBox(child: Text(posts.content, style: TextStyle(color: Colors.white)))),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(16), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
                        width: 32,
                        height: 32,
                        child: Center(child: Text('${posts.sale.toString()}%')),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return Obx(() => Center(child: (controller.resultError.isNotEmpty) ? (controller.resultError[0]['error'] == true) ? Text(controller.resultError[0]['message']) : Text('notFound_404'.tr) : CircularProgressIndicator()));
        }
    }
    return SizedBox.shrink();
  }
}