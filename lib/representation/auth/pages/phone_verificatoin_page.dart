import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karrishni/core/global_widgets/rounded_red_button.dart';
import 'package:karrishni/representation/auth/controller/phone_verification_controller.dart';
import 'package:karrishni/representation/auth/widgets/label_field_widget.dart';

class PhoneVerifictionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GetBuilder<PhoneVerifController>(
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildIcon(
                      path: 'images/karrishni_icon.png',
                      width: 150.0,
                      height: 150.0,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 8.0),
                      child: _buildNameFieldWidget(controller),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 8.0),
                      child: _buildPhoneFieldWidget(controller),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 8.0),
                      child: Obx(
                        () => controller.isLoading.value
                            ? Center(child: CircularProgressIndicator())
                            : RoundedRedButton(
                                text: 'NEXT',
                                onPressed: () => controller.onNextPressed(),
                              ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildIcon({required String path, double? width, double? height}) {
    return Image.asset(path, width: width, height: height);
  }

  Widget _buildNameFieldWidget(PhoneVerifController controller) {
    return Focus(
      onFocusChange: controller.onFocusChange,
      child: LabelFieldWidget(
        node: controller.nameFocus,
        label: 'Name',
        hint: 'Hasan',
        onChanged: (name) => controller.name = name,
      ),
    );
  }

  Widget _buildPhoneFieldWidget(PhoneVerifController controller) {
    return Focus(
        onFocusChange: controller.onFocusChange,
        child: LabelFieldWidget(
          node: controller.phoneFocus,
          label: 'Phone',
          hint: '+964..',
          onChanged: (phoneNumber) => controller.phoneNumber = phoneNumber,
        ));
  }
}
