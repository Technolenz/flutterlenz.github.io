import 'package:flutterlenz_portfolio/exports.dart';

class PortfolioCard extends StatefulWidget {
  final PortfolioItem project;
  final bool isHighlighted;

  const PortfolioCard({
    super.key,
    required this.project,
    required this.isHighlighted,
  });

  @override
  _PortfolioCardState createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
        child: Card(
          color: widget.isHighlighted ? Colors.deepPurple[100] : Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: isHovered ? 8 : 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  widget.project.imageUrl,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.project.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[700],
                          ),
                    ),
                    Wrap(
                      spacing: 8,
                      children: [
                        _buildCategoryChip(widget.project.category),
                        _buildUseCaseChip(widget.project.useCase),
                        _buildTechStackChip(widget.project.techStack),
                      ],
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          if (await canLaunchUrl(
                              Uri.parse(widget.project.link))) {
                            await launchUrl(Uri.parse(widget.project.link));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Could not open link")),
                            );
                          }
                        },
                        child: Text(
                          "View More",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(PortfolioCategory category) {
    return Chip(
      label: Text(category.toString().split('.').last,
          style: TextStyle(color: Colors.white)),
      backgroundColor: _getCategoryColor(category),
    );
  }

  Widget _buildUseCaseChip(UseCase useCase) {
    return Chip(
      label: Text(useCase.toString().split('.').last,
          style: TextStyle(color: Colors.white)),
      backgroundColor: _getUseCaseColor(useCase),
    );
  }

  Widget _buildTechStackChip(TechStack techStack) {
    return Chip(
      label: Text(techStack.toString().split('.').last,
          style: TextStyle(color: Colors.white)),
      backgroundColor: _getTechStackColor(techStack),
    );
  }

  Color _getCategoryColor(PortfolioCategory category) {
    switch (category) {
      case PortfolioCategory.App:
        return Colors.deepPurple;
      case PortfolioCategory.UI:
        return Colors.orangeAccent;
      case PortfolioCategory.prototype:
        return Colors.black;
      default:
        return Colors.grey;
    }
  }
}

  Color _getUseCaseColor(UseCase useCase) {
    switch (useCase) {
      case UseCase.productivity:
        return Colors.green;
      case UseCase.finance:
        return Colors.deepPurpleAccent;
      case UseCase.entertainment:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  Color _getTechStackColor(TechStack techStack) {
    switch (techStack) {
      case TechStack.vanillaFlutter:
        return Colors.deepPurple;
      case TechStack.firebase:
        return Colors.orange;
      case TechStack.riverpod:
        return Colors.red;
      case TechStack.flutterWeb:
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

