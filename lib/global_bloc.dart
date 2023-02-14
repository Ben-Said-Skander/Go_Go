// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:pfa_application_1/models/medicine.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalBloc {
  BehaviorSubject<List<Medicine>>? medicineList;
  BehaviorSubject<List<Medicine>>? get getMedicineList => medicineList;

  GlobalBloc() {
    medicineList = BehaviorSubject<List<Medicine>>.seeded([]);
    makeMedicineList();
  }

  Future removeMedicine(Medicine tobeRemoved) async {
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    List<String> medicineJsonList = [];

    var blockList = medicineList!.value;
    blockList.removeWhere(
        (medicine) => medicine.medicineName == tobeRemoved.medicineName);

    if (blockList.isNotEmpty) {
      for (var blockMedicine in blockList) {
        String medicineJson = jsonEncode(blockMedicine.toJson());
        medicineJsonList.add(medicineJson);
      }
    }
    sharedUser.setStringList('medicines', medicineJsonList);
    medicineList!.add(blockList);
  }

  Future updateMedicineList(Medicine newMedicine) async {
    var blockList = medicineList!.value;
    blockList.add((newMedicine));
    medicineList!.add(blockList);

    Map<String, dynamic> tempMap = newMedicine.toJson();
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    String newMedicineJson = jsonEncode(tempMap);
    List<String> medicineJsonList = [];
    if (sharedUser.getStringList('medicines') == null) {
      medicineJsonList.add(newMedicineJson);
    } else {
      medicineJsonList = sharedUser.getStringList('medicines')!;
      medicineJsonList.add(newMedicineJson);
    }
    sharedUser.setStringList('medicines', medicineJsonList);
  }

//get data stored in local storage and put it in a medicineList list
  Future makeMedicineList() async {
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    List<String>? jsonList = sharedUser.getStringList('medicines');
    List<Medicine> prefList = [];

    if (jsonList == null) {
      return;
    } else {
      for (String jsonMedicine in jsonList) {
        dynamic userMap = jsonDecode(jsonMedicine);
        Medicine tempMedicine = Medicine.fromJson(userMap);
        prefList.add(tempMedicine);
      }
      //state update
      medicineList!.add(prefList);
    }
  }

  void dispose() {
    medicineList!.close();
  }
}
