import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String validPin = "2345";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  headerText(),
                  const SizedBox(
                    height: 20,
                  ),
                  subHeadingtext(),
                  const SizedBox(
                    height: 20,
                  ),
                  numberText()
                ],
              ),
              pinInputForm(),
              resendCodeLink()
            ],
          ),
        ),
      ),
    );
  }

  Widget headerText() {
    return const Text("Verification",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26));
  }

  Widget subHeadingtext() {
    return const Text("Enter the code sent to the number",
        style: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 16, color: Colors.black38));
  }

  Widget numberText() {
    return const Text("+91 810 968 4841",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16));
  }

  Widget pinInputForm() {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Pinput(
            validator: (value) {
              return value == validPin ? null : "Pin is incorrect";
            },
            onCompleted: (pin) {
              print("Success: $pin");
            },
            errorBuilder: (errorText, pin) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: Text(
                    errorText ?? "",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            },
          ),
          TextButton(
              onPressed: () {
                formkey.currentState!.validate();
              },
              child: Text("Validate"))
        ],
      ),
    );
  }

  Widget resendCodeLink() {
    return const Text("Didn't get the code. \nResend Code ?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 16,
        ));
  }
}
