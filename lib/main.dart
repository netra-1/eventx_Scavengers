
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

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
        routes: {
          '/bottomNavBar': (context) => const BottomNavBar(),

          // Event Bookingdis
          '/chooseVenue': (context) => const ChooseVenueScreen(),
          '/chooseEvent': (context) => const ChooseEventScreen(),
          '/chooseTheme':(context) => const ChooseThemeScreen(),
          '/chooseDrinks':(context) => const ChooseDrinksScreen(),
          '/chooseDrinksCategory':(context) => const ChooseDrinksCategoryScreen(),
          '/chooseCakes':(context) => const ChooseCakesScreen(),
          '/chooseCreateEventScreen':(context)=> const ChooseCreateEventScreen(),
          '/chooseDecorationScreen':(context)=> const ChooseDecorationsScreen(),
          '/detailsScreen':(context) => const DetailsScreen(),

          // Edit Selections
          '/editVenue' :(context) => const EditVenueScreen(),
          '/editEvent' :(context) => const EditEventScreen(),
          '/editTheme':(context) => const EditThemeScreen(),
          '/editCakes':(context) => const EditCakesScreen(),
          '/editDecoration':(context) => const EditDecorationsScreen(),
          '/editDrinks':(context) => const EditDrinksScreen(),
          '/editDrinksCategory':(context) => const EditDrinksCategoryScreen(),
          '/editDetailsScreen':(context) => const EditDetailsScreen(),

          // Khalti Payment
          '/khaltiPaymentScreen':(context) =>const KhaltiPaymentScreen(),
          '/khaltiPaymentDraftScreen':(context) =>const KhaltiPaymentDraftScreen(),
          
          // Auth User
          '/login':(context) => const LoginScreen(),
          '/register':(context) => const RegisterScreen(),
          '/OTPVerification':(context) => const OTPVerification(),
          '/forgotPassword':(context) => const ForgotPasswordScreen(),
          '/resetPassword':(context) => const ResetPasswordScreen(),
          '/changePassword':(context) => const ChangePasswordScreen(),

          // Chat with Staff
          // '/chat':(context) => const EventXChatPage(),
          '/chatStaff':(context) => const StaffChatPage(),

          // Draft Events
          '/detailsScreenDraft':(context) => const DetailsScreenDraft(),
          '/eventTrack':(context) => const TrackEvent(),
          '/savedDraft':(context) => const SavedDraftScreen(),

          // for trying
          '/pastEventsScreen':(context) => const PastBookedEventsScreen(),

          // for Profile
          '/editProfile':(context) => const EditProfileScreen(),
          '/termsAndCondition':(context) => TermsConditionsPage(),
          '/contactUs':(context) => ContactUsPage(),
          '/aboutUs':(context) => AboutUsPage(),
          '/notificationScreen':(context) => const NotificationScreen(),
        },
      );}
    ),
  );
}
