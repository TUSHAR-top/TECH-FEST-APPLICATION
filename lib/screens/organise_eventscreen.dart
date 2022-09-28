import 'package:fest/screens/create_event.dart';
import 'package:fest/screens/event_screen.dart';
import 'package:flutter/material.dart';

class OrganiseEvent extends StatelessWidget {
  const OrganiseEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ORGANISED EVENTS'),
          elevation: 0,
          backgroundColor: Colors.purple,
        ),
        backgroundColor: Colors.grey[200],
        body: GridView.builder(
          itemCount: 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreateEvent()));
                  return;
                }
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EventScreen('hackathon')));
                return;
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  child: Container(
                    // margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: (index != 0)
                            ? const DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage('assets/images/hackathon.jpeg'))
                            : null,
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: (index == 0)
                        ? const Icon(
                            Icons.add,
                            size: 40,
                            color: Colors.black,
                          )
                        : null,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
