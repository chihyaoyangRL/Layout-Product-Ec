import 'package:get/get.dart';
import 'CadastroController.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/widget/CustomPath.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final CadastroController controller = Get.put(CadastroController());
  EdgeInsetsGeometry txtF = const EdgeInsets.all(10);
  Color theme = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              ClipPath(
                clipper: CustomShape(),
                child: Container(height: constraints.maxHeight / 2, width: Get.width, color: theme),
              ),
              Positioned(
                top: constraints.maxHeight / 4,
                child: SizedBox(
                  width: Get.width,
                  height: constraints.maxHeight,
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 90.0),
                    children: [
                      Padding(
                        padding: txtF,
                        child: TextField(
                          style: TextStyle(color: Colors.grey[300]),
                          controller: controller.usuarioController.value,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            hintText: 'nome'.tr,
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: txtF,
                        child: TextField(
                          style: TextStyle(color: Colors.grey[300]),
                          controller: controller.emailController.value,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'email'.tr,
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: txtF,
                        child: TextField(
                          style: TextStyle(color: Colors.grey[300]),
                          controller: controller.senhaController.value,
                          cursorColor: Colors.white,
                          obscureText: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'password'.tr,
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: txtF,
                        child: TextButton.icon(
                          onPressed: () => controller.cadastro(),
                          icon: Icon(Icons.edit, color: Colors.grey[700]),
                          label: Text('Cadastro', style: TextStyle(color: Colors.grey[700])),
                          style: TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.white, shadowColor: Colors.green, elevation: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}