import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCreditScore extends ConsumerStatefulWidget {
  const MyCreditScore({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyCreditScoreState();
}

class _MyCreditScoreState extends ConsumerState<MyCreditScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        leading: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage("assets/images/police-badge.png"),
                        width: 50,
                        fit: BoxFit.fitHeight,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "My Credit Score",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.white, width: 5)),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        const Text(
                          "Current Score: ",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                        Text(
                          "100",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "About the system",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "1) Each positive Review adds a credit to your profile\n2) Each negative review costs a credit point.\n3) Credit system is a time independent grading system.) ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              // child: Container(
              //   decoration: const BoxDecoration(
              //       color: Color.fromARGB(255, 221, 221, 120),
              //       borderRadius: BorderRadius.all(Radius.circular(20))),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Row(
              //       children: const [
              //         Image(
              //           image: AssetImage("assets/images/speedometer.png"),
              //           width: 40,
              //           fit: BoxFit.fitHeight,
              //         ),
              //         SizedBox(
              //           width: 5,
              //         ),
              //         Expanded(
              //           child: Text(
              //               "Maintain a good credit score to to avail for the incentives and take benefits."),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
