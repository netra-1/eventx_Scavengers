import 'package:flutter/material.dart';

void main() {
  runApp(
    KhaltiScope(
      publicKey: "test_public_key_fc942fd24afb4b839cd34a596eb4ce8c",
        builder: (context, navigatorKey) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
        initialRoute: '/login',
        routes: const {
          },
      );}
    ),
  );
}
