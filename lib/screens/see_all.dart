import 'package:fest/data/data.dart';
import 'package:flutter/material.dart';

import 'event_description.dart';

class SeeAll extends StatelessWidget {
  final String categoryName;
  final List<String> imageNames;
  const SeeAll(this.categoryName, this.imageNames, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: false,
            floating: true,
            snap: false,
            backgroundColor: Colors.purple,
            title: Text(categoryName.toString().toUpperCase()),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.7, crossAxisCount: 2),
            delegate: SliverChildBuilderDelegate(
              childCount: imageNames.length,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EventDescription(
                            imageNames[index], technical[index]))),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Material(
                          elevation: 10,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: Container(
                            height: 120,
                            width: 220,
                            decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 160,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    color: Colors.green,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/${imageNames[index]}.jpeg'))),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                imageNames[index],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
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
                // return Padding(
                //   padding: const EdgeInsets.all(10),
                //   child: Material(
                //     color: Colors.purple[100],
                //     elevation: 5,
                //     child: Column(
                //       children: [
                //         Container(
                //           height: 140,
                //           decoration: BoxDecoration(
                //               image: DecorationImage(
                //                   fit: BoxFit.contain,
                //                   image: AssetImage(
                //                       'assets/images/${imageNames[index]}.jpeg'))),
                //         ),
                //         const Text('Event Name'),
                //         const Text('250 Rs.'),
                //         const Text('10:30 - 17:30')
                //       ],
                //     ),
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
