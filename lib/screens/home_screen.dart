import 'package:fest/screens/certificate_screen.dart';
import 'package:fest/screens/organise_eventscreen.dart';
import 'package:fest/screens/upcoming_events_screen.dart';
import 'package:fest/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'event_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontFamily: 'Billabong', fontSize: 45, letterSpacing: 2),
        title: const Text(
          'Fiesta',
          // style: TextStyle(
          //     color: Colors.purple,
          //     fontFamily: 'Billabong',
          //     fontWeight: FontWeight.w500,
          //     letterSpacing: 3),
        ),
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Container(
            // color: Colors.amber,
            height: 200,
            child: PageView.builder(
                onPageChanged: (int index) {
                  _currentPageNotifier.value = index;
                  // _pageController.animateTo(2,
                  //     duration: Duration(seconds: 3), curve: Curves.linear);
                },
                controller: _pageController,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/banner${index + 1}.jpeg'))),
                  );
                }),
          ),
          CirclePageIndicator(
            borderWidth: 2,
            // selectedBorderColor: Colors.black,
            borderColor: Colors.black,
            size: 8,
            selectedSize: 10,
            dotColor: Colors.white,
            selectedDotColor: Colors.purple,
            itemCount: 4,
            currentPageNotifier: _currentPageNotifier,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EventCategories())),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Material(
                    shadowColor: Colors.purple,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // margin: const EdgeInsets.only(left: 20, top: 20),
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.purple[900],
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/explore.jpeg'))),
                          height: 200,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                          // margin: const EdgeInsets.only(left: 20, top: 20),
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          height: 200,
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text(
                              'EXPLORE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UpcomingEvents())),
                  child: Material(
                    shadowColor: Colors.purple,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // margin: const EdgeInsets.only(left: 20, top: 20),
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/upcomingEvents.jpeg')),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.purple[900],
                          ),
                          height: 200,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                          // margin: const EdgeInsets.only(left: 20, top: 20),
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          height: 200,
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 15, left: 20),
                            child: Text(
                              'UPCOMING EVENTS',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OrganiseEvent())),
                  child: Material(
                    shadowColor: Colors.purple,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/organiseEvents.jpeg')),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.purple[900],
                          ),
                          height: 200,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          height: 200,
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 15, left: 20),
                            child: Text(
                              'ORGANISE EVENT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Material(
                  shadowColor: Colors.purple,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CertificateScreen())),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/certificates.jpeg')),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.purple[900],
                          ),
                          height: 200,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          height: 200,
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 20, left: 2),
                            child: Text(
                              'CERTIFICATIONS',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
