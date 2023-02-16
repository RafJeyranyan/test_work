import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/view/home/home_screen.dart';
import 'package:test_work/view/no_connection/no_connection_screen.dart';

import 'cubits/connection/connection_cubit.dart';
import 'cubits/connection/connection_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (_) => InternetCubit(connectivity: Connectivity()),
        ),
        //...
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: kNavigatorKey,
        builder: (context, child) {
          return BlocListener<InternetCubit, InternetState>(
            listener: (context, state) {
              if (kDebugMode) {
                print(state.type);
              }
              late final Widget page;
              switch (state.type) {
                case InternetTypes.connected:
                  page = const HomeScreen();
                  break;
                case InternetTypes.offline:
                  page = const NoConnection();
                  break;
                default:
                  page = const Center(
                    child: CircularProgressIndicator(),
                  );
              }
              kNavigatorKey.currentState!.push(MaterialPageRoute(
                builder: (_) => page,
              ));
            },
            child: child,
          );
        },
        home: const Center(
          child: CircularProgressIndicator(),
        ),
    );
  }
}
