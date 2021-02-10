import 'package:flutter/material.dart';

// Slim version of log in page that passes a verification code up the widget tree
class VerificationPage extends StatefulWidget {
  final ValueChanged<String> didProvideVerificationCode;

  VerificationPage({Key key, this.didProvideVerificationCode}) :
    super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _verificationCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 40),
        child: _verificationForm(),
      ),
    );
  }

  Widget _verificationForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Verification code text field
        TextField(
          controller: _verificationCodeController,
          decoration: InputDecoration(
            icon: Icon(Icons.confirmation_number),
            labelText: "Verification Code",
          ),
        ),
        // Verify Button
        FlatButton(
          onPressed: _verify,
          child: Text("Verify"),
          color: Theme.of(context).accentColor,
        )
      ]
    );
  }


  void _verify() {
    final verificationCode = _verificationCodeController.text.trim();
    widget.didProvideVerificationCode(verificationCode);
  }
}