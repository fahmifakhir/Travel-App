import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/ui/pages/bonus_page.dart';
import 'package:airplane/ui/pages/get_started_page.dart';
import 'package:airplane/ui/pages/main_pages.dart';
import 'package:airplane/ui/pages/sign_in_page.dart';
import 'package:airplane/ui/pages/sign_up_page.dart';
import 'package:airplane/ui/pages/splash_page.dart';
import 'package:airplane/ui/pages/success_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  // print('APIKEY: ${dotenv.env['APIKEY']}');
  // print('APPID: ${dotenv.env['APPID']}');
  // print('MESSAGESENDERID: ${dotenv.env['MESSAGESENDERID']}');
  // print('PROJECTID: ${dotenv.env['PROJECTID']}');

  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: dotenv.env['APIKEY']!,
        appId: dotenv.env['APPID']!,
        messagingSenderId: dotenv.env['MESSAGESENDERID']!,
        projectId: dotenv.env['PROJECTID']!,
      ),
    );
    print('Firebase initialization successful');
  } catch (e) {
    print('Firebase initialization failed: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/success': (context) => SuccessCheckoutPage(),
        },
      ),
    );
  }
}
