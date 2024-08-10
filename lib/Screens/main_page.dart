import 'package:expense_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin{
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context).brightness,
          ),
          elevation: 0,
          forceMaterialTransparency: true,
          leading: FittedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                'assets/svg/logo.svg',
                width: 20,
                height: 20,
              ),
            ),
          ),
          title: FittedBox(
            child: Text(
              'Expensify',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          bottom: TabBar(
            labelStyle: GoogleFonts.inter(
                color: const Color(0xffFD3C4A),
                fontSize: 15,
                fontWeight: FontWeight.w600
            ),
            // overlayColor: WidgetStatePropertyAll(Colors.transparent),
            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
            unselectedLabelColor: const Color(0xffC6C6C6),
            // tabAlignment: TabAlignment.fill,
            // dividerColor: Color(0xffFD3C4A),
            indicatorColor: const Color(0xffFD3C4A),
            indicatorWeight: 5,
            isScrollable: true,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            tabAlignment: TabAlignment.start,
            tabs: Constants.getHomeScreenTbs(_tabController.index),
            controller: _tabController,
            onTap: (index){
              setState(() {
              });
            },
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: Constants.screens,
        ),
      ),
    );
  }
}
