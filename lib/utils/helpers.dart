import '../exports.dart';

void scrollToSection(BuildContext context, int index, ScrollController scrollController) {
  final double offset = index * MediaQuery.of(context).size.height;

  scrollController.animateTo(
    offset,
    duration: Duration(seconds: 1),
    curve: Curves.easeInOut,
  );
}


void scrollToPortfolioIndex(BuildContext context, int index, double cardWidth, Function(int) updateIndex, ScrollController scrollController) {
  final double position = index * (cardWidth + 20); // Account for card width + separator

  scrollController.animateTo(
    position,
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );

  updateIndex(index); // Call the callback to update the state
}

Widget? appDrawerConfig (BuildContext context){
  final screenWidth = MediaQuery.of(context).size.width;
  final ScrollController scrollController = ScrollController();

  if (screenWidth > 800) {
    return null;
  } else {
    return buildMobileDrawer(context, (index) => scrollToSection(context, index, scrollController));
  }
}

PreferredSizeWidget buildAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, ScrollController scrollController) {
  final screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth > 800) {
    // Desktop app bar
    return buildDesktopAppBar(context, (index) => scrollToSection(context, index, scrollController));
  } else {
    // Mobile app bar
    return buildMobileAppBar(context, () => scaffoldKey.currentState?.openDrawer());
  }
}

//logo container
Widget buildLogoContainer() {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets_main/images/flutterlenz.png',
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}


//MOBILE DRAWER
Widget buildMobileDrawer(BuildContext context, Function(int) scrollToSection) {
  return Drawer(
    child: Container(
      color: Colors.deepPurple[800],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: buildLogoContainer(),
          ),
          buildDrawerItem(context, 'Home', 0, scrollToSection),
          buildDrawerItem(context, 'Services', 1, scrollToSection),
          buildDrawerItem(context, 'Portfolio', 2, scrollToSection),
          buildDrawerItem(context, 'About Us', 3, scrollToSection),
          buildDrawerItem(context, 'Contact', 4, scrollToSection),
        ],
      ),
    ),
  );
}


//DRAWER ITEM
Widget buildDrawerItem(BuildContext context, String title, int sectionIndex, Function(int) scrollToSection) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    onTap: () {
      Navigator.pop(context); // Close drawer
      scrollToSection(sectionIndex);
    },
  );
}






//NAV BUTTON
Widget buildNavButton(String title, int sectionIndex, Function(int) scrollToSection) {
  return TextButton(
    onPressed: () => scrollToSection(sectionIndex),
    style: TextButton.styleFrom(
      foregroundColor: Colors.white, // Text color
      padding: EdgeInsets.symmetric(horizontal: 16),
    ),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}


