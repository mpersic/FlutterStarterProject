import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/src/ui/components/app_bloc/app_bloc.dart';

import 'src/core/core.dart';

void main() async {
  await configureDependencies();

  runApp(const PlantHealthApp());
}

class PlantHealthApp extends StatefulWidget {
  const PlantHealthApp({super.key});

  @override
  State<PlantHealthApp> createState() => _PlantHealthAppState();
}

class _PlantHealthAppState extends State<PlantHealthApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => AppBloc()..add(AppInit()),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            title: 'Flutter Demo',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: MyAppThemes.lightTheme,
            themeMode: state.themeMode,
            locale: state.locale,
            darkTheme: MyAppThemes.darkTheme,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
