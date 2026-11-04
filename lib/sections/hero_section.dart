import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';

class HeroSection extends StatelessWidget {
  final Function(String) onScrollToSection;

  const HeroSection({super.key, required this.onScrollToSection});

  Future<void> _launchCV() async {
    final uri = Uri.parse(PortfolioData.cvAssetPath);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      final waUri = Uri.parse(PortfolioData.whatsappUrl);
      await launchUrl(waUri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchWhatsApp() async {
    final uri = Uri.parse(PortfolioData.whatsappUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final textContent = Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF3B82F6).withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF3B82F6).withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.fiber_manual_record, size: 12, color: Color(0xFF10B981)),
              const SizedBox(width: 8),
              Text(
                "Available for Full Stack Roles",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? const Color(0xFF93C5FD) : const Color(0xFF1D4ED8),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Hi, I'm ${PortfolioData.developerName}",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: isDesktop ? 48 : 36,
              ),
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 48,
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: isDesktop ? 24 : 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3B82F6),
            ),
            child: AnimatedTextKit(
              animatedTexts: PortfolioData.typingRoles
                  .map((role) => RotateAnimatedText(role, alignment: isDesktop ? Alignment.centerLeft : Alignment.center))
                  .toList(),
              repeatForever: true,
              pause: const Duration(milliseconds: 1500),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Building robust, production-grade mobile applications and scalable backend systems with Flutter, Node.js, and Supabase.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.5),
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => onScrollToSection('projects'),
              icon: const Icon(Icons.rocket_launch, size: 18),
              label: const Text("View Projects"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            OutlinedButton.icon(
              onPressed: _launchCV,
              icon: const Icon(Icons.download, size: 18),
              label: const Text("Download CV"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                side: const BorderSide(color: Color(0xFF3B82F6)),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _launchWhatsApp,
              icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 18),
              label: const Text("Hire Me"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF10B981),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        // Stats Row (Fully responsive using Expanded)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: _statItem("7+", "GitHub Projects")),
              _divider(),
              Expanded(child: _statItem("16", "Screen App")),
              _divider(),
              Expanded(child: _statItem("BS CS", "GPGC Kohat")),
            ],
          ),
        ),
      ],
    );

    final imageWidget = Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ClipOval(
          child: Image.asset(
            PortfolioData.profileImage,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: const Color(0xFF1E293B),
                child: const Center(
                  child: Icon(Icons.person, size: 90, color: Colors.white54),
                ),
              );
            },
          ),
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isDesktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 3, child: textContent),
                    const SizedBox(width: 48),
                    Expanded(flex: 2, child: Center(child: imageWidget)),
                  ],
                )
              : Column(
                  children: [
                    imageWidget,
                    const SizedBox(height: 32),
                    textContent,
                  ],
                ),
        ),
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3B82F6),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Colors.white70),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _divider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.white.withOpacity(0.15),
    );
  }
}
