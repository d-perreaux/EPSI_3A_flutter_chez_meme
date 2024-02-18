import 'package:flutter/material.dart';
import 'package:chez_meme/utility/providerUser.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    String name = user?.name ?? "";
    bool isAdmin = user?.role ?? false;

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mon compte",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informations utilisateur",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Nom :"),
                    subtitle: Text(name),
                  ),
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text("Rôle :"),
                    subtitle: Text(isAdmin ? "Administrateur" : "Utilisateur"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
