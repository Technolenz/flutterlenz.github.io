import '../exports.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // State and logic here...
  PortfolioCategory? selectedCategory;
  late PageController _pageController;
  int currentPageIndex = 0;
  final ScrollController _portfolioScrollController = ScrollController();
  int _currentPortfolioIndex = 0;
  final double _cardWidth = 300;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();



  void _scrollToPortfolioIndex(int index, double cardWidth) {
    final position = index * (cardWidth + 20);
    _portfolioScrollController.animateTo(
      position,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    setState(() => _currentPortfolioIndex = index);
  }

  void _updateCurrentIndex(int index) {
    setState(() => _currentPortfolioIndex = index);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: appDrawerConfig(context),
      appBar: buildAppBar(context, _scaffoldKey, _scrollController),
      body: ListView(
        controller: _scrollController,
        children: [
          heroContainer(context, (index) => scrollToSection(context, index, _scrollController)),
          ServicesSec(),
          PortfolioSec(
            portfolioScrollController: _portfolioScrollController,
            scrollToPortfolioIndex: _scrollToPortfolioIndex,
            updateCurrentIndex: _updateCurrentIndex,
          ),
          AboutUs(context),
          ContactUs(),
        ],
      ),
    );
  }
}