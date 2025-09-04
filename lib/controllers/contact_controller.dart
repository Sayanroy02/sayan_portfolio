import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController extends GetxController {
  // Observable variables for form visibility
  var showHireForm = false.obs;
  var showFreelanceForm = false.obs;

  // Form controllers for Hire Me form
  final companyNameController = TextEditingController();
  final companyEmailController = TextEditingController();
  final jobTitleController = TextEditingController();

  // Form controllers for Freelance form
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final ideaController = TextEditingController();

  // Form keys for validation
  final hireFormKey = GlobalKey<FormState>();
  final freelanceFormKey = GlobalKey<FormState>();

  @override
  void onClose() {
    // Dispose controllers
    companyNameController.dispose();
    companyEmailController.dispose();
    jobTitleController.dispose();
    nameController.dispose();
    phoneController.dispose();
    ideaController.dispose();
    super.onClose();
  }

  void toggleHireForm() {
    showHireForm.value = !showHireForm.value;
    if (showHireForm.value) {
      showFreelanceForm.value = false;
    }
  }

  void toggleFreelanceForm() {
    showFreelanceForm.value = !showFreelanceForm.value;
    if (showFreelanceForm.value) {
      showHireForm.value = false;
    }
  }

  void resetForms() {
    showHireForm.value = false;
    showFreelanceForm.value = false;
    companyNameController.clear();
    companyEmailController.clear();
    jobTitleController.clear();
    nameController.clear();
    phoneController.clear();
    ideaController.clear();
  }

  Future<void> sendHireEmail() async {
    if (!hireFormKey.currentState!.validate()) return;

    final companyName = companyNameController.text;
    final companyEmail = companyEmailController.text;
    final jobTitle = jobTitleController.text;

    final subject = Uri.encodeComponent(
      'Invitation to Interview for $jobTitle Position',
    );
    final body = Uri.encodeComponent('''Dear Sayan,

We are pleased to inform you that you have been shortlisted for the **$jobTitle** position at **$companyName**.

We would like to schedule an interview with you as per the following details:

• **Date:** [Insert Date]
• **Time:** [Insert Time]
• **Mode:** [In-person/Online (Google Meet/Zoom)]
• **Location/Link:** [Insert Address or Meeting Link]

Kindly confirm your availability by replying to this mail.

We look forward to speaking with you.

**Best Regards,**
[Your Full Name]
[Your Job Title]
$companyName
$companyEmail''');

    final emailUrl =
        'mailto:sayanroygupta@gmail.com?subject=$subject&body=$body';

    try {
      if (await canLaunchUrl(Uri.parse(emailUrl))) {
        await launchUrl(Uri.parse(emailUrl));
        Get.snackbar(
          'Success',
          'Email client opened successfully!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        resetForms();
      } else {
        throw Exception('Could not launch email client');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not open email client. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> sendWhatsAppMessage() async {
    if (!freelanceFormKey.currentState!.validate()) return;

    final name = nameController.text;
    final phone = phoneController.text;
    final idea = ideaController.text;

    final message = Uri.encodeComponent('''Hello Sayan,
I have an idea and I want to discuss it with you,

Name - $name
Phone - $phone
Idea - $idea''');

    final whatsappUrl = 'https://wa.me/917719310325?text=$message';

    try {
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        await launchUrl(
          Uri.parse(whatsappUrl),
          mode: LaunchMode.externalApplication,
        );
        Get.snackbar(
          'Success',
          'WhatsApp opened successfully!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        resetForms();
      } else {
        throw Exception('Could not launch WhatsApp');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not open WhatsApp. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    if (value.length < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
}
