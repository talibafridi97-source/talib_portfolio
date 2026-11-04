import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'social_button.dart';
import '../data/portfolio_data.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF090D16) : const Color(0xFFE2E8F0).withOpacity(0.5),
        border: Border(
          top: BorderSide(
            color: isDark ? Colors.white.withOpacity(0.08) : Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: PortfolioData.socialLinks
                    .map((link) => SocialButton(
                          icon: link.icon,
                          label: link.label,
                          url: link.url,
                        ))
                    .toList(),
              ),
              const SizedBox(height: 32),
              const Divider(height: 1),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "© 2026 ${PortfolioData.developerName}. Built with ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const FaIcon(FontAwesomeIcons.flutter, size: 14, color: Color(0xFF3B82F6)),
                  Text(
                    " & Flutter Web.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "Islamabad, Pakistan • Open to Remote & On-site Opportunities",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
