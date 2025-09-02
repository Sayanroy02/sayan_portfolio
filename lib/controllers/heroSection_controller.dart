import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSectionController extends GetxController {
  final String githubUrl = "https://github.com/Sayanroy02";
  final String resumeUrl =
      "https://drive.google.com/uc?export=download&id=1lY-eVm99yqy3upDxMdsbKDUl1sYvmJhI";

  /// Function to open GitHub account
  Future<void> openGithub() async {
    final Uri url = Uri.parse(githubUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.snackbar("Error", "Could not open GitHub");
    }
  }

  /// Function to download resume (Google Drive link)
  Future<void> downloadResume() async {
    final Uri url = Uri.parse(resumeUrl);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.snackbar("Error", "Could not download resume");
    }
  }
}
