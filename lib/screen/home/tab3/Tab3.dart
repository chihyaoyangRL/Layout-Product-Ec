import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';
import 'package:prod_ec/screen/auth/Auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prod_ec/utlis/PopupMenuWidget.dart';
import 'package:prod_ec/widget/TransitionAppBar.dart';
import 'package:prod_ec/screen/notification/list.dart';
import 'package:prod_ec/screen/my_products/MyProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prod_ec/screen/home/tab3/Tab3Controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Tab3 extends StatefulWidget {
  const Tab3({Key? key}) : super(key: key);

  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  final Tab3Controller controller = Get.put(Tab3Controller());
  static const EdgeInsetsGeometry textPadding = EdgeInsets.only(top: 20, bottom: 20, left: 20);
  static const double textFont = 20;
  static const double iconFont = 30;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      SharedPreferences shp = await SharedPreferences.getInstance();
      controller.nome.value = shp.getString('token') ?? 'notFound_404'.tr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          TransitionAppBar(
            extent: 250,
            title: Obx(() => Text(controller.nome.value, style: TextStyle(fontSize: 18, color: Colors.blue[900]), maxLines: 3, overflow: TextOverflow.ellipsis)),
            avatar: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                child: Stack(
                  children: [
                    Obx(() => (controller.imgF.value.isNotEmpty)
                        ? InkWell(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
                            onTap: () => Get.to(() => GestureDetector(onTap: () => Get.back(), child: Container(color: Colors.transparent, child: Image.file(File(controller.imgF.value)))), opaque: false, fullscreenDialog: true),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Color(0xffC9CCD1),
                              backgroundImage: FileImage(File(controller.imgF.value)),
                            ),
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundColor: Color(0xffC9CCD1),
                            child: Icon(FontAwesomeIcons.userAlt, size: 40, color: Colors.white),
                          )),
                    Positioned(
                      bottom: 0,
                      right: -5,
                      child: PopupMenuButton<String>(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                        color: primaryColor,
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        icon: CircleAvatar(
                          radius: 17,
                          backgroundColor: Color(0xff4E4F50),
                          child: Icon(Icons.add_a_photo, color: Color(0xffDDDFE1)),
                        ),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuWidget(
                              height: 40.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.camera_alt, color: Color(0xffdcf317)),
                                      onPressed: () async {
                                        Get.back();
                                        await ImagePicker().pickImage(source: ImageSource.camera).then((result) {
                                          if (result != null) {
                                            controller.imgF.value = result.path;
                                          }
                                        });
                                      },
                                    ),
                                    Text('|'),
                                    IconButton(
                                      icon: Icon(Icons.photo_library_outlined, color: Color(0xffdcf317)),
                                      onPressed: () async {
                                        Get.back();
                                        await ImagePicker().pickImage(source: ImageSource.gallery).then((result) {
                                          if (result != null) {
                                            controller.imgF.value = result.path;
                                          }
                                        });
                                      },
                                    ),
                                    Text('|'),
                                    IconButton(
                                      icon: Icon(Icons.clear, color: Color(0xffdcf317)),
                                      onPressed: () {
                                        Get.back();
                                        ImageCache().clear();
                                        controller.imgF.value = '';
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ];
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
                ListTile(
                  contentPadding: textPadding,
                  title: Text('notification'.tr, style: TextStyle(fontSize: textFont)),
                  leading: Icon(Icons.notifications, color: primaryColor, size: iconFont),
                  onTap: () => Get.to(() => Notifications()),
                ),
                ListTile(
                  contentPadding: textPadding,
                  title: Text('payments'.tr, style: TextStyle(fontSize: textFont)),
                  leading: Icon(Icons.credit_card, color: primaryColor, size: iconFont),
                  onTap: () => print('payments'),
                ),
                ListTile(
                  contentPadding: textPadding,
                  title: Text('message'.tr, style: TextStyle(fontSize: textFont)),
                  leading: Icon(Icons.message, color: primaryColor, size: iconFont),
                  onTap: () => print('message'),
                ),
                ListTile(
                  contentPadding: textPadding,
                  title: Text('my_orders'.tr, style: TextStyle(fontSize: textFont)),
                  leading: Icon(Icons.list, color: primaryColor, size: iconFont),
                  onTap: () => Get.to(() => MyProduct()),
                ),
                ListTile(
                  contentPadding: textPadding,
                  title: Text('setting'.tr, style: TextStyle(fontSize: textFont)),
                  leading: Icon(Icons.settings, color: primaryColor, size: iconFont),
                  onTap: () => print('Configurar conta'),
                ),
                ListTile(
                  contentPadding: textPadding,
                  title: Text('call_adm'.tr, style: TextStyle(fontSize: textFont)),
                  leading: Icon(Icons.support_agent, color: primaryColor, size: iconFont),
                  onTap: () => print('Central de atendimento'),
                ),
                ListTile(
                  contentPadding: textPadding,
                  title: Text('about'.tr, style: TextStyle(fontSize: textFont)),
                  leading: Icon(Icons.help, color: primaryColor, size: iconFont),
                  onTap: () => print('Sobre aplicativo'),
                ),
                ListTile(
                  contentPadding: textPadding,
                  title: Text('logout'.tr, style: TextStyle(fontSize: textFont)),
                  leading: Icon(Icons.logout, color: primaryColor, size: iconFont),
                  onTap: () async {
                    SharedPreferences shp = await SharedPreferences.getInstance();
                    await shp.clear();
                    Get.offAll(() => Auth());
                  },
                )],
            ),
          )
        ],
      ),
    );
  }
}