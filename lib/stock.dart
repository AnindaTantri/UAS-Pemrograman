import 'package:flutter/material.dart';
import 'package:tugasbesar/edit_stock.dart';
import 'package:provider/provider.dart';
import 'package:tugasbesar/stock.dart';
import 'package:tugasbesar/providers/stock_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugasbesar/sign_in.dart';

import 'models/stock_model.dart';

class Stock extends StatefulWidget {
  static String routeName = '/stock';
  final StockModel stock;

  Stock([this.stock]);
  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<Stock> {
  Widget build(BuildContext context) {
    final stock = Provider.of<List<StockModel>>(context);
    final stockpropider = Provider.of<StockProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Stock'),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        EditStock(null, null, null, null, null),
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('stocks')
                .where('idUser', isEqualTo: uid)
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Text('tunggu')
                  : ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot data = snapshot.data.docs[index];

                        return ListTile(
                          title: Text(data['namaBarang']),
                          trailing: GestureDetector(
                            child: Icon(Icons.delete),
                            onTap: () {
                              stockpropider.deletestoku(data.id);
                              Navigator.of(context).pop();
                            },
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditStock(
                                  data.id.toString(),
                                  data['namaBarang'].toString(),
                                  data['stockBarang'].toString(),
                                  data['Kategori'].toString(),
                                  data['namaAdmin'].toString(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
            }));
  }
}
