import 'package:flutter/material.dart';
import 'package:portfolio_app/pages/about_page.dart';
import 'package:portfolio_app/pages/education_page.dart';
import 'package:portfolio_app/pages/footer_page.dart';
import 'package:portfolio_app/pages/projects_page.dart';
import 'package:portfolio_app/pages/skill_page.dart';
import 'package:portfolio_app/pages/welcome_page.dart';
import 'package:portfolio_app/utils/globals.dart';
import 'package:portfolio_app/widgets/drawer_widget.dart';
import 'package:portfolio_app/widgets/top_bar_contents.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const WelcomePage(),
    const AboutPage(),
    const ProjectsPage(),
    const EducationPage(),
    const SkillPage(),
    const FooterPage(),
  ];

  final pageController = PageController(initialPage: 0);
  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size(100, 100),
        child: TopBarContents(
          opacity: 0.0,
          itemsScrollController: itemScrollController,
        ),
      ),
      endDrawer: DrawerWidget(itemController: itemScrollController),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ScrollablePositionedList.builder(
          initialScrollIndex: 0,
          shrinkWrap: true,
          itemPositionsListener: itemPositionsListener,
          itemScrollController: itemScrollController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final page = pages[index];

            return page;
          },
        ),
      ),
    );
  }
}
