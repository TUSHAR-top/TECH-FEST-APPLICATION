import 'package:flutter/material.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey[200],
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 120),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Abhay',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 6),
                        SizedBox(
                            width: 152,
                            child:
                                Text('Interested in Hackathon, Data Science'))
                      ],
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                      radius: 35,
                      backgroundColor: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            elevation: 0,
            pinned: true,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 90,
                    width: (MediaQuery.of(context).size.width - 50) / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.settings_outlined),
                        Text('Settings')
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 90,
                    width: (MediaQuery.of(context).size.width - 50) / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.settings_outlined),
                        Text('Payments')
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 90,
                    width: (MediaQuery.of(context).size.width - 50) / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.settings_outlined),
                        Text('Settings')
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 90,
                    width: (MediaQuery.of(context).size.width - 50) / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [Icon(Icons.payment), Text('Payments')],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: const Text('Your Interests'),
                trailing: const Icon(
                  Icons.arrow_right_outlined,
                ),
                tileColor: Colors.white,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              height: 270,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: Column(
                children: const [
                  ListTile(
                    title: Text('Scheduled events'),
                    trailing: Icon(
                      Icons.arrow_right_outlined,
                    ),
                  ),
                  Divider(height: 0),
                  ListTile(
                    title: Text('Past attended events'),
                    trailing: Icon(
                      Icons.arrow_right_outlined,
                    ),
                  ),
                  Divider(height: 0),
                  ListTile(
                    title: Text('Organised event'),
                    trailing: Icon(
                      Icons.arrow_right_outlined,
                    ),
                  ),
                  Divider(height: 0),
                  ListTile(
                    title: Text('Issued Certificates'),
                    trailing: Icon(
                      Icons.arrow_right_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: const Text('About'),
                trailing: const Icon(
                  Icons.arrow_right_outlined,
                ),
                tileColor: Colors.white,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: const Text('Send feedback'),
                trailing: const Icon(
                  Icons.arrow_right_outlined,
                ),
                tileColor: Colors.white,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: const Text('Rate us on play store'),
                trailing: const Icon(
                  Icons.arrow_right_outlined,
                ),
                tileColor: Colors.white,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: const Text('Log out'),
                trailing: const Icon(
                  Icons.arrow_right_outlined,
                ),
                tileColor: Colors.white,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(height: 100),
          )
        ],
      ),
    );
  }
}
