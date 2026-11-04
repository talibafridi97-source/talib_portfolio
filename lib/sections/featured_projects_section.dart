import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';
import '../widgets/project_showcase.dart';

class FeaturedProjectsSection extends StatelessWidget {
  const FeaturedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const SectionTitle(
                title: "Featured Projects",
                subtitle: "Flagship Work",
              ),
              const SizedBox(height: 20),
              ...PortfolioData.featuredProjects.asMap().entries.map((entry) {
                final index = entry.key;
                final project = entry.value;
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index < PortfolioData.featuredProjects.length - 1 ? 80.0 : 0.0,
                  ),
                  child: ProjectShowcase(
                    project: project,
                    reverseLayout: index % 2 != 0,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
