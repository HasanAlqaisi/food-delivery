import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:karrishni/core/global_widgets/rounded_red_button.dart';
import 'package:karrishni/representation/auth/controller/phone_verification_controller.dart';
import 'package:karrishni/representation/auth/widgets/label_field_widget.dart';

class SmsCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: GetBuilder<PhoneVerifController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildIcon(
                    path: 'images/auth_message_icon.png',
                    width: 150,
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                    child: _buildNameFieldWidget(controller),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                    child: Obx(
                      () => controller.isLoading.value
                          ? Center(child: CircularProgressIndicator())
                          : RoundedRedButton(
                              text: 'Sign in',
                              onPressed: controller.onSignInPressed,
                            ),
                    ),
                  ),
                ],
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
        node: controller.smsNode,
        label: 'Enter sms code',
        onChanged: (name) => controller.smsCode = name,
      ),
    );
  }
}
