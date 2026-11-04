import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_chip.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "About Me", subtitle: "Get to know me"),
        const SizedBox(height: 24),
        Text(
          PortfolioData.aboutBio,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.7),
        ),
        const SizedBox(height: 24),
        _infoRow(context, Icons.school, "Education", PortfolioData.educationInfo),
        const SizedBox(height: 12),
        _infoRow(context, Icons.location_on, "Location", PortfolioData.location),
        const SizedBox(height: 12),
        _infoRow(context, Icons.email, "Email", PortfolioData.email),
        const SizedBox(height: 12),
        _infoRow(context, Icons.phone, "Phone / WhatsApp", PortfolioData.phone),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Icon(Icons.language, size: 20, color: Color(0xFF3B82F6)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Languages",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: PortfolioData.languages
                        .map((lang) => SkillChip(label: lang))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF3B82F6).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF3B82F6).withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Icon(Icons.work_outline, color: Color(0xFF3B82F6), size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  PortfolioData.workStatus,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isDark ? const Color(0xFF93C5FD) : const Color(0xFF1D4ED8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final imageCard = Container(
      width: 320,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(PortfolioData.profileImage),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 2, child: Center(child: imageCard)),
                    const SizedBox(width: 64),
                    Expanded(flex: 3, child: content),
                  ],
                )
              : Column(
                  children: [
                    imageCard,
                    const SizedBox(height: 40),
                    content,
                  ],
                ),
        ),
      ),
    );
  }

  Widget _infoRow(BuildContext context, IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: const Color(0xFF3B82F6)),
        const SizedBox(width: 12),
        Text(
          "$label: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
