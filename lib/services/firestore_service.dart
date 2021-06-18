import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugasbesar/models/inventory_model.dart';
import 'package:tugasbesar/models/stock_model.dart';

import '../sign_in.dart';

class FirestoreService {
  CollectionReference _dbinven =
      FirebaseFirestore.instance.collection('inventorys');
  CollectionReference _dbstok = FirebaseFirestore.instance.collection('stocks');
  //crud inventory
  Future<void> saveInventory(InventoryModel inventory) {
    return _dbinven.doc(inventory.inventoryId).set(inventory.toMap());
  }

  Stream<List<InventoryModel>> getInventory() {
    return _dbinven.snapshots().map((snapshot) => snapshot.docs
        .map((document) => InventoryModel.fromFirestore(document.data()))
        .toList());
  }

  Future<void> deleteInventory(String inventoryId) {
    return _dbinven.doc(inventoryId).delete();
  }

  //crud stock
  Future<void> saveStock(StockModel stock) {
    return _dbstok.doc(stock.stockId).set(stock.toMap());
  }

  Stream<List<StockModel>> getStock() {
    return _dbstok.where('idUser', isEqualTo: uid).snapshots().map((snapshot) =>
        snapshot.docs
            .map((document) => StockModel.fromFirestore(document.data()))
            .toList());
  }

  Future<void> deleteStock(String stockId) {
    return _dbstok.doc(stockId).delete();
  }
}
