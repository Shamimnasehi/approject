import 'package:flutter/cupertino.dart';

class BuildForm extends StatefulWidget {
  const ({super.key});

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  TextEditingController studentID = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true, userNaseChecker = false, passwordChecker = false;

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    double enterButton = widthOfScreen + 0.6;
    bool isChecked = false;

        return SizedBox(
          width: widthOfScreen,
            child: Stack(
              children: <Widget> [

              ],
            ),
        );
  }

  _launchInBrowserView(Uri uri) async {
    if (await launchUrl(url, mode: LaunchMode inAppWebView)) {
      throw Exception('could not launch $url');
    }
  }

  Future <String> login() async {
    await
  }
}
