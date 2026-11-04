import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project_model.dart';
import 'skill_chip.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  Future<void> _launchGitHub() async {
    if (widget.project.githubUrl != null) {
      final uri = Uri.parse(widget.project.githubUrl!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -5.0 : 0.0),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B).withOpacity(0.9) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFF3B82F6)
                : (isDark ? Colors.white.withOpacity(0.08) : Colors.grey.withOpacity(0.2)),
            width: _isHovered ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? const Color(0xFF3B82F6).withOpacity(0.2)
                  : Colors.black.withOpacity(isDark ? 0.3 : 0.05),
              blurRadius: _isHovered ? 16 : 8,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.folderOpen, color: Color(0xFF3B82F6), size: 28),
                if (widget.project.githubUrl != null)
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.github, size: 20),
                    onPressed: _launchGitHub,
                    tooltip: "View on GitHub",
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.project.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.project.subtitle,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF3B82F6),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                widget.project.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.project.techStack
                  .map((tech) => SkillChip(label: tech))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
