import 'package:fest/screens/event_categories.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
              child: AppBar(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.purple,
                title: const Text(
                  'CREATE EVENT',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.white,
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.25,
          //   decoration: const BoxDecoration(
          //     color: Colors.purple,
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(40),
          //       bottomRight: Radius.circular(40),
          //     ),
          //   ),
          // ),
          Positioned(
            top: 110,
            child: SingleChildScrollView(
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'EVENT TITLE',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextFormField(
                          enabled: true,
                          decoration: const InputDecoration(
                              hintText: 'eg. Poster Making',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0)),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'ADD PHOTO',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextFormField(
                          enabled: true,
                          decoration: const InputDecoration(
                              hintText: 'eg. Poster Making',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0)),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'EVENT DETAIL',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextFormField(
                          maxLines: 2,
                          maxLength: 300,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(height: 1, fontSize: 14),
                              hintText: 'Event Description',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0)),
                        ),
                        const SizedBox(height: 0),
                        const Text(
                          'REGISTRATION FEES',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextFormField(
                          enabled: true,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'eg. 100/-',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0)),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'EVENT DATE AND TIME',
                          style: TextStyle(
                              decorationThickness: 1.5,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Start',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100));
                                if (picked != null) {
                                  setState(() {
                                    startDate = picked;
                                  });
                                }
                              },
                              child: Text(
                                  DateFormat('dd/MM/y')
                                      .format(startDate)
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ),
                            GestureDetector(
                              onTap: () async {
                                final pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                if (pickedTime != null) {
                                  setState(() {
                                    startTime = pickedTime;
                                  });
                                }
                              },
                              child: Text(startTime.format(context),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'End',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100));
                                if (picked != null) {
                                  setState(() {
                                    endDate = picked;
                                  });
                                }
                              },
                              child: Text(
                                  DateFormat('dd/MM/y')
                                      .format(endDate)
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ),
                            GestureDetector(
                              onTap: () async {
                                final pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                if (pickedTime != null) {
                                  setState(() {
                                    endTime = pickedTime;
                                  });
                                }
                              },
                              child: Text(endTime.format(context),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            )
                          ],
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: SizedBox(
                            height: 40,
                            width: 300,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.purple),
                                onPressed: () {},
                                child: const Text(
                                  'CREATE EVENT',
                                  style: TextStyle(fontSize: 17),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
