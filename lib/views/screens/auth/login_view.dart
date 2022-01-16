import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wrl_home_quarantine_getx/logic/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 248, 250, 1),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromRGBO(247, 248, 250, 1),
      //   elevation: 0.0,
      //   systemOverlayStyle: SystemUiOverlayStyle.light,
      //
      //   // brightness: Brightness.light,
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/Login.png',
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 12,
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: controller.loginFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            TextFormField(
                              controller: controller.usernameController,
                              validator: (v) {
                                return controller.validateUsername(v);
                              },
                              onSaved: (v) {
                                controller.username = v;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.indigo[900], width: 1.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "username",
                                labelStyle: TextStyle(color: Colors.indigo[900]),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.indigo[900],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: controller.passwordController,
                              validator: (v) {
                                return controller.validatePassword(v);
                              },
                              onSaved: (v) {
                                controller.password = v;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.indigo[900], width: 1.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "password",
                                labelStyle: TextStyle(color: Colors.indigo[900]),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.indigo[900],
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Obx(
                              () => controller.isLoading.value
                                  ?  Center(
                                      child: CircularProgressIndicator(color: Colors.indigo[900],),
                                    )
                                  : SizedBox(
                                      height: 40,
                                      width: width - 100,
                                      child: MaterialButton(
                                        onPressed: () async {
                                          await controller.doLogin(context);
                                        },
                                        child: const Text(
                                          'Log in',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.indigo[900],
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
