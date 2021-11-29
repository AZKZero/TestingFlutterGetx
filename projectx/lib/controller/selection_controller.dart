import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/db_controller.dart';
import 'package:projectx/database/models/application/log_model.dart';

class SelectionController extends GetxController {
  var currentText = "None".obs;
  var currentColor = Colors.white;
  var scheduleUpdate = false.obs;

  DBController controller = Get.find();

  SelectionController();

  void saveCurrentText(String value) async {
    try {
      currentText.value = value;
      scheduleUpdate.value = true;
      await controller.logDao.insertLog(Log(buttonClicked: currentText.value, dateButtonClickedOn: formatDate(DateTime.now(), [HH, '.', nn, ": :", dd, "/", M, "/", yyyy])));
      scheduleUpdate.value = false;
    } catch (e) {
      print("ERROR");
      print(e);
    }
  }

  void deleteAllLogs({String? id}) async {
    scheduleUpdate.value = true;
    await controller.logDao.deleteAllLogs();
    scheduleUpdate.value = false;
    // if (id != null) update(List.generate(1, (index) => id), true);
  }
}
