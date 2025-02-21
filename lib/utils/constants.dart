import 'package:flutterlenz_portfolio/exports.dart';

class AppConstants {
  static const String appName = 'Flutterlenz';
  static const String heroTitle = 'Innovative Solutions in Flutter';

  static const List<PortfolioItem> portfolioItems = [
    PortfolioItem(
      title: "Unit Converter",
      description: "A Unit Converter, specializing in all type of units conversion built with Flutter, with responsiveness and compilations into Android and Web.",
      imageUrl: "assets_main/images/fappproj/unitconverter-icon-512.png",
      link: "https://freelenz-unit-converter.web.app/welcome.html",
      category: PortfolioCategory.App,
      useCase: UseCase.productivity,
      techStack: TechStack.vanillaFlutter,
    ),
    PortfolioItem(
      title: "Flutterlenz Portfolio",
      description: "A responsive portfolio built with Flutter.",
      imageUrl: "assets_main/images/flutterlenz.png",
      link: "#",
      category: PortfolioCategory.App,
      useCase: UseCase.productivity,
      techStack: TechStack.vanillaFlutter,
    ),
    PortfolioItem(
      title: "WordPair App",
      description: "A simple app designed for finding and saving your favorite word pairs",
      imageUrl: "assets_main/images/fappproj/wordpairapp_icon-512.png",
      link: "https://word-pair-app.web.app/welcome.html",
      category: PortfolioCategory.App,
      useCase: UseCase.productivity,
      techStack: TechStack.vanillaFlutter,
    ),
  ];
}