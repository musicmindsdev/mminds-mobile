import 'package:music_minds/config/app_assets.dart';

import '../../../../src/components.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 390.0.h,

            floating: false,
            pinned: true,

            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  margin: EdgeInsets.only(
                      left: 0, right: 0), // Set horizontal margin to 0
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: FlexibleSpaceBar(
                    // title: Text('App Bar Title'),
                    background: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(24.0.r),
                        ),
                        child: Image.asset(
                          'assets/images/image_test.png',
                          fit: BoxFit.cover,
                        )),
                    collapseMode: CollapseMode.parallax,

                  ),
                );
              },
            ),

            // Container(
            //   margin: EdgeInsets.only(left: 0, right: 0), // Set horizontal margin to 0
            //   padding: EdgeInsets.only(left: 0, right: 0),
            //   child: FlexibleSpaceBar(
            //     // title: Text('App Bar Title'),
            //       background: ClipRRect(
            //           borderRadius: BorderRadius.vertical(
            //             bottom: Radius.circular(24.0.r),
            //           ),child: Image.asset('assets/images/image_test.png', fit: BoxFit.cover,))
            //   ),
            // )
          ),
          SliverToBoxAdapter(
              child: Column(
            children: <Widget>[
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 0')),
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              // Add more widgets as needed
            ],
          )),
        ],
      ),
    );
  }
  // Column(
  // children: [
  // imageHeader(),
  // ],

  imageHeader() {
    return Image.asset(AppAsset.infoImage);
  }
}
