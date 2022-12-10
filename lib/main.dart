import 'package:assignment4/Cal/calculator.dart';
import 'package:assignment4/weather_display.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:weather_icons/weather_icons.dart';

import 'greeting.dart';

/*IconButton(
iconSize: 50,
color: Colors.blue,
onPressed: () {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text('Icon button is pressed')));
},
icon: Icon(
Icons.ads_click,
),
)*/

void main() {
  setPathUrlStrategy();
  return runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static const String title = 'My Tools Buddy';

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerDelegate: _router.routerDelegate,
    routeInformationParser: _router.routeInformationParser,
    routeInformationProvider: _router.routeInformationProvider,
  );

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => ErrorScreen(error:state.error),
    routes: <GoRoute>[
      GoRoute(

        routes: <GoRoute>[
          GoRoute(
            path: 'greetings',
            builder: (BuildContext context, GoRouterState state) =>
            Greetings(),
          ),
          GoRoute(
            path: 'weather',
            builder: (BuildContext context, GoRouterState state) =>
                WeatherDisplay(),

          ),
          GoRoute(
            path: 'calculator',
            builder: (BuildContext context, GoRouterState state) =>
            const Calculator(),

          ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
        const InitialScreen(),
      ),
    ],

  );
}

/// The screen of the first page.
class InitialScreen extends StatelessWidget {
  /// Creates a [InitialScreen].
  const InitialScreen({Key? key}) : super(key: key);
  static const IconData calculate_icon = IconData(0xe121, fontFamily: 'MaterialIcons');
  static const IconData cloud_circle_rounded = IconData(0xf64b, fontFamily: 'MaterialIcons');
  static const IconData handshake_rounded = IconData(0xf06cb, fontFamily: 'MaterialIcons');


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(App.title)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: ()  => context.go('/greetings'),
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue)),
                  child: Column(
                    children: <Widget>[
                      Icon(handshake_rounded, color: Colors.blue,
                        size: 100),
                      Text('Greetings', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
          ),

          GestureDetector(
            onTap: ()  => context.go('/weather'),
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.blue)),
              child: Column(
                children: <Widget>[
                  Icon(cloud_circle_rounded, color: Colors.blue,
                      size: 100),
                  Text('Weather API', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: ()  => context.go('/calculator'),
            child: Container(

              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
                width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.blue)),
              child: Column(
                children: <Widget>[
                  Icon(calculate_icon, color: Colors.blue,
                      size: 100),
                  Text('Calculator', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              )
            ),
          )
        ],
      ),
    ),
  );
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen( {Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),

      ),
      body: Center(
        child: Text(
            error.toString()
        ),
      ),
    );
  }
}