import '../../exports.dart';

Container heroContainer(BuildContext context, Function(int) scrollToSection) {
  return Container(
    decoration: BoxDecoration(
      gradient: AppGradients.multideepPurpleGradient,
    ),
    height: MediaQuery.of(context).size.height,
    child: Stack(
      fit: StackFit.expand,
      children: [
        BlurredVideoBackground(videoAsset: 'assets_main/videos/vidbgvidmain.mp4'),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flutterlenz',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Innovative Solutions in Flutter',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => scrollToSection(1),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  backgroundColor: Colors.orangeAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ), // Use the passed function
                child: Text('Explore Our Services'),
              ),
            ],
          ),
        ),
      ]
    ),
  );
}