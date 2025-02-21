import '../../exports.dart';

PreferredSizeWidget buildDesktopAppBar(BuildContext context, Function(int) scrollToSection) {
  return AppBar(
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildLogoContainer(),
        SizedBox(width: 16),
        Text(
          'Flutterlenz',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.orangeAccent,
    elevation: 2,
    centerTitle: false,
    actions: [
      buildNavButton('Home', 0, scrollToSection),
      buildNavButton('Services', 1, scrollToSection),
      buildNavButton('Portfolio', 2, scrollToSection),
      buildNavButton('About Us', 3, scrollToSection),
      buildNavButton('Contact', 4, scrollToSection),
    ],
  );
}
