import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../data/portfolio_data.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onScrollToSection;

  const Navbar({super.key, required this.onScrollToSection});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: (isDark ? const Color(0xFF0F172A) : Colors.white).withOpacity(0.85),
        border: Border(
          bottom: BorderSide(
            color: isDark ? Colors.white.withOpacity(0.08) : Colors.grey.withOpacity(0.15),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo / Name
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "TN",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    PortfolioData.developerName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  const Text(
                    "Full Stack Dev",
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF3B82F6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Desktop Nav Links
          if (!isMobile)
            Row(
              children: [
                _navButton(context, "About", "about"),
                _navButton(context, "Skills", "skills"),
                _navButton(context, "Projects", "projects"),
                _navButton(context, "Education", "education"),
                _navButton(context, "Contact", "contact"),
                const SizedBox(width: 16),
                IconButton(
                  icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode, size: 20),
                  onPressed: () => themeProvider.toggleTheme(),
                  tooltip: "Toggle Theme",
                ),
              ],
            )
          else
            Row(
              children: [
                IconButton(
                  icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode, size: 20),
                  onPressed: () => themeProvider.toggleTheme(),
                ),
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, size: 24),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String title, String sectionKey) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isActive = themeProvider.activeSection == sectionKey;
    final isDark = themeProvider.isDarkMode;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () => onScrollToSection(sectionKey),
        style: TextButton.styleFrom(
          foregroundColor: isActive
              ? const Color(0xFF3B82F6)
              : (isDark ? Colors.white70 : Colors.black87),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
