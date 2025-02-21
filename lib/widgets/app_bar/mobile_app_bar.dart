import '../../exports.dart';

PreferredSizeWidget buildMobileAppBar(BuildContext context, Function() openDrawer) {
  return AppBar(
    title: buildLogoContainer(),
    backgroundColor: Colors.deepPurple,
    elevation: 2,
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.menu, color: Colors.white),
      onPressed: openDrawer,
    ),
  );
}