import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugasbesar/edit_inventory.dart';
import 'package:tugasbesar/models/inventory_model.dart';
import 'package:tugasbesar/providers/inventory_provider.dart';
import 'package:tugasbesar/sign_in.dart';

class Inventory extends StatefulWidget {
  static String routeName = '/inventory';
  final Inventory inventory;

  Inventory([this.inventory]);
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    final inventory = Provider.of<List<Inventory>>(context);
    final inventoryProvider = Provider.of<InventoryProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Inventorys'),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        EditInventory(null, null, null, null, null),
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
                .collection('inventorys')
                .where('idUser', isEqualTo: uid)
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Text('PLease Wait')
                  : ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot data = snapshot.data.docs[index];
                        return ListTile(
                          title: Text(data['kode']),
                          trailing: Text(data['namaBarang']),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditInventory(
                                  data.id.toString(),
                                  data['namaBarang'].toString(),
                                  data['jenisMember'].toString(),
                                  data['nik'],
                                  data['umur'],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
              Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
