import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';
import '../widgets/project_card.dart';

class MoreProjectsSection extends StatelessWidget {
  const MoreProjectsSection({super.key});

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
                title: "Other Notable Projects",
                subtitle: "Repositories & Utilities",
              ),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth > 900
                      ? 2
                      : 1;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: constraints.maxWidth > 900 ? 1.6 : 1.4,
                    ),
                    itemCount: PortfolioData.moreProjects.length,
                    itemBuilder: (context, index) {
                      final project = PortfolioData.moreProjects[index];
                      return ProjectCard(project: project);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
