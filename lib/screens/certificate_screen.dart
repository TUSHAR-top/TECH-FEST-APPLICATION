import 'package:flutter/material.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

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
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                'CERTIFICATES',
                style: TextStyle(letterSpacing: 1),
              ),
              background: Stack(children: [
                Image.asset(
                  width: MediaQuery.of(context).size.width,
                  'assets/images/certify.jpeg',
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
          delegate: SliverChildBuilderDelegate(childCount: 3, (context, index) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          fit: BoxFit.contain,
                          image:
                              AssetImage('assets/images/certificate2.jpeg'))),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 55),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ),
                Positioned(
                  right: 60,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.download,
                        color: Colors.white,
                      )),
                ),

                // Positioned(
                //     left: 25,
                //     bottom: 40,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: const [
                //         Text(
                //           'certificate',
                //           style: TextStyle(color: Colors.white, fontSize: 25),
                //         ),
                //         Text('coming soon!!!',
                //             style: TextStyle(color: Colors.white, fontSize: 18))
                //       ],
                //     )),
              ],
            );
          }),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 150,
          ),
        )
      ]),
    );
  }
}
