class InventoryModel {
  final String inventoryId;
  final String namaBarang;
  final String kode;
  final String kategori;
  final String keterangan;

  InventoryModel(
      {this.inventoryId,
      this.namaBarang,
      this.kode,
      this.kategori,
      this.keterangan});

  Map<String, dynamic> toMap() {
    return {
      'inventoryId': inventoryId,
      'namaBarang': namaBarang,
      'kode': kode,
      'kategori': kategori,
      'keterangan': keterangan,
    };
  }

  InventoryModel.fromFirestore(Map<String, dynamic> firestore)
      : inventoryId = firestore['inventoryId'],
        namaBarang = firestore['namaBarang'],
        kode = firestore['kode'],
        kategori = firestore['kategori'],
        keterangan = firestore['keterangan'];
}
