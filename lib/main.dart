import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReactWebsite extends StatefulWidget {
  final String currentPlanet;

  ReactWebsite({required this.currentPlanet});

  @override
  _ReactWebsiteState createState() => _ReactWebsiteState();
}

class _ReactWebsiteState extends State<ReactWebsite> {
  WebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://gnpaone.github.io/spaceExplore/', // Replace this with the actual URL
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _webViewController = controller;
          _updateCurrentPlanet();
        },
      ),
    );
  }

  void _updateCurrentPlanet() async {
    // Wait for the WebView to be fully loaded
    await Future.delayed(Duration(seconds: 1));

    // Execute JavaScript code to set the currentPlanet value in the loaded website
    await _webViewController?.evaluateJavascript(
      "window.currentPlanet = '${widget.currentPlanet}';",
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReactWebsite(
        currentPlanet: 'uranus',
      ),
    );
  }
}


