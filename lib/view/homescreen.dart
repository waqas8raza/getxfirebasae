import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:getxfirebasae/controllers/dataaddcontroller.dart';
import 'package:getxfirebasae/utils/widgets/buttonwidget.dart';
import 'package:getxfirebasae/utils/widgets/textfield.dart';

class AddData extends StatelessWidget {
  AddData({super.key});
  Adddatacontroller _controller = Get.put(Adddatacontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Mytextfield(
                controller: _controller.titlec,
                icon: Icons.title,
                text: 'title'),
            const SizedBox(
              height: 30,
            ),
            Mytextfield(
                controller: _controller.descriptionc,
                icon: Icons.description,
                text: 'Description'),
            const SizedBox(
              height: 30,
            ),
            Buttonwidget(
                icon: Icons.add,
                ontap: () {
                  _controller.adddata();
                },
                text: 'ADD'),
            Container(
              child: Obx(
                () => Column(
                  children: _controller.modeldata.value
                      .map((e) => ListTile(
                            title: Text(e.title.toString()),
                            leading: Text(e.desc.toString()),
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
