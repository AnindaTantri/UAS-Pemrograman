import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tugasbesar/inventory.dart';
import 'package:tugasbesar/stock.dart';
import 'providers/inventory_provider.dart';
import 'providers/stock_provider.dart';
import 'services/firestore_service.dart';
import 'Login.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => InventoryProvider()),
        StreamProvider(
          create: (context) => firestoreService.getInventory(),
          initialData: null,
        ),
        ChangeNotifierProvider(create: (context) => StockProvider()),
        StreamProvider(
          create: (context) => firestoreService.getStock(),
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Betterdays',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        routes: {
          routes.stock: (context) => Stock(),
          routes.inventory: (context) => Inventory(),
        },
      ),
    );
  }
}
