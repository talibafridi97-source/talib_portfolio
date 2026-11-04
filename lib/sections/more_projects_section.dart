import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';
import '../widgets/project_card.dart';

class MoreProjectsSection extends StatelessWidget {
  const MoreProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const SectionTitle(
                title: "Other Notable Projects",
                subtitle: "Repositories & Utilities",
              ),
              const SizedBox(height: 40),
              isDesktop
                  ? Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: PortfolioData.moreProjects.map((project) {
                        return SizedBox(
                          width: (1200 - 24) / 2,
                          child: ProjectCard(project: project),
                        );
                      }).toList(),
                    )
                  : Column(
                      children: PortfolioData.moreProjects
                          .map((project) => Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: ProjectCard(project: project),
                              ))
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
