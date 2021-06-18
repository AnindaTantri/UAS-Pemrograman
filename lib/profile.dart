import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'Login.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                imageUrl,
              ),
              radius: 60,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 20),
            Text(
              'EMAIL',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              email,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), ModalRoute.withName('/'));
              },
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
            )
          ],
        ),
      ),
    );
  }
}
