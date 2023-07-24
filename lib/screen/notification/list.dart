import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';
import 'package:prod_ec/screen/notification/NotificationController.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final NotificationController controller = Get.put(NotificationController());
  final checklist = ['Enviar notificação', 'Desabilitar notificação'];
  List<bool> listExpanded = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i <= 40; i++) {listExpanded.add(false);}
    checklist.forEach((element) => controller.checkboxStatus.add(false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() {
                return Scaffold(
                  appBar: AppBar(backgroundColor: primaryColor),
                  body: ListView.builder(
                    itemCount: checklist.length,
                    itemBuilder: (context, index) => Obx(() => CheckboxListTile(value: controller.checkboxStatus[index], onChanged: (value) => controller.checkboxStatus[index] = !controller.checkboxStatus[index], checkColor: Colors.white, title: Text(checklist[index]))),
                  ),
                );
              });
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 20),
        itemCount: 40,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 700),
              expansionCallback: (int panelListIndex, bool isExpanded) => setState(() => listExpanded[index] = !isExpanded),
              children: [
                ExpansionPanel(
                  backgroundColor: Color(0xff4c846e),
                  isExpanded: listExpanded[index],
                  headerBuilder: (context, isExpanede) => Text('Text ${index + 1}', style: TextStyle(color: Colors.white)),
                  body: Text('Body Aoek ajfs jdskqn jjdsnalv iuthajs nghaei jfdaofhk jdshaiehfdal organiteaf jfaskfhfoss arfcka hngsos kdmngks aigjska irngjaodng soamvnr afjgore kajgi.', style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.justify),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}