import 'package:flutter/material.dart';
import 'package:movie/presentation/screens/movies_screen.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => MoviesScreen());
    }
  }
}