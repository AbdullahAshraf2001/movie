import 'package:flutter/material.dart';
import 'package:movie/presentation/app_routes.dart';

void main() {
  runApp(MoviesApp(appRouter: AppRouter(),));
}

class MoviesApp extends StatelessWidget {

  final AppRouter appRouter;

  const MoviesApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}