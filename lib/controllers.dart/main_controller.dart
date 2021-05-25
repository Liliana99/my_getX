import 'package:flutter/material.dart';
import 'package:flutter_getx_validation/pages/splash.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  void buildSnackBar() {
    Get.snackbar(
      'SnackBar',
      'This an example, simple title!..',
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
      messageText: Text(
        'This is an example of SnackBar',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void buildDialog() {
    Get.defaultDialog(
      title: 'Dialog',
      middleText: 'This is the middleText',
      middleTextStyle: GoogleFonts.aldrich(
        color: Colors.white,
        fontSize: 16.0,
      ),
      content: Container(
        child: Center(
          child: Text(
            'This is the custom content',
            style: GoogleFonts.aldrich(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.orange,
      radius: 10,
      textConfirm: 'Confirm',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.white,
    );
  }

  void buildBottomSheet() {
    Get.bottomSheet(
      Container(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(
                Icons.flutter_dash_outlined,
                size: 30,
                color: Colors.blue,
              ),
              title: Text(
                'Option One',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.mood,
                size: 30,
                color: Colors.yellow,
              ),
              title: Text(
                'Option Two',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.purple,
      barrierColor: Colors.green[100],
      isDismissible: true,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white,
          style: BorderStyle.solid,
          width: 2.0,
        ),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      ),
    );
  }

  void goToPage() {
    Get.to(
      () => SplashView(),
      fullscreenDialog: true,
      transition: Transition.zoom,
      duration: Duration(milliseconds: 400),
    );
  }

  void pressSelected(int index) {
    switch (index) {
      case 0:
        return buildSnackBar();
      case 1:
        return buildDialog();
      case 2:
        return buildBottomSheet();
      case 3:
        return goToPage();
      default:
    }
  }

  String buildSubTitle(int index) {
    switch (index) {
      case 0:
        return 'SnackBar';
      case 1:
        return 'Dialog';
      case 2:
        return 'Bottom Sheet';
      case 3:
        return 'Navigation';
      case 4:
        return 'Other features..';
      default:
    }
    return '';
  }

  String buildTextDetail(int index) {
    switch (index) {
      case 0:
        return 'SnackBar..press';
      case 1:
        return 'Dialog..press';
      case 2:
        return 'Bottom Sheet..press';
      case 3:
        return 'Navigation..press';
    }
    return '';
  }

  String buildTitleDetail(int index) {
    switch (index) {
      case 0:
        return 'SnackBar';
      case 1:
        return 'Dialog';
      case 2:
        return 'Bottom Sheet';
      case 3:
        return 'Navigation';
      default:
    }
    return '';
  }
}
