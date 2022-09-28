import 'package:fest/screens/participate_event_screen.dart';
import 'package:flutter/material.dart';

class EventDescription extends StatelessWidget {
  final String imageName;
  final String description;
  const EventDescription(this.imageName, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            floating: false,
            snap: false,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
            backgroundColor: Colors.purple,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(imageName.toUpperCase()),
                background: Stack(children: [
                  Hero(
                    tag: '$imageName.jpeg',
                    child: Image.asset(
                      width: MediaQuery.of(context).size.width,
                      'assets/images/$imageName.jpeg',
                      colorBlendMode: BlendMode.softLight,
                      fit: BoxFit.cover,
                    ),
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
                      ElevatedButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PartcipateEventScreen(imageName))),
                          child: const Text('Apply'))
                    ],
                  ),
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
                  SelectableText(description),
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
        ],
      ),
    );
  }
}
