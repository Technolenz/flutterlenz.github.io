import 'package:flutterlenz_portfolio/exports.dart';

Container ServicesSec() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 160),
    decoration: BoxDecoration(
      gradient: AppGradients.secondaryGradient,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Our Services',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 40),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              ServiceCard(
                icon: Icons.phone_android,
                title: 'Full-Stack Apps',
                description: 'Beautiful and Functional fullstack cross-platform apps with stunning UIs.',
              ),
              ServiceCard(
                icon: Icons.analytics,
                title: 'Firebase Integration',
                description: 'Integrate your favorite google services with your app',
              ),
              ServiceCard(
                icon: Icons.widgets,
                title: 'Custom Widgets',
                description: 'Creating new and interactive custom widgets.',
              ),
              ServiceCard(
                icon: Icons.api,
                title: 'API Integration',
                description: 'Integrate your APIs with your applications',
              ),
              ServiceCard(
                icon: Icons.branding_watermark,
                title: 'Branding',
                description: 'App Branding, Theming and Graphic design made easy',
              ),
            ],
          ),
        ],
      ),
    ),
  );
}