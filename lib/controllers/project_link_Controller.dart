import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectSectionController extends GetxController {
  final String githubArtFuse = "https://github.com/Sayanroy02/ArtFuse";
  final String githubMegaBlog =
      "https://github.com/Sayanroy02/LearningReact/tree/main/12MegaBlog";
  final String githubNotify = "https://github.com/Sayanroy02/Notify-College";
  final String githubSikkimInterior =
      "https://github.com/Sayanroy02/Sikkim_Interior";
  final String sikkimInteriorlink = "https://sikkim-interior.vercel.app";
  final String megabloglink = "https://mega-blog-nine-nu.vercel.app";

  /// Function to open GitHub account
  Future<void> openGithubArtFuse() async {
    final Uri url = Uri.parse(githubArtFuse);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.snackbar("Error", "Could not open GitHub");
    }
  }

  //MegaBlog
  Future<void> openGithubMegaBlog() async {
    final Uri url = Uri.parse(githubMegaBlog);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.snackbar("Error", "Could not open GitHub");
    }
  }

  //Sikkim Interior

  Future<void> openGithubSI() async {
    final Uri url = Uri.parse(githubSikkimInterior);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.snackbar("Error", "Could not open GitHub");
    }
  }

  //Notify
  Future<void> openGithubNotify() async {
    final Uri url = Uri.parse(githubNotify);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.snackbar("Error", "Could not open GitHub");
    }
  }

  /// Function to open websites
  Future<void> openMegaBlog() async {
    final Uri url = Uri.parse(megabloglink);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.snackbar("Error", "Could not download resume");
    }
  }

  Future<void> openSI() async {
    final Uri url = Uri.parse(sikkimInteriorlink);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.snackbar("Error", "Could not download resume");
    }
  }
}
