import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/user_account_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.purple),
          accountEmail: Text('abhay95425@gmail.com'),
          accountName: Text('Abhay Srivastava'),
          currentAccountPicture: Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(37)),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
              radius: 20,
              backgroundColor: Colors.purple,
            ),
          ),
        ),
        Expanded(
          child: Wrap(
            runSpacing: 10,
            direction: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const ListTile(
                    minLeadingWidth: 20,
                    leading: Icon(Icons.home, color: Colors.black),
                    title: Text('Home', style: TextStyle(fontSize: 18))),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UserAccountScreen()));
                },
                child: const ListTile(
                    minLeadingWidth: 20,
                    leading: Icon(Icons.person, color: Colors.black),
                    title: Text('My Account', style: TextStyle(fontSize: 18))),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UserAccountScreen()));
                },
                child: const ListTile(
                    minLeadingWidth: 20,
                    leading: Icon(Icons.person, color: Colors.black),
                    title: Text('Scheduled Events',
                        style: TextStyle(fontSize: 18))),
              ),
              const ListTile(
                  minLeadingWidth: 20,
                  leading: Icon(CupertinoIcons.question_circle_fill,
                      size: 24, color: Colors.black),
                  title: Text('Feedback', style: TextStyle(fontSize: 18))),
              const ListTile(
                minLeadingWidth: 20,
                leading: Icon(Icons.info, color: Colors.black),
                title: Text('About', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
        Column(
          children: [
            const Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const ListTile(
                minLeadingWidth: 20,
                leading: Icon(Icons.logout, color: Colors.black),
                title: Text('Sign Out', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
