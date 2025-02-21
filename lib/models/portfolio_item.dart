enum PortfolioCategory { App, UI, prototype }

enum UseCase {
  productivity,
  finance,
  entertainment,
  health,
  social,
  ecommerce,
  education,
  utilities,
  techDemo,
}

enum TechStack {
  vanillaFlutter,
  firebase,
  riverpod,
  flutterWeb,
}

class PortfolioItem {
  final String title;
  final String description;
  final String imageUrl;
  final String link;
  final PortfolioCategory category;
  final UseCase useCase;      // Use Case Filter
  final TechStack techStack;  // Tech Stack Filter

  const PortfolioItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.link,
    required this.category,
    required this.useCase,
    required this.techStack,
  });
}
