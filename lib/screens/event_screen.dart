import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  final String imageName;
  const EventScreen(this.imageName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: CustomScrollView(slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            floating: false,
            backgroundColor: Colors.purple,
            expandedHeight: MediaQuery.of(context).size.height * 0.28,
            actions: [
              DropdownButton(
                underline: Container(),
                items: const [
                  DropdownMenuItem(
                    value: 'certify',
                    child: Text('Issue certificates'),
                  )
                ],
                onChanged: (itemIdentifier) {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  imageName.toUpperCase(),
                  style: const TextStyle(letterSpacing: 2),
                ),
                background: Stack(children: [
                  Image.asset(
                    width: MediaQuery.of(context).size.width,
                    'assets/images/$imageName.jpeg',
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
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Registration Fees',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          Text(
                            '₹ 200',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ],
                      ),
                      // ElevatedButton(
                      //     onPressed: () {},
                      //     child: const Text('Issue certificates'))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Starts at',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      Text(
                        '30-09-2022 11:00 am',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'ends at',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      Text(
                        '30-09-2022 17:00 pm',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SelectableText(
                    'Event Description',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  const SelectableText(
                    textAlign: TextAlign.justify,
                    'A hackathon is an event that brings together experts and creates a collaborative environment for solving a certain problem. While the majority of hackathons revolve around computer programming and IT, many other industries follow suit. Today, it is possible to find HR hackathons, economics hackathons, music hackathons, and the like. The word hackathon is a combination of hack and marathon. So, essentially it is a marathon for hackers.  But, in this case, hackers are exploratory computer programmers.',
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Elegibility',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const SelectableText('Open for all'),
                  Container(
                    height: 200,
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
