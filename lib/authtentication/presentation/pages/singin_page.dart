import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kot/authtentication/data/model/email_model.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import '../../data/model/register_otp_params_model.dart';
import '../../data/repository/email_repo.dart';
import '../widgets/custom_buttons.dart';
import 'email_otp_page.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  String? appSignature;
  bool isResumed = false;
  Timer? _timer;
  bool isTimer = false;
  String countryCode = "+1";
  bool _isEmailValid = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getMobileNumber();
  }

  void _validateEmail(String email) {
    setState(() {
      _isEmailValid = EmailValidator.validate(email);
    });
  }

  Future<void> sendEmail() async {
    String? gmailUsername =
        "hemanitest@gmail.com"; // Replace with your Gmail username
    const String gmailPassword =
        "bamfiksbmwfiklyq"; // Replace with your Gmail password
    // EmailModel emailResponse =
    //     await AuthEmailRepository().emailLogin(email: _emailController.text);

    String senderEmail = gmailUsername;
    String recipientEmail = _emailController.text;
    // emailResponse.toString();
    String otp = "123456"; // Your OTP
    // print('Email Response: $emailResponse');

    final smtpServer = gmail(gmailUsername, gmailPassword);

    // Create a message
    final message = Message()
      ..from = Address(senderEmail)
      ..recipients.add(recipientEmail)
      ..subject = "Email Subject: OTP Verification" // Set the email subject
      ..text = "Your OTP is: $otp" // Set the email body with OTP
      ..html = "<h1>OTP Verification</h1>"
          "<p>Your OTP is: <strong>$otp</strong></p>"; // Set the email content with OTP in HTML format

    try {
      // Send the email
      final sendReport = await send(message, smtpServer);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmailOtpScreen(
            emailAddress: _emailController.text,
          ),
        ),
      );
      // print('Message sent: ${sendReport.toString()} for ${recipientEmail}');
    } on MailerException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Email not sent; please try again.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
      // print('Message not sent.\n${e.message}');
    } catch (e) {
      print('An error occurred while sending the email.\n$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      //  extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: SvgPicture.asset(
          'assets/app_background.svg',
          fit: BoxFit.fill,
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 200,
        title: const Text(
          "Welcome",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Hello, nice to meet you!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "SIGN IN!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              _buildPhonefiled(),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "OR",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 10,
                color: Colors.white,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    errorText:
                        _isEmailValid ? null : 'Enter a valid email address',
                    hintStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold), //hint text style
                    labelStyle:
                        const TextStyle(fontSize: 13, color: Colors.blue),
                  ),
                  onChanged: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "By creating an account, you agree to our",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Terms of Service and Privacy Policy",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
          child: BorderButton(
            borderColor: CustomColor.colorPrimary,
            // onPressed: () async {
            //   if (_mobileController.text.length < 10) {
            //     print("164 mobbile is incorrect");
            //     return;
            //   }
            //   if (countryCode.isEmpty) {
            //     print("169 select country code");
            //
            //     return;
            //   }
            //
            //   ///
            //   // Call the email API
            //   try {
            //     await AuthEmailRepository()
            //         .emailLogin(email: _emailController.text);
            //
            //     // Send the email after successful API call
            //     await sendEmail();
            //     // Navigate to the next screen
            //   } catch (e) {
            //     print("Error while calling the email API: $e");
            //     // Handle error as needed
            //   }
            // },

            ///>>>>>>..
            onPressed: () async {
              if (_mobileController.text.length >= 10) {
                // Phone number and country code are provided, perform phone login
                try {
                  // Call the phone login API
                  if (countryCode.isEmpty) {
                    print("169 select country code");

                    return;
                  }
                  Navigator.pushNamed(context, MyRouters.REGISTER_OTP,
                      arguments: RegisterOtpParams(
                        countryCode: countryCode,
                        mobile: _mobileController.text,
                      ));
                  // Navigate to the next screen after successful API call
                } catch (e) {
                  print("Error while calling the phone API: $e");
                  // Handle error as needed
                }
              } else if (_emailController.text.isNotEmpty) {
               await sendEmail();
                // try {
                //   await sendEmail();
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => EmailOtpScreen(
                //         emailAddress: _emailController.text,
                //       ),
                //     ),
                //   );
                //
                //   // Navigate to the next screen after sending email
                // } catch (e) {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //     content: Text(
                //       'Email not sent; please try again.',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     backgroundColor: Colors.red,
                //   ));
                // }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Please enter either a valid email or phone number.',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            },

            ///>>>>>>>>
            //   await sendEmail();
            //
            //   Navigator.pushNamed(context, MyRouters.REGISTER_OTP,
            //       arguments: RegisterOtpParams(
            //         countryCode: countryCode,
            //         mobile: _mobileController.text,
            //       ));
            // },
            backgroundColor: CustomColor.colorPrimary,
            borderRadius: 8,
            width: (MediaQuery.of(context).size.width) - 30,
            height: 40,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColor.colorWhite,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.arrow_forward_outlined,
                  size: 20,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildPhonefiled() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 80,
      child: IntlPhoneField(
        decoration: const InputDecoration(
          counter: Offstage(),
          labelText: 'Mobile Number',
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'US',
        showDropdownIcon: true,
        dropdownIconPosition: IconPosition.trailing,
        onChanged: (phone) {
          countryCode = phone.countryCode.replaceAll("+", "");
          _mobileController.text = phone.number;
        },
      ),
    );
  }

  _timerCancel() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
  }
}
