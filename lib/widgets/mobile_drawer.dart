import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../data/portfolio_data.dart';

class MobileDrawer extends StatelessWidget {
  final Function(String) onScrollToSection;

  const MobileDrawer({super.key, required this.onScrollToSection});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Drawer(
      backgroundColor: isDark ? const Color(0xFF0F172A) : Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  PortfolioData.developerName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Full Stack Developer",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Color(0xFF3B82F6)),
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context);
              onScrollToSection('about');
            },
          ),
          ListTile(
            leading: const Icon(Icons.code, color: Color(0xFF3B82F6)),
            title: const Text("Skills"),
            onTap: () {
              Navigator.pop(context);
              onScrollToSection('skills');
            },
          ),
          ListTile(
            leading: const Icon(Icons.rocket_launch, color: Color(0xFF3B82F6)),
            title: const Text("Projects"),
            onTap: () {
              Navigator.pop(context);
              onScrollToSection('projects');
            },
          ),
          ListTile(
            leading: const Icon(Icons.school, color: Color(0xFF3B82F6)),
            title: const Text("Education"),
            onTap: () {
              Navigator.pop(context);
              onScrollToSection('education');
            },
          ),
          ListTile(
            leading: const Icon(Icons.email, color: Color(0xFF3B82F6)),
            title: const Text("Contact"),
            onTap: () {
              Navigator.pop(context);
              onScrollToSection('contact');
            },
          ),
          const Divider(),
          SwitchListTile(
            secondary: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: const Color(0xFF3B82F6),
            ),
            title: Text(isDark ? "Light Mode" : "Dark Mode"),
            value: !isDark,
            onChanged: (val) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
