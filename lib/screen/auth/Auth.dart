import 'AuthController.dart';
import 'package:get/get.dart';
import 'Cadastro/Cadastro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/widget/CustomPath.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final AuthController controller = Get.put(AuthController());
  EdgeInsetsGeometry txtF = const EdgeInsets.all(10);
  Color theme = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Stack(
            children: [
              ClipPath(
                clipper: CustomShape(),
                child: Container(height: constraints.maxHeight / 2, width: Get.width, color: theme),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: constraints.maxHeight / 3.5),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundColor: Color(0xffC9CCD1),
                        backgroundImage: AssetImage('assets/image/kapo.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: txtF,
                          child: TextField(
                            controller: controller.usuarioController.value,
                            decoration: InputDecoration(hintText: 'email'.tr),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: txtF,
                          child: TextField(
                            controller: controller.senhaController.value,
                            obscureText: true,
                            decoration: InputDecoration(hintText: 'password'.tr),
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                        Padding(
                          padding: txtF,
                          child: TextButton.icon(
                            onPressed: () => controller.login(),
                            icon: Icon(Icons.lock),
                            label: Text('Login'),
                            style: TextButton.styleFrom(primary: Colors.white, backgroundColor: theme),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text('forget_password'.tr),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: constraints.minHeight + 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'sign_up_title'.tr,
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'sign_up'.tr,
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => Cadastro()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}