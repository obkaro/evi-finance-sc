import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterFlowTheme.initialize();

  FFAppState(); // Initialize FFAppState

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  Stream<EviFirebaseUser> userStream;
  EviFirebaseUser initialUser;
  bool displaySplashImage = true;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = eviFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evi',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.white,
              child: Center(
                child: Builder(
                  builder: (context) => Image.asset(
                    'assets/images/Group_20_(2).png',
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : currentUser.loggedIn
              ? PushNotificationsHandler(child: NavBarPage())
              : LandPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'Dashboard';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Dashboard': DashboardWidget(),
      'ActiveBudget': ActiveBudgetWidget(),
      'Accounts': AccountsWidget(),
      'Settings': SettingsWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: Colors.black,
        selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
        unselectedItemColor: Color(0xFF5D5B5B),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home_rounded,
              size: 32,
            ),
            label: 'Dashboard',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pie_chart_rounded,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.pie_chart_rounded,
              size: 32,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_rounded,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.account_balance_rounded,
              size: 32,
            ),
            label: 'Accounts',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_rounded,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.settings_rounded,
              size: 32,
            ),
            label: 'Profile',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
