import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/db_controller.dart';
import 'package:projectx/controller/selection_controller.dart';
import 'package:projectx/ui/components/lists/list_base_2.dart';

import '../../../database/models/log_model.dart';

class TestingDBList extends StatelessWidget {
  TestingDBList({Key? key}) : super(key: key);

  DBController controllerX = Get.find();

  @override
  Widget build(BuildContext context) {
    Stream<List<Log>>? allLogsAsStream = controllerX.logDao.getAllLogsAsStream();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing Database"),
        backgroundColor: Colors.red,
      ),
      body: MixinBuilder<SelectionController>(
        init: Get.find<SelectionController>(),
        builder: (controller) {
          log("REBUILDING TESTLIST3");
          return Column(
            children: [
              Row(
                children: [
                  TextButton(onPressed: () => controller.saveCurrentText("Unknown"), child: const Text("Extra")),
                  TextButton(
                      onPressed: () {
                        log((TestingDBList).toString());
                        controller.deleteAllLogs(id: (TestingDBList).toString());
                        // allLogsAsStream = null;
                        log("AWAITED");
                      },
                      child: const Text("Delete All")),
                ],
              ),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    if (controller.scheduleUpdate.value)
                      const Positioned(
                        child: CircularProgressIndicator.adaptive(
                          value: null,
                        ),
                      ),
                    if (!controller.scheduleUpdate.value)
                      Positioned.fill(
                        child: StreamBuilder<List<Log>>(
                            initialData: const [],
                            stream: allLogsAsStream,
                            builder: (BuildContext context, AsyncSnapshot<List<Log>> snapshot) => snapshot.hasError
                                ? const Text("No Items")
                                : snapshot.hasData && snapshot.data!.isNotEmpty
                                    ? ListNew(items: snapshot.data!)
                                    : const Text("No Items")),
                      ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

/*class _ListRefreshState extends State<TestingDBList> {

}*/
