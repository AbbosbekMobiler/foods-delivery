import 'package:flutter/material.dart';
import 'package:foods_delivery/route/app_route_name.dart';
import 'package:foods_delivery/screens/home_screen/home_screen.dart';

class AppRoute{

  Route<dynamic>? generate(RouteSettings settings){
    switch(settings.name){
      case AppRouteName.homeScreen :
        return MaterialPageRoute(
          settings: settings,
          builder: (_)=> const HomeScreen()
        );
    }

  }

}