class ProjectModel {
  final String title;
  final String subtitle;
  final String description;
  final List<String> techStack;
  final List<String> screenshots;
  final String? githubUrl;
  final String? liveUrl;
  final bool isFeatured;
  final List<String>? features;
  final String? accentColorHex;

  ProjectModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.techStack,
    required this.screenshots,
    this.githubUrl,
    this.liveUrl,
    this.isFeatured = false,
    this.features,
    this.accentColorHex,
  });
}
