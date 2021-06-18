class StockModel {
  final String stockId;
  final String stockBarang;
  final String namaBarang;
  final String kategori;
  final String namaAdmin;
  final String idUser;

  StockModel(
      {this.stockId,
      this.stockBarang,
      this.namaBarang,
      this.kategori,
      this.namaAdmin,
      this.idUser});

  Map<String, dynamic> toMap() {
    return {
      'stockId': stockId,
      'stockBarang': stockBarang,
      'namaBarang': namaBarang,
      'Kategori': kategori,
      'namaAdmin': namaAdmin,
      'idUser': idUser,
    };
  }

  StockModel.fromFirestore(Map<String, dynamic> firestore)
      : stockId = firestore['stockId'],
        stockBarang = firestore['stockBarang'],
        namaBarang = firestore['namaBarang'],
        kategori = firestore['Kategori'],
        namaAdmin = firestore['namaAdmin'],
        idUser = firestore['idUser'];
}
