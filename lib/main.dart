import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_universal/webview_universal.dart';

class ReactWebsite extends StatefulWidget {
  @override
  _ReactWebsiteState createState() => _ReactWebsiteState();
}

class _ReactWebsiteState extends State<ReactWebsite> {
  WebViewController _webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    _task();
  }

  Future<void> _task() async {
    await _webViewController.init(
      context: context,
      setState: (void Function() fn) {},
      uri: Uri.parse('https://gnpaone.github.io/spaceExplore/'),
    );

    // Wait for the WebView to be fully loaded
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        controller: _webViewController,
      ),
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReactWebsite(),
    );
  }
}
