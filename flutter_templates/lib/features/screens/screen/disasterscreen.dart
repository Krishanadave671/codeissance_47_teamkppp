import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates/features/screens/screen/info_screen.dart';
import 'package:flutter_templates/features/screens/screen/reportformscreen.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';

class DisasterScreen extends ConsumerStatefulWidget {
  static const routeName = '/disaster-screen';

  @override
  ConsumerState<DisasterScreen> createState() => _DisasterScreenState();
}

class _DisasterScreenState extends ConsumerState<DisasterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Fire department",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://static.toiimg.com/thumb/msid-90409563,imgsize-109826,width-400,resizemode-4/90409563.jpg",
                      fit: BoxFit.cover,
                    )),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.info), text: "info"),
                      Tab(icon: Icon(Icons.lightbulb_outline), text: "Report "),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: // tab page,
              TabBarView(
            children: [
              Infoscreen(),
              // Container(
              //   child: Center(
              //     child: Text("Report"),
              //   ),
              // ),
              ReportFormScreen()
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
