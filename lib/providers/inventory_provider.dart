import 'package:flutter/material.dart';
import 'package:tugasbesar/services/firestore_service.dart';
import 'package:uuid/uuid.dart';
import 'package:tugasbesar/models/inventory_model.dart';

class InventoryProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _inventoryId;
  String _namaBarang;
  String _kode;
  String _kategori;
  String _keterangan;

  var uuid = Uuid();

  //getter
  String get namaBarang => _namaBarang;
  String get kode => _kode;
  String get kategori => _kategori;
  String get keterangan => _keterangan;

  //setter
  changeNamaBarang(String value) {
    _namaBarang = value;
    notifyListeners();
  }

  changekode(String value) {
    _kode = value;
    notifyListeners();
  }

  changeKategori(String value) {
    _kategori = value;
    notifyListeners();
  }

  changeKeterangan(String value) {
    _keterangan = value;
    notifyListeners();
  }

  //read
  loadValues(String inventoryId, String namaBarang, String kode,
      String kategori, String keterangan) {
    _inventoryId = inventoryId;
    _namaBarang = namaBarang;
    _kode = kode;
    _kategori = kategori;
    _keterangan = keterangan;
  }

  //insert&update
  insertInventory(String a) {
    print(_inventoryId);
    if (a == "nol") {
      //insert
      var newInventory = InventoryModel(
        inventoryId: uuid.v4(),
        kode: kode,
        namaBarang: namaBarang,
        kategori: kategori,
        keterangan: keterangan,
      );
      firestoreService.saveInventory(newInventory);
    } else {
      //update
      var updateInventory = InventoryModel(
        inventoryId: _inventoryId,
        kode: _kode,
        namaBarang: _namaBarang,
        kategori: _kategori,
        keterangan: _keterangan,
      );
      firestoreService.saveInventory(updateInventory);
    }
  }

  //delete
  deleteInventory(String inventoryId) {
    firestoreService.deleteInventory(inventoryId);
  }
}
