import '../../exports.dart';

Widget buildAboutColumn({
  required String imagePath,
  required String title,
  required String description,
  required bool isImageFirst,
}) {
  return Flexible(
    child: Column(
      children: [
        if (isImageFirst) _buildAboutImage(imagePath),
        if (!isImageFirst) _HoverableAboutCard(title: title, description: description),
        SizedBox(height: 20), // Spacing between image and card
        if (isImageFirst) _HoverableAboutCard(title: title, description: description),
        if (!isImageFirst) _buildAboutImage(imagePath),
      ],
    ),
  );
}

Widget _buildAboutImage(String imagePath) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12), // Rounded corners
    child: Image.asset(
      imagePath,
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),
  );
}

class _HoverableAboutCard extends StatefulWidget {
  final String title;
  final String description;

  const _HoverableAboutCard({
    required this.title,
    required this.description,
  });

  @override
  __HoverableAboutCardState createState() => __HoverableAboutCardState();
}

class __HoverableAboutCardState extends State<_HoverableAboutCard> {
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
          elevation: isHovered ? 8 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          color: isHovered ? Colors.deepPurple[300] : Colors.deepPurple, // Slight color change on hover
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent, // Text color
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Text color
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
