import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getxfirebasae/models/datamodel.dart';

class Adddatacontroller extends GetxController {
  final TextEditingController titlec = TextEditingController();
  final TextEditingController descriptionc = TextEditingController();
  var db = FirebaseFirestore.instance;
  final RxList<Modelclass> modeldata = RxList<Modelclass>([]);

  Future adddata() async {
    var data = Modelclass(title: titlec.text, desc: descriptionc.text);
    await db.collection('notes').add(data.toJson()).whenComplete(
        () => Fluttertoast.showToast(msg: 'Data Added Successfully'));
    getdata();
    titlec.clear();
    descriptionc.clear();
  }

  @override
  void onInit() {
    getdata();
    // TODO: implement onInit
    super.onInit();
  }

  Future getdata() async {
    db.collection('notes').get().then((value) {
      modeldata.value =
          value.docs.map((e) => Modelclass.fromJson(e.data())).toList();
    });
  }
}
