import 'package:flutter/material.dart';

class ConnectionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
                Text(
                  'Connexion',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/page2');
                  },
                  child: Text('Connexion'),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {

                  },
                  child: Text('Inscription'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}