import 'package:flutter/material.dart';
import 'package:tugasbesar/models/stock_model.dart';
import 'package:provider/provider.dart';
import 'package:tugasbesar/stock.dart';
import 'providers/stock_provider.dart';

class EditStock extends StatefulWidget {
  StockModel stock;
  final String stockId;
  final String namaBarang;
  final String stockBarang;
  final String kategori;
  final String namaAdmin;

  EditStock(this.stockId, this.namaBarang, this.namaAdmin, this.stockBarang,
      this.kategori);
  @override
  _EditStockState createState() => _EditStockState(this.stockId,
      this.namaBarang, this.namaAdmin, this.stockBarang, this.kategori);
}

class _EditStockState extends State<EditStock> {
  TextEditingController stockIdController = TextEditingController();
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController stockBarangController = TextEditingController();
  TextEditingController kategoriController = TextEditingController();
  TextEditingController namaAdminController = TextEditingController();
  String check;

  @override
  void dispose() {
    namaBarangController.dispose();
    stockBarangController.dispose();
    kategoriController.dispose();
    namaAdminController.dispose();
    super.dispose();
  }

  _EditStockState(String stockId, String namaBarang, String namaAdmin,
      String stockBarang, String kategori) {
    if (namaBarang != null) {
      stockIdController.text = stockId;
      namaBarangController.text = namaBarang;
      namaAdminController.text = namaAdmin;
      stockBarangController.text = stockBarang;
      kategoriController.text = kategori;
      check = "a";
    } else {
      check = "nol";
    }
  }
  @override
  void initState() {
    if (check == "nol") {
      //New Record
      namaBarangController.text = "";
      stockBarangController.text = "";
      kategoriController.text = "";
      namaAdminController.text = "";
    } else {
      // stockIdController.text = widget.stock.stockId;
      // namaBarangController.text = widget.stock.namaBarang;
      // stockBarangController.text = widget.stock.stockBarang;
      // kategoriController.text = widget.stock.kategori;
      // namaAdminController.text = widget.stock.namaAdmin;

      new Future.delayed(Duration.zero, () {
        final stockProvider =
            Provider.of<StockProvider>(context, listen: false);
        stockProvider.loadValues(
            stockIdController.text,
            namaAdminController.text,
            namaBarangController.text,
            stockBarangController.text,
            kategoriController.text);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Stock'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Text(
              'Isi Stock Barang dengan TELITI!!',
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
              controller: namaBarangController,
              decoration: new InputDecoration(
                hintText: "masukan nama barang",
                labelText: "Nama Barang",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              onChanged: (value) {
                stockProvider.changenamaBarang(value);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: stockBarangController,
              decoration: new InputDecoration(
                hintText: "masukan stok barang",
                labelText: "Stock Barang",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              onChanged: (value) {
                stockProvider.changeStockBarang(value);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: kategoriController,
              decoration: new InputDecoration(
                hintText: "masukan kategori",
                labelText: "Kategori",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              onChanged: (value) {
                stockProvider.changeKategori(value);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: namaAdminController,
              decoration: new InputDecoration(
                hintText: "masukan nama Anda",
                labelText: "Nama Admin",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              onChanged: (value) {
                stockProvider.changenamaAdmin(value);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                stockProvider.insertStock(check);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            (widget.stock == null)
                ? ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      stockProvider.deletestoku(stockIdController.text);
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
