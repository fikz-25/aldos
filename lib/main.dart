import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:http_logger/http_logger.dart';
import 'package:http_middleware/http_middleware.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
  //   HttpLogger(logLevel: LogLevel.BODY),
  // ]);

  // var remoteDataSource = RemoteDataSource(
  //     ServiceApi(httpClient: httpClient, baseUrl: Strings.BASE_URL));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aldo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnBoarding(),
    );
  }
}
