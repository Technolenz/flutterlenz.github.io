import 'package:flutterlenz_portfolio/exports.dart';

Container ContactUs() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
    color: Colors.deepPurple, // Background color
    child: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth > 800;
          if (isLargeScreen) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // Cool Quotes
                  Text(
                    '"Innovation distinguishes between a leader and a follower."\n- Steve Jobs',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '"The best way to predict the future is to invent it."\n- Alan Kay',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),

                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),


                  SizedBox(height: 40),

                  // Contact Form (Remove Expanded)
                  Container(
                    width: 500, // Adjust width as needed
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ContactForm(),
                  ),
                  SizedBox(height: 40),

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook, color: Colors.orangeAccent),
                        onPressed: () {
                          launchUrl(Uri.parse('https://facebook.com/technolenz'));
                        },
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.orangeAccent),
                        onPressed: () {
                          launchUrl(Uri.parse('https://twitter.com/technolenz'));
                        },
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.orangeAccent),
                        onPressed: () {
                          launchUrl(Uri.parse('https://linkedin.com/company/technolenz'));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.email, color: Colors.orangeAccent),
                        onPressed: () {
                          launchUrl(Uri.parse('mailto:info@technolenz.com'));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '© Technolenz 2025',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  SizedBox(height: 40),
                  // Cool Quotes
                  Text(
                    '"Innovation distinguishes between a leader and a follower."\n- Steve Jobs',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '"The best way to predict the future is to invent it."\n- Alan Kay',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),

                  // Contact Form (Remove Expanded)
                  Container(
                    width: 500, // Adjust width as needed
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ContactForm(),
                  ),
                  SizedBox(height: 40),

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook, color: Colors.orangeAccent),
                        onPressed: () {
                          launchUrl(Uri.parse('https://facebook.com/technolenz'));
                        },
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.orangeAccent),
                        onPressed: () {
                          launchUrl(Uri.parse('https://twitter.com/technolenz'));
                        },
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.orangeAccent),
                        onPressed: () {
                          launchUrl(Uri.parse('https://linkedin.com/company/technolenz'));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.email, color: Colors.orangeAccent),
                        onPressed: () {
                          launchUrl(Uri.parse('mailto:info@technolenz.com'));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '© Technolenz 2025',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            );
          }
        }
    ),
  );
}