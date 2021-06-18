import 'package:flutter/material.dart';
import 'package:tugasbesar/services/firestore_service.dart';
import 'package:tugasbesar/sign_in.dart';
import 'package:uuid/uuid.dart';
import 'package:tugasbesar/models/stock_model.dart';

class StockProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _stockId;
  String _stockBarang;
  String _namaBarang;
  String _kategori;
  String _namaAdmin;
  String _idUser;
  var uuid = Uuid();

  //getter
  String get stockId => _stockId;
  String get stockBarang => _stockBarang;
  String get namaBarang => _namaBarang;
  String get kategori => _kategori;
  String get namaAdmin => _namaAdmin;
  String get idUser => _idUser;

  //setter
  changeStockBarang(String value) {
    _stockBarang = value;
    notifyListeners();
  }

  changenamaBarang(String value) {
    _namaBarang = value;
    notifyListeners();
  }

  changeKategori(String value) {
    _kategori = value;
    notifyListeners();
  }

  changenamaAdmin(String value) {
    _namaAdmin = value;
    notifyListeners();
  }

  changeIduser() {
    _idUser = uid;
    notifyListeners();
  }

  //read
  loadValues(String stockId, String namaBarang, String namaAdmin,
      String stockBarang, String kategori) {
    _stockId = stockId;
    _stockBarang = stockBarang;
    _namaBarang = namaBarang;
    _kategori = kategori;
    _namaAdmin = namaAdmin;
  }

  //insert&update
  insertStock(String a) {
    print(_stockId);
    if (a == "nol") {
      //insert
      var newStock = StockModel(
        stockId: uuid.v4(),
        stockBarang: stockBarang,
        namaBarang: namaBarang,
        kategori: kategori,
        namaAdmin: namaAdmin,
        idUser: uid,
      );
      firestoreService.saveStock(newStock);
    } else {
      //update
      var updateStock = StockModel(
        stockId: _stockId,
        stockBarang: _stockBarang,
        namaBarang: _namaBarang,
        kategori: _kategori,
        namaAdmin: _namaAdmin,
        idUser: uid,
      );
      firestoreService.saveStock(updateStock);
    }
  }

  //delete
  deletestoku(String stockId) {
    firestoreService.deleteStock(stockId);
  }
}
