// ignore_for_file: unrelated_type_equality_checks

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_verification/controllers/phone_Authentication.dart';
import 'package:otp_verification/screens/otp_screen.dart';
import 'package:otp_verification/widgets/app_TextStyle.dart';
import 'package:otp_verification/widgets/colors.dart';
import 'package:otp_verification/widgets/common_Button.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Country selectedCountry = Country(
    phoneCode: '977',
    countryCode: "NP",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Nepal',
    example: 'Nepal',
    displayName: 'NP',
    displayNameNoCountryCode: 'NP',
    e164Key: "",
  );

  //send OTP

  sendOTP() async {
    await PhoneAuthentication().sendOTPCode(
      phoneController.text,
      (String verId) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OTPScreen(verification: verId),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/homeScreen');
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/img_2.jpg',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Text(
                    'Verify Phone Number',
                    style: appTextStyle(
                        ColorTheme.blackColor, FontWeight.bold, 16),
                  ),
                  Text(
                    'A OTP of 6 digit code will be sent to your phone number',
                    style: appTextStyle(
                        ColorTheme.blackColor, FontWeight.w500, 12),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: phoneController,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter phone number';
                        }
                        if (value.length != 10) {
                          return 'Enter 10 digit number';
                        }

                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          phoneController.text = value;
                        });
                      },
                      autofillHints: const [AutofillHints.oneTimeCode],
                      decoration: InputDecoration(
                        hintText: 'Enter phone number',
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              showCountryPicker(
                                  context: context,
                                  countryListTheme: const CountryListThemeData(
                                    flagSize: 20,
                                    bottomSheetHeight: 400,
                                  ),
                                  onSelect: (value) {
                                    setState(() {
                                      selectedCountry = value;
                                    });
                                  });
                            },
                            child: Text(
                                '${selectedCountry.flagEmoji}+ ${selectedCountry.phoneCode}'),
                          ),
                        ),
                        suffixIcon: phoneController.text.length > 9
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorTheme.greenColor,
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: ColorTheme.whiteColor,
                                  ),
                                ),
                              )
                            : null,
                        hintStyle: appTextStyle(
                            ColorTheme.blackColor, FontWeight.w300, 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CommonButton(
                      title: 'Continue',
                      color: ColorTheme.commonColor,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          sendOTP();
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
