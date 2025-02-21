import '../../exports.dart';

Container AboutUs(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    color: Colors.orangeAccent, // Background color
    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'About Us',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Column 1: Image → Card
              buildAboutColumn(
                imagePath: 'assets_main/images/about/mission.jpg', // Replace with your image
                title: 'Our Mission',
                description: 'To deliver innovative solutions that empower businesses and individuals.',
                isImageFirst: false,
              ),
              // Column 2: Card → Image
              buildAboutColumn(
                imagePath: 'assets_main/images/about/vision.jpg', // Replace with your image
                title: 'Our Vision',
                description: 'To be a global leader in technology and innovation.',
                isImageFirst: true,
              ),
              // Column 3: Image → Card
              buildAboutColumn(
                imagePath: 'assets_main/images/about/values.jpg', // Replace with your image
                title: 'Our Values',
                description: 'Excellence, Integrity, and Collaboration.',
                isImageFirst: false,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}