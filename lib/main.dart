import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: App(),
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
              print(state.type);
              late final Widget page;
              switch (state.type) {
                case InternetTypes.connected:
                  page = Scaffold(
                    body: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  );
                  break;
                case InternetTypes.offline:
                  page = Scaffold(
                    body: Container(
                      width: 100,
                      height: 100,
                      color: Colors.greenAccent,
                    ),
                  );
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
        home: const Center(child: CircularProgressIndicator(),)
    );
  }
}
