import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_templates/common/utils/colors.dart';
import 'package:flutter_templates/components/doctor_card.dart';
import 'package:flutter_templates/features/screens/screen/disasterscreen.dart';

class HomePage extends ConsumerStatefulWidget {
  static const routeName = '/home-page';
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  static const List<String> imgList = [
    'https://www.amnh.org/var/ezflow_site/storage/images/media/amnh/images/explore/ology-images/super-article-imagery/earthquakes-tremors-from-below-imagery/earthquake-lead/4604593-3-eng-US/earthquake-lead.jpg',
    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1240w,f_auto,q_auto:best/newscms/2018_49/2669406/181204-japan-tsunami-earthquake-cs-920a.jpg',
    'https://www.thoughtco.com/thmb/2pcWRfKhjLASY8r-biEF8q08fII=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-453568557-56b6a6133df78c0b135b1c3a.jpg',
    'https://assets.telegraphindia.com/telegraph/2020/Dec/1607637451_suicide.jpg'
  ];
  static const List<String> txtList = [
    'EarthQuake',
    'Tsunami',
    'Murder',
    'Suicide'
  ];
  static const List<IconData> icon = [
    Icons.home,
    Icons.dangerous,
    Icons.wallet_giftcard,
    Icons.attach_money_outlined
  ];
  static const List<String> text = [
    'HomeCrime',
    'Disaster',
    'CreditScore',
    'Donate'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   leading: IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.person_outline_rounded,
        //         color: Colors.black,
        //       )),
        //   actions: [
        //     IconButton(
        //         onPressed: () {},
        //         icon: Icon(
        //           Icons.notifications,
        //           color: Colors.black,
        //         ))
        //   ],
        // ),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                // Column(
                //   children: [
                //     Container(
                //       width: MediaQuery.of(context).size.width,
                //       height: 30,
                //       child: CarouselSlider(
                //         items: txtList
                //             .map((item) => Text(
                //                   item,
                //                   style: TextStyle(
                //                       fontWeight: FontWeight.bold),
                //                 ))
                //             .toList(),
                //         options: CarouselOptions(
                //             autoPlay: false,
                //             aspectRatio: 2.0,
                //             enlargeCenterPage: true,
                //             viewportFraction: 1),
                //       ),
                //     ),
                //     Container(
                //       width: MediaQuery.of(context).size.width,
                //       height: 230,
                //       child: CarouselSlider(
                //         items: imgList
                //             .map((item) => GestureDetector(
                //                   child: ClipRRect(
                //                     borderRadius: BorderRadius.circular(20),
                //                     child: Image.network(
                //                       item,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                 ))
                //             .toList(),
                //         options: CarouselOptions(
                //             autoPlay: false,
                //             aspectRatio: 2.0,
                //             enlargeCenterPage: true,
                //             viewportFraction: 1),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: SizedBox(
                      height: 110,
                      child: ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          separatorBuilder: (context, index) => Divider(
                                indent: 16,
                              ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DisasterScreen()));
                              },
                              child: Container(
                                width: 110,
                                height: 40,
                                clipBehavior: Clip.hardEdge,
                                padding: EdgeInsets.only(top: 14),
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            icon[index],
                                            size: 36,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(
                                            height: 14,
                                          ),
                                          Text(
                                            text[index],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Department',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DoctorCard("Share to family ", "Let's rescue from fire",
                  "assets/images/family.png", Colors.green),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DoctorCard(
                  "Medical Department",
                  "Let's move immediately to patient",
                  "assets/images/doctor1.png",
                  Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DoctorCard("Police department", "Let's rescue from fire",
                  "assets/images/police-badge.png", Colors.yellow),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DoctorCard("Disaster department", "Let's rescue from fire",
                  "assets/images/flood.png", Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DoctorCard("Fire department", "Let's rescue from fire",
                  "assets/images/fire-station.png", Colors.orange),
            )
          ],
        ),
      ),
    ));
  }
}
