import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sayan_portfolio/controllers/theme_controler.dart';
import 'package:sayan_portfolio/controllers/contact_controller.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final contactController = Get.put(ContactController());
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 768;
    final isMobile = size.width < 800;

    return Obx(
      () => Container(
        width: size.width * 1,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: themeController.isDarkMode.value
                ? Colors.amber.shade300
                : Colors.black,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.shade400.withOpacity(0.8),
              offset: Offset(8, 8),
              blurRadius: 0,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(12, 12),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              themeController.isDarkMode.value
                  ? Colors.amber.shade600
                  : Colors.amber.shade400,
              themeController.isDarkMode.value ? Colors.black : Colors.white,
            ],
            tileMode: TileMode.clamp,
            transform: GradientRotation(0.9),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.1, 0.2],
          ),
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(30),
        child: isDesktop
            ? _buildDesktopLayout(contactController, themeController)
            : _buildMobileLayout(contactController, themeController, isMobile),
      ),
    );
  }

  Widget _buildDesktopLayout(
    ContactController controller,
    ThemeController themeController,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildContactContent(controller, themeController, false),
        ),
        SizedBox(width: 40),
        Expanded(flex: 1, child: _buildLottieAnimation()),
      ],
    );
  }

  Widget _buildMobileLayout(
    ContactController controller,
    ThemeController themeController,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactContent(controller, themeController, isMobile),
        SizedBox(height: 30),
        _buildLottieAnimation(),
      ],
    );
  }

  Widget _buildContactContent(
    ContactController controller,
    ThemeController themeController,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          "Contact Me",
          style: GoogleFonts.pixelifySans(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.bold,
            color: themeController.isDarkMode.value
                ? Colors.white
                : Colors.black,
          ),
        ),
        SizedBox(height: 20),

        Text(
          "Let's work together!",
          style: GoogleFonts.pixelifySans(
            fontSize: isMobile ? 16 : 20,
            color: themeController.isDarkMode.value
                ? Colors.amber.shade300
                : Colors.black87,
          ),
        ),
        SizedBox(height: 30),

        // Action Buttons
        Row(
          children: [
            _buildPixelButton(
              text: "Hire Me",
              onPressed: controller.toggleHireForm,
              isActive: controller.showHireForm.value,
              themeController: themeController,
              isMobile: isMobile,
            ),
            SizedBox(width: 20),
            _buildPixelButton(
              text: "Freelancing",
              onPressed: controller.toggleFreelanceForm,
              isActive: controller.showFreelanceForm.value,
              themeController: themeController,
              isMobile: isMobile,
            ),
          ],
        ),
        SizedBox(height: 30),

        // Forms
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: Column(
            children: [
              if (controller.showHireForm.value)
                _buildHireForm(controller, themeController, isMobile),
              if (controller.showFreelanceForm.value)
                _buildFreelanceForm(controller, themeController, isMobile),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPixelButton({
    required String text,
    required VoidCallback onPressed,
    required bool isActive,
    required ThemeController themeController,
    required bool isMobile,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 24,
          vertical: isMobile ? 12 : 16,
        ),
        decoration: BoxDecoration(
          color: isActive
              ? Colors.amber.shade400
              : (themeController.isDarkMode.value
                    ? Colors.grey.shade800
                    : Colors.white),
          border: Border.all(
            width: 2,
            color: themeController.isDarkMode.value
                ? Colors.amber.shade300
                : Colors.black,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: Colors.amber.shade600,
                offset: Offset(4, 4),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            if (!isActive)
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(4, 4),
                blurRadius: 0,
                spreadRadius: 0,
              ),
          ],
        ),
        child: Text(
          text,
          style: GoogleFonts.pixelifySans(
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.bold,
            color: isActive
                ? Colors.black
                : (themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildHireForm(
    ContactController controller,
    ThemeController themeController,
    bool isMobile,
  ) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value
            ? Colors.black.withOpacity(0.5)
            : Colors.white.withOpacity(0.8),
        border: Border.all(width: 2, color: Colors.amber.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Form(
        key: controller.hireFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hire Me Form",
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber.shade400,
              ),
            ),
            SizedBox(height: 20),

            _buildPixelTextField(
              controller: controller.companyNameController,
              label: "Company Name",
              validator: (value) =>
                  controller.validateRequired(value, "Company Name"),
              themeController: themeController,
            ),
            SizedBox(height: 16),

            _buildPixelTextField(
              controller: controller.companyEmailController,
              label: "Company Email",
              validator: controller.validateEmail,
              themeController: themeController,
            ),
            SizedBox(height: 16),

            _buildPixelTextField(
              controller: controller.jobTitleController,
              label: "Job Title",
              validator: (value) =>
                  controller.validateRequired(value, "Job Title"),
              themeController: themeController,
            ),
            SizedBox(height: 20),

            _buildSubmitButton(
              text: "Send Email",
              onPressed: controller.sendHireEmail,
              themeController: themeController,
              isMobile: isMobile,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFreelanceForm(
    ContactController controller,
    ThemeController themeController,
    bool isMobile,
  ) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value
            ? Colors.black.withOpacity(0.5)
            : Colors.white.withOpacity(0.8),
        border: Border.all(width: 2, color: Colors.amber.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Form(
        key: controller.freelanceFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Freelance Project",
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber.shade400,
              ),
            ),
            SizedBox(height: 20),

            _buildPixelTextField(
              controller: controller.nameController,
              label: "Your Name",
              validator: (value) => controller.validateRequired(value, "Name"),
              themeController: themeController,
            ),
            SizedBox(height: 16),

            _buildPixelTextField(
              controller: controller.phoneController,
              label: "Phone Number",
              validator: controller.validatePhone,
              themeController: themeController,
            ),
            SizedBox(height: 16),

            _buildPixelTextField(
              controller: controller.ideaController,
              label: "Project Idea",
              validator: (value) =>
                  controller.validateRequired(value, "Project Idea"),
              maxLines: 4,
              themeController: themeController,
            ),
            SizedBox(height: 20),

            _buildSubmitButton(
              text: "Send WhatsApp",
              onPressed: controller.sendWhatsAppMessage,
              themeController: themeController,
              isMobile: isMobile,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPixelTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?)? validator,
    required ThemeController themeController,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      style: GoogleFonts.pixelifySans(
        fontSize: 14,
        color: themeController.isDarkMode.value ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.dmSans(
          fontSize: 12,
          color: themeController.isDarkMode.value ? Colors.white : Colors.black,
        ),
        filled: true,
        fillColor: themeController.isDarkMode.value
            ? Colors.grey.shade900
            : Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: themeController.isDarkMode.value
                ? Colors.white
                : Colors.black,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.amber.shade300, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  Widget _buildSubmitButton({
    required String text,
    required VoidCallback onPressed,
    required ThemeController themeController,
    required bool isMobile,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: isMobile ? 12 : 16),
        decoration: BoxDecoration(
          color: Colors.amber.shade400,
          border: Border.all(
            width: 2,
            color: themeController.isDarkMode.value
                ? Colors.amber.shade300
                : Colors.black,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.shade600,
              offset: Offset(4, 4),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.pixelifySans(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLottieAnimation() {
    return Container(
      height: 300,
      child: Lottie.asset(
        "assets/designer.json",
        fit: BoxFit.contain,
        repeat: true,
        animate: true,
      ),
    );
  }
}
