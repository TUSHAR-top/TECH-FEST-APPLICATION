import 'package:fest/data/data.dart';
import 'package:fest/screens/event_description.dart';
import 'package:fest/screens/see_all.dart';
import 'package:flutter/material.dart';

class EventCategories extends StatelessWidget {
  EventCategories({super.key});

  final List<String> imageNames = [
    'valowars',
    'quiz',
    'funrun',
    'quickfire',
    'gamenight'
  ];
  final List<String> techFest = [
    'bigdata',
    'cyber',
    'entrepreneur',
    'ethical',
    'hackathon',
    'ideogram',
    'programming',
    'remix',
    'space',
    'webd',
    'webinar',
    'workshop'
  ];

  final List<String> culturalFest = [
    'ashvamedha',
    // 'dance',
    // 'kalautsav',
    // 'mufe',
    'multicultural',
    'musicfest',
    'openmic',
    'photography',
    'tasteofculture'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(200),
      //   child: AppBar(
      //     shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(40),
      //       bottomRight: Radius.circular(40),
      //     )),
      //     centerTitle: true,
      //     elevation: 0,
      //     backgroundColor: Colors.purple,
      //     title: const Text(
      //       'EVENT CATEGORIES',
      //       style: TextStyle(fontSize: 25),
      //     ),
      //   ),
      // ),
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
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
                  'ONGOING EVENTS',
                  style: TextStyle(letterSpacing: 2),
                ),
                background: Stack(children: [
                  Image.asset(
                    width: MediaQuery.of(context).size.width,
                    'assets/images/eventBanner.jpeg',
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
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'TECHNICAL',
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                SeeAll('TECHNICAL', techFest)));
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 290,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: techFest.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => EventDescription(
                                      techFest[index], technical[index]))),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Material(
                                elevation: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  height: 120,
                                  width: 220,
                                  decoration: BoxDecoration(
                                      color: Colors.purple[100],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Hero(
                                      tag: '${techFest[index]}.jpeg',
                                      child: Container(
                                        height: 180,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            // color: Colors.green,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/images/${techFest[index]}.jpeg'))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      techFest[index].toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                        'Starts at: ${TimeOfDay.now().format(context)}'),
                                    Text(
                                        'Ends at: ${TimeOfDay.now().format(context)}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ]),
          ),
          // SliverToBoxAdapter(child: SizedBox(height: 0)),
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'CULTURAL',
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                SeeAll('CULTURAL', culturalFest)));
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 290,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: culturalFest.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => EventDescription(
                                      culturalFest[index], cultural[index]))),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Material(
                                elevation: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  height: 120,
                                  width: 220,
                                  decoration: BoxDecoration(
                                      color: Colors.purple[100],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Hero(
                                      tag: '${culturalFest[index]}.jpeg',
                                      child: Container(
                                        height: 180,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            // color: Colors.green,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/images/${culturalFest[index]}.jpeg'))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      culturalFest[index].toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                        'Start Time: ${TimeOfDay.now().format(context)}'),
                                    Text(
                                        'End TIme: ${TimeOfDay.now().format(context)}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'SPORTS',
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                SeeAll('SPORTS', imageNames)));
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 290,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => EventDescription(
                                      imageNames[index], sports[index]))),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Material(
                                elevation: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  height: 120,
                                  width: 220,
                                  decoration: BoxDecoration(
                                      color: Colors.purple[100],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Hero(
                                      tag: '${imageNames[index]}.jpeg',
                                      child: Container(
                                        height: 180,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            // color: Colors.green,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/images/${imageNames[index]}.jpeg'))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      imageNames[index].toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                        'Start Time: ${TimeOfDay.now().format(context)}'),
                                    Text(
                                        'End TIme: ${TimeOfDay.now().format(context)}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
