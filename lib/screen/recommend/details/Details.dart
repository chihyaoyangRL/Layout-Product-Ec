import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Details extends StatefulWidget {
  final String title, image;
  final double price;

  const Details({Key? key, required this.title, required this.image, required this.price}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late AudioPlayer advancedPlayer;
  late AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer, prefix: 'assets/sound_effect/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Itens'), centerTitle: true, backgroundColor: primaryColor),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              title: Text(widget.title, style: TextStyle(fontSize: 28)),
              subtitle: Text('\$ ${widget.price}', style: TextStyle(fontSize: 21)),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('specif'.tr, style: TextStyle(fontSize: 25)),
                      ),
                    ),
                    ListTile(
                      leading: IconsDetails(icon: Icons.fullscreen_sharp),
                      title: Text('32cm'),
                      subtitle: Text('screen'.tr),
                    ),
                    ListTile(
                      leading: IconsDetails(icon: Icons.battery_std_outlined),
                      title: Text('320mAh'),
                      subtitle: Text('battery'.tr),
                    ),
                    ListTile(
                      leading: IconsDetails(icon: FontAwesomeIcons.tint),
                      title: Text('IP68'),
                      subtitle: Text('waterproof'.tr),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Container(
                        height: Get.height / 2.5,
                        width: Get.width / 2,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -250,
                      left: -75,
                      child: Image.network(widget.image, width: Get.width, height: Get.height),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('features'.tr, style: TextStyle(fontSize: 28)),
          ),
          ListTile(
            leading: CircleAvatar(backgroundColor: primaryColor, radius: 10),
            title: Text('Apple original smart watch', style: TextStyle(color: Colors.grey)),
          ),
          ListTile(
            leading: CircleAvatar(backgroundColor: primaryColor, radius: 10),
            title: Text('Active heart rate sensor', style: TextStyle(color: Colors.grey)),
          ),
          ListTile(
            leading: CircleAvatar(backgroundColor: primaryColor, radius: 10),
            title: Text('Long-lasting battery', style: TextStyle(color: Colors.grey)),
          ),
          ConfirmationSlider(
            width: Get.width,
            backgroundColor: Colors.grey,
            foregroundColor: primaryColor,
            foregroundShape: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            backgroundShape: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            sliderButtonContent: Icon(Icons.credit_card, color: Colors.white),
            textStyle: TextStyle(color: Colors.white),
            text: 'slide_to_pay'.tr,
            backgroundColorEnd: Colors.green,
            onConfirmation: () async {
              await audioCache.play('payments.mp3'); /// Sound Effect
              Get.defaultDialog(barrierDismissible: false, onWillPop:() => Future.value(false), title: 'Alert', content: Text('Confirma pagar este produto ${widget.title} ?'), actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text('No'),
                  style: TextButton.styleFrom(backgroundColor: Colors.red, primary: Colors.white),
                ),
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text('Sim'),
                  style: TextButton.styleFrom(backgroundColor: primaryColor, primary: Colors.white),
                ),
              ]);
            },
          )
        ],
      ),
    );
  }
}

class IconsDetails extends StatelessWidget {
  final IconData icon;
  const IconsDetails({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(width: 2, color: primaryColor)), child: Icon(icon, color: primaryColor));
}