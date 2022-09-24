import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pay/pay.dart';

class DonationScreen extends ConsumerStatefulWidget {
  static const routeName = '/donation-screen';
  const DonationScreen({super.key});

  @override
  ConsumerState<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends ConsumerState<DonationScreen> {
  final _paymentItems = <PaymentItem>[];
  List<String> depart = [
    'Taru foundation',
    'sadey sadey',
    'paul fondation'
        'FCHM',
    'Prajwal foundation',
    'Siddhivinayak travels',
  ];
  List<String> img = [
    "assets/images/fire-station.png",
    "assets/images/doctor1.png",
    "assets/images/police-badge.png",
    "assets/images/flood.png",
    "assets/images/flood.png",
    "assets/images/police-badge.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donations for organizat'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 5, right: 5, left: 10),
                            child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Column(children: [
                                  ListTile(
                                    leading:
                                        Image(image: AssetImage(img[index])),
                                    title: Text(depart[index]),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Text(
                                          'Last Contacted',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Need for Blood'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GooglePayButton(
                                    paymentConfigurationAsset: 'gpay.json',
                                    paymentItems: _paymentItems,
                                    width: 200,
                                    height: 50,
                                    type: GooglePayButtonType.pay,
                                    margin: const EdgeInsets.only(top: 15.0),
                                    onPaymentResult: (data) {
                                      print(data);
                                    },
                                    loadingIndicator: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ])));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
