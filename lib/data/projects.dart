class Project {
  final String title;
  final String description;
  final String image;
  final String github;
  final String liveDemo;

  Project({
    required this.title,
    required this.description,
    required this.image,
    required this.github,
    required this.liveDemo,
  });
}

List<Project> projects = [
  Project(
    title: "Raksha+ App",
    description:
        "A women’s safety app with SOS alerts, AI-powered harassment detection and safe routes.",
    image: "assets/images/project1.png",
    github: "https://github.com/Sayanroy02",
    liveDemo: "https://raksha-demo.web.app",
  ),
  Project(
    title: "Portfolio Website",
    description: "My personal portfolio built with Flutter Web and GetX.",
    image: "assets/images/project2.png",
    github: "https://github.com/Sayanroy02",
    liveDemo: "https://sayanroygupta.web.app",
  ),
];
