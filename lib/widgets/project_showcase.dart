import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project_model.dart';
import 'phone_frame.dart';
import 'image_lightbox.dart';
import 'skill_chip.dart';

class ProjectShowcase extends StatelessWidget {
  final ProjectModel project;
  final bool reverseLayout;

  const ProjectShowcase({
    super.key,
    required this.project,
    this.reverseLayout = false,
  });

  Future<void> _launchGitHub() async {
    if (project.githubUrl != null) {
      final uri = Uri.parse(project.githubUrl!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  void _showLightbox(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => ImageLightbox(imagePath: imagePath, title: project.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;

    final detailsContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF3B82F6).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF3B82F6).withOpacity(0.3)),
          ),
          child: Text(
            project.subtitle,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3B82F6),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          project.title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.08),
            ),
          ),
          child: Text(
            project.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
          ),
        ),
        const SizedBox(height: 16),
        if (project.features != null) ...[
          ...project.features!.map((feature) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Icon(Icons.check_circle, size: 16, color: Color(0xFF3B82F6)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        feature,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 16),
        ],
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: project.techStack.map((tech) => SkillChip(label: tech)).toList(),
        ),
        const SizedBox(height: 24),
        if (project.githubUrl != null)
          ElevatedButton.icon(
            onPressed: _launchGitHub,
            icon: const FaIcon(FontAwesomeIcons.github, size: 18),
            label: const Text("View Code on GitHub"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
      ],
    );

    final mockupsContent = Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: project.screenshots.map((img) {
            final isWide = img.contains('admin');
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: isWide
                  ? BrowserFrame(imagePath: img, onTap: () => _showLightbox(context, img))
                  : PhoneFrame(imagePath: img, onTap: () => _showLightbox(context, img)),
            );
          }).toList(),
        ),
      ),
    );

    if (!isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          detailsContent,
          const SizedBox(height: 32),
          mockupsContent,
        ],
      );
    }

    final detailsWidget = Expanded(flex: 3, child: detailsContent);
    final mockupsWidget = Expanded(flex: 2, child: mockupsContent);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: reverseLayout
          ? [mockupsWidget, const SizedBox(width: 48), detailsWidget]
          : [detailsWidget, const SizedBox(width: 48), mockupsWidget],
    );
  }
}
