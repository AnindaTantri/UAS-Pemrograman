import 'package:flutter/material.dart';
import 'package:tugasbesar/inventory.dart';
import 'package:tugasbesar/models/inventory_model.dart';
import 'package:provider/provider.dart';
import 'providers/inventory_provider.dart';

class EditInventory extends StatefulWidget {
  Inventory inventory;
  final String idInventory;
  final String namaBarang;
  final String kode;
  final String kategori;
  final String keterangan;

  EditInventory(this.idInventory, this.namaBarang, this.kode, this.kategori,
      this.keterangan);
  @override
  _EditInventoryState createState() => _EditInventoryState(this.idInventory,
      this.namaBarang, this.kode, this.kategori, this.keterangan);
}

class _EditInventoryState extends State<EditInventory> {
  TextEditingController idInventoryController = TextEditingController();
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController kodeController = TextEditingController();
  TextEditingController kategoriController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  String check;
  @override
  void dispose() {
    namaBarangController.dispose();
    kodeController.dispose();
    kategoriController.dispose();
    keteranganController.dispose();
    super.dispose();
  }

  _EditInventoryState(String idInventory, String namaBarang, String kode,
      String kategori, String keterangan) {
    if (namaBarang != null) {
      idInventoryController.text = idInventory;
      kodeController.text = kode;
      namaBarangController.text = namaBarang;
      kategoriController.text = kategori;
      keteranganController.text = keterangan;
      check = "a";
    } else {
      check = "nol";
    }
  }
  @override
  void initState() {
    if (check == "nol") {
      namaBarangController.text = "";
      kodeController.text = "";
      kategoriController.text = "";
      keteranganController.text = "";
      new Future.delayed(Duration.zero, () {
        final inventoryProvider =
            Provider.of<InventoryProvider>(context, listen: false);
        inventoryProvider.loadValues(
          idInventoryController.text,
          namaBarangController.text,
          kodeController.text,
          kategoriController.text,
          keteranganController.text,
        );
      });
    } else {
      new Future.delayed(Duration.zero, () {
        final inventoryProvider =
            Provider.of<InventoryProvider>(context, listen: false);
        inventoryProvider.loadValues(
          idInventoryController.text,
          namaBarangController.text,
          kodeController.text,
          kategoriController.text,
          keteranganController.text,
        );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inventoryProvider = Provider.of<InventoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Inventory'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Text(
              'Pendataan Barang',
              style: TextStyle(
                letterSpacing: 2,
                wordSpacing: 3,
                height: 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: kodeController,
              decoration: new InputDecoration(
                hintText: "masukkan kode barang",
                labelText: "Kode",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              onChanged: (value) {
                inventoryProvider.changekode(value);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: namaBarangController,
              decoration: new InputDecoration(
                hintText: "masukan nama barang",
                labelText: "Nama Barang",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              onChanged: (value) {
                inventoryProvider.changeNamaBarang(value);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: kategoriController,
              decoration: new InputDecoration(
                hintText: "masukan kategori barang",
                labelText: "Kategori",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              onChanged: (value) {
                inventoryProvider.changeKategori(value);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: keteranganController,
              decoration: new InputDecoration(
                hintText: "masukan keterangan",
                labelText: "Keterangan",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              onChanged: (value) {
                inventoryProvider.changeKeterangan(value);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                inventoryProvider.insertInventory(check);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            (widget.inventory != null)
                ? ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      inventoryProvider
                          .deleteInventory(idInventoryController.text);
                      Navigator.of(context).pop();
                    },
                    child: Text('Delete'),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
