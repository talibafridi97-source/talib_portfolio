import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/social_link_model.dart';

class PortfolioData {
  static const String developerName = "Talib Nawaz";
  static const String developerTitle = "Full Stack Developer (Flutter | Node.js | Supabase)";
  static const String location = "Islamabad, Pakistan";
  static const String phone = "+92 343 9246597";
  static const String email = "talibafridi97@gmail.com";
  static const String linkedinUrl = "https://www.linkedin.com/in/talib-afridi-995b89376/";
  static const String githubUrl = "https://github.com/talibafridi97-source";
  static const String whatsappUrl = "https://wa.me/923439246597";
  static const String cvAssetPath = "assets/cv/Talib_Nawaz_Full_Stack_Developer_CV.pdf";
  static const String profileImage = "assets/images/profile.png";

  static const String aboutBio =
      "Full stack developer with 7 projects on GitHub, including a 16-screen Tailor Management System, a food delivery and restaurant management platform with real-time order tracking, and a full-stack JWT authentication app. Strong in Dart, OOP and C++, with experience in REST API development, MongoDB, PostgreSQL (Supabase) and Provider state management.";

  static const String educationInfo = "BS Computer Science, GPGC Kohat, Graduated May 2026";
  static const List<String> languages = ["English", "Urdu", "Pashto"];
  static const String workStatus = "Open to full stack developer roles in Islamabad (also open to remote)";

  static final List<String> typingRoles = [
    "Full Stack Developer",
    "Flutter Developer",
    "Node.js Developer",
    "Supabase Builder",
    "Mobile & Web Specialist"
  ];

  static final List<SkillCategory> skillCategories = [
    SkillCategory(
      categoryName: "Mobile Development",
      description: "Building responsive cross-platform apps with fluid UIs and robust state management.",
      skills: [
        "Flutter",
        "Dart",
        "Provider",
        "setState",
        "Material 3",
        "Local Notifications",
        "Custom Widgets",
        "Responsive Layouts",
        "Navigation"
      ],
    ),
    SkillCategory(
      categoryName: "Backend & Cloud",
      description: "Developing scalable REST APIs, real-time web sockets, and secure database schemas.",
      skills: [
        "Node.js",
        "Express.js",
        "MongoDB Atlas",
        "Supabase",
        "PostgreSQL",
        "Realtime / WebSockets",
        "JWT Auth",
        "REST APIs",
        "JSON Parsing",
        "FCM",
        "Firebase Admin SDK"
      ],
    ),
    SkillCategory(
      categoryName: "Programming Languages & OOP",
      description: "Strong foundation in data structures, algorithms, and object-oriented programming paradigms.",
      skills: [
        "Dart",
        "C++",
        "OOP Principles",
        "Java",
        "JavaScript",
        "Python"
      ],
    ),
    SkillCategory(
      categoryName: "Development Tools",
      description: "Industry-standard tooling and version control for efficient team collaboration.",
      skills: [
        "Git / GitHub",
        "Android Studio",
        "VS Code",
        "Postman",
        "Supabase Dashboard"
      ],
    ),
  ];

  static final List<ProjectModel> featuredProjects = [
    ProjectModel(
      title: "Khoaaoo jiii",
      subtitle: "Food Delivery & Restaurant Management Platform",
      description:
          "A comprehensive food delivery and restaurant management platform featuring a customer-facing Flutter app and a real-time web Admin Dashboard. Leverages Supabase (PostgreSQL, Auth, Realtime/WebSockets) for instant order alerts, live status updates, GPS location picker, scheduled pre-ordering, and in-app live chat.",
      techStack: ["Flutter", "Dart", "Supabase", "PostgreSQL", "Material 3", "WebSockets"],
      screenshots: [
        "assets/images/khoaaoo_home.png",
        "assets/images/khoaaoo_menu.png",
        "assets/images/khoaaoo_orders.png",
        "assets/images/khoaaoo_admin.png",
      ],
      githubUrl: "https://github.com/talibafridi97-source",
      isFeatured: true,
      accentColorHex: "#FF5722", // Warm orange highlight for branding
      features: [
        "Real-time order tracking with statuses (Preparing, Out for Delivery, Delivered)",
        "Advanced cart customizations (portion sizes, add-ons, cooking instructions)",
        "Promo code engine & scheduled pre-ordering",
        "GPS location picker & in-app customer-restaurant live chat",
        "Wide web Admin Dashboard for live customer orders and menu management",
      ],
    ),
    ProjectModel(
      title: "Tailor Management System",
      subtitle: "16-Screen Full-Stack Enterprise App (Final Year Project)",
      description:
          "An enterprise-grade 16-screen full-stack application built for tailors to digitize their workflow. Covers order management, customer measurements, inventory tracking, financial profit & loss, due payments, staff workload analytics, and an integrated AI 'Tailor Bot'. Defended at university exhibition in May 2026.",
      techStack: ["Flutter", "Dart", "Node.js", "Express", "MongoDB Atlas", "JWT", "Firebase FCM"],
      screenshots: [
        "assets/images/tailor_orders.png",
        "assets/images/tailor_drawer.png",
      ],
      githubUrl: "https://github.com/talibafridi97-source",
      isFeatured: true,
      accentColorHex: "#3B82F6", // Blue-purple accent
      features: [
        "Comprehensive 16-screen navigation drawer covering all business facets",
        "JWT authentication & secure backend REST APIs with Node.js and Express",
        "Multi-language support (English, Urdu, Arabic) & dark/light theme toggle",
        "Automated FCM push notifications via Firebase Admin SDK",
        "Advanced staff workload distribution and financial profit & loss analytics",
      ],
    ),
  ];

  static final List<ProjectModel> moreProjects = [
    ProjectModel(
      title: "JWT Authentication App",
      subtitle: "Full-Stack Auth & Protected Routes",
      description: "Secure login and registration system with Express REST API, MongoDB backend, JSON Web Tokens, and persistent Flutter client session handling.",
      techStack: ["Flutter", "Node.js", "Express", "MongoDB", "JWT"],
      screenshots: [],
      githubUrl: "https://github.com/talibafridi97-source",
    ),
    ProjectModel(
      title: "Quran Tajweed App",
      subtitle: "Interactive Learning & Recitation",
      description: "Educational mobile app presenting core Tajweed rules with rich typographic guides and audio recitation integration.",
      techStack: ["Flutter", "Dart", "Audio Players"],
      screenshots: [],
      githubUrl: "https://github.com/talibafridi97-source",
    ),
    ProjectModel(
      title: "Weather Forecast App",
      subtitle: "Real-Time Meteorology",
      description: "Sleek weather application fetching live meteorological data via WeatherAPI with current conditions and 3-day forecasts.",
      techStack: ["Flutter", "REST API", "WeatherAPI"],
      screenshots: [],
      githubUrl: "https://github.com/talibafridi97-source",
    ),
    ProjectModel(
      title: "Todo & Calculator Apps",
      subtitle: "Productivity & Utility Suite",
      description: "High-performance productivity utilities featuring persistent local storage, instant UI updates, and robust state calculation logic.",
      techStack: ["Flutter", "Dart", "Local Storage"],
      screenshots: [],
      githubUrl: "https://github.com/talibafridi97-source",
    ),
  ];

  static final List<SocialLinkModel> socialLinks = [
    SocialLinkModel(
      label: "GitHub",
      url: githubUrl,
      icon: FontAwesomeIcons.github,
    ),
    SocialLinkModel(
      label: "LinkedIn",
      url: linkedinUrl,
      icon: FontAwesomeIcons.linkedinIn,
    ),
    SocialLinkModel(
      label: "WhatsApp",
      url: whatsappUrl,
      icon: FontAwesomeIcons.whatsapp,
    ),
    SocialLinkModel(
      label: "Email",
      url: "mailto:$email",
      icon: FontAwesomeIcons.solidEnvelope,
    ),
  ];
}
