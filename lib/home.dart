import 'package:flutter/material.dart';
import 'Login.dart';
import 'sign_in.dart';
import 'profile.dart';
import 'inventory.dart';
import 'stock.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Betterdays'),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/betterdays2.jpeg'),
                //fit: BoxFit.contain,
              )),
              child: Text('Admin Betterdays'),
            ),
            ListTile(
              title: Text('Profile'),
              // onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Inventory'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Inventory(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Stock'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Stock(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/Betterdays.jpg'),
                  //fit: BoxFit.contain,
                ))),
            Text(
              'Selamat Datang',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
