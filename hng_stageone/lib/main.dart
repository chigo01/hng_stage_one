import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        scaffoldBackgroundColor: const Color(0xff212121),
        useMaterial3: true,
      ),
      home: const FavourHome(title: 'Favour Baruch Profile'),
    );
  }
}

class FavourHome extends StatefulWidget {
  const FavourHome({super.key, required this.title});

  final String title;

  @override
  State<FavourHome> createState() => _FavourHomeState();
}

class _FavourHomeState extends State<FavourHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://ca.slack-edge.com/T05FFAA91JP-U05RZ4B30QG-a0681347b7fc-512',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 280,
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Baruch Favour',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _buildWebView(),
                          ),
                        );
                      },
                      child: const Text(
                        'Open Github',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildWebView() {
  final controller = WebViewController()
    ..setBackgroundColor(const Color(0xff212121))
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://github.com/chigo01'))
    ..setNavigationDelegate(NavigationDelegate(
      onPageStarted: (url) {},
      onPageFinished: (url) {},
    ));

  return WebViewWidget(controller: controller);
}
