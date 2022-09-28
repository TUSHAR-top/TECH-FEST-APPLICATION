import 'package:flutter/material.dart';

class UpcomingEvents extends StatelessWidget {
  UpcomingEvents({super.key});
  final List<String> eventName = [
    'Chitrakala',
    'Hackathon',
    'Community Coding',
    'Tennis Mania'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.purple,
      //   title: Text('UPCOMING EVENTS'),
      //   ,
      // ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          centerTitle: true,
          pinned: true,
          floating: false,
          backgroundColor: Colors.purple,
          // automaticallyImplyLeading: false,
          expandedHeight: MediaQuery.of(context).size.height * 0.28,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                'UPCOMING EVENTS',
                style: TextStyle(letterSpacing: 1.5),
              ),
              background: Stack(children: [
                Image.asset(
                  width: MediaQuery.of(context).size.width,
                  'assets/images/upcomingEvents1.jpeg',
                  colorBlendMode: BlendMode.softLight,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.purple, Colors.transparent]),
                  ),
                )
              ])),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 4, (context, index) {
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/upcoming${index + 1}.jpeg'))),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ),
                Positioned(
                    left: 25,
                    bottom: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventName[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                        const Text('coming soon!!!',
                            style: TextStyle(color: Colors.white, fontSize: 18))
                      ],
                    )),
              ],
            );
          }),
        )
      ]),
    );
  }
}
