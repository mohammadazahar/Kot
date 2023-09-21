import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kot/authtentication/data/model/email_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../boat_booking/presentation/widgets/custom_buttons.dart';
import '../../../custom_color.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../../../my_routes.dart';
import '../../data/repository/resend_email_otp.dart';

class EmailOtpScreen extends StatefulWidget {
  final String? emailAddress;

  const EmailOtpScreen({super.key, this.emailAddress});
  @override
  _EmailOtpScreenState createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<EmailOtpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController =
      TextEditingController(); // Pre-filled OTP

  String _currentCode = "123456";
  FocusNode _focusNode = FocusNode();

  Future<void> resendEmail() async {
    String? gmailUsername =
        "hemanitest@gmail.com"; // Replace with your Gmail username
    const String gmailPassword =
        "bamfiksbmwfiklyq"; // Replace with your Gmail password
    // final emailResponse = await AuthResendEmailRepository()
    //     .resendEmailLogin(email: widget.emailAddress);
    String senderEmail = gmailUsername;
    String? recipientEmail = widget.emailAddress;
    String otp = "123456"; // Your OTP

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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Email sent successfully. Please check your mail id.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
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
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 54,
                width: double.infinity,
                child: RichText(
                  text: TextSpan(
                    text: 'Enter the 6-digit code sent to ',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    // This will apply the default style
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.emailAddress!
                            .substring(0, 2), // Display first two characters
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24),
                      ),
                      TextSpan(
                        text:
                            '*******${widget.emailAddress!.substring(widget.emailAddress!.indexOf('@'))}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize:
                                24), // Maintain the default style for the rest of the text
                      ),
                    ],
                  ),
                ),
                // child: Text(
                //   // "",
                //   "Enter the 6 - digit code sent to at ${widget.emailAddress!}", //StringConstants.otp,
                // ),
              ),
              const SizedBox(
                height: 30,
              ),
              PinFieldAutoFill(
                currentCode: _currentCode,
                onCodeSubmitted: (code) {
                  _currentCode = code;
                },
                focusNode: _focusNode,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onCodeChanged: (code) {
                  _currentCode = code ?? "";
                },
                decoration: BoxLooseDecoration(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  strokeColorBuilder: FixedColorBuilder(Colors.grey[300]!),
                  bgColorBuilder:
                      const FixedColorBuilder(CustomColor.colorWhite),
                ),
                codeLength: 6,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  resendEmail();
                },
                style: ElevatedButton.styleFrom(
                  primary: CustomColor.colorPrimary,
                ),
                child:
                    const Text("Resend", style: TextStyle(color: Colors.white)),
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
            onPressed: () {
              verifyOtp(_currentCode);
            },
            backgroundColor: CustomColor.colorPrimary,
            borderRadius: 8,
            width: (MediaQuery.of(context).size.width) - 30,
            height: 40,
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "verifyOtp",
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

  // Function to verify the OTP
  void verifyOtp(String enteredOtp) {
    if (enteredOtp == '123456') {
      Navigator.pushNamed(
        context,
        MyRouters.THANKYOU,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Invalid OTP. Please try again.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
