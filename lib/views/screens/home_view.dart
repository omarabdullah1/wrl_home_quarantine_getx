import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrl_home_quarantine_getx/Shared/network/local/cache_helper.dart';
import 'package:wrl_home_quarantine_getx/routes/routes.dart';

class HomeView extends GetView {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text('Home Screen'),
            ElevatedButton(
              onPressed: () {
                CacheHelper.removeData(key: 'token');
                Get.toNamed(AppRoutes.login);
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
